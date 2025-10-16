local suc, socket = pcall(require, 'socket')
local clock = suc and socket.gettime or os.clock

local profile = {
    profiledTasks = {},
    profiledTaskCoroutines = {},
}

local _labeled={}  -- function labels
local _defined={}  -- function definitions
local _tcalled={}  -- time of last call
local _telapsed={} -- total execution time
local _ncalls={}   -- number of calls
local _callers={}  -- list of function callers
local _internal={} -- list of internal profiler functions

local getInfo=debug.getinfo
local function _hooker(event)
    local info = getInfo(2, "fnS")
    local f = info.func
    if _internal[f] then return end

    -- store function definition if first time seen
    if not _defined[f] then
        _defined[f] = (profile.profiledTasks[f] and "<async>@" or "") .. info.short_src .. ":" .. info.linedefined
        _ncalls[f] = 0
        _telapsed[f] = 0
        -- store function label separately
        if info.name then _labeled[f]=info.name end -- get the function name if available
    end

    if _tcalled[f] then
        local dt = clock() - _tcalled[f]
        _telapsed[f] = _telapsed[f] + dt
        _tcalled[f] = nil
    end

    if event == "tail call" then
        _hooker("return", getInfo(3, "fnS"))
        _hooker("call", info)
    elseif event == "call" then
        _tcalled[f] = clock()

        -- track caller
        local caller = getInfo(3, "Sl") or profile.profiledTasks[f]
        if caller then
            local caller_id = (caller.short_src or "?") .. ":" .. (caller.currentline or 0)

            -- prepend <async>@ if the caller is within a TASK context
            local co = coroutine.running()
            if co and profile.profiledTaskCoroutines[co] then
                caller_id = "<async>@" .. caller_id
            end

            _callers[f] = _callers[f] or {}
            _callers[f][caller_id] = (_callers[f][caller_id] or 0) + 1
        end
    else  -- return
        if _defined[f] == "main.lua:0" then
            _callers[f] = _callers[f] or {}
            _callers[f]["<root>"] = 1
        end
        _ncalls[f] = _ncalls[f] + 1
    end
end

local function _comp(a,b)
    local dt=_telapsed[b]-_telapsed[a]
    return dt==0 and _ncalls[b]<_ncalls[a] or dt<0
end

---Starts collecting data.
function profile.start()
    local hook = debug.gethook()
    if hook and hook ~= _hooker then error("Cannot start another profiler while one is already running.", 2) end
    if jit then
        jit.off()
        jit.flush()
    end
    debug.sethook(_hooker,'cr')
end

---Stops collecting data.
function profile.stop()
    debug.sethook()
    for f in next,_tcalled do
        local dt=clock()-_tcalled[f]
        _telapsed[f]=_telapsed[f]+dt
        _tcalled[f]=nil
    end
    -- merge closures
    local lookup={}
    for f,d in next,_defined do
        local id=(_labeled[f] or "?")..d
        local f2=lookup[id]
        if f2 then
            _ncalls[f2]=_ncalls[f2]+(_ncalls[f] or 0)
            _telapsed[f2]=_telapsed[f2]+(_telapsed[f] or 0)
            _defined[f],_labeled[f]=nil,nil
            _ncalls[f],_telapsed[f]=nil,nil
        else
            lookup[id]=f
        end
    end
    collectgarbage()
end

---Resets all collected data.
function profile.reset()
    for f in next,_ncalls do
        _ncalls[f]=0
        _telapsed[f]=0
        _tcalled[f]=nil
    end
    profile.profiledTasks = {}
    profile.profiledTaskCoroutines = {}
    collectgarbage()
end

local function callerSortFunc(a, b)
    -- extract count
    local countA = tonumber(a:match("%((%d+)%)$")) or 0
    local countB = tonumber(b:match("%((%d+)%)$")) or 0
    if countA ~= countB then
        return countA > countB  -- descending
    end

    -- extract "file:line" for tie-breaker
    local idA = a:match("^(.-) %(") or a
    local idB = b:match("^(.-) %(") or b
    local srcA, lineA = idA:match("^(.-):(%-?%d+)$")
    local srcB, lineB = idB:match("^(.-):(%-?%d+)$")

    if srcA == srcB and lineA and lineB then
        return tonumber(lineA) < tonumber(lineB)
    end
    return (srcA or "") < (srcB or "")
end

---Iterates all functions that have been called since the profile was started.
---@param limit? number limit the number of functions to return
function profile.query(limit)
    local t = {}
    for f,n in pairs(_ncalls) do
        if n > 0 then t[#t+1] = f end
    end
    table.sort(t,_comp)
    if limit then while #t>limit do table.remove(t) end end

    for i,f in ipairs(t) do
        local dt = 0
        if _tcalled[f] then dt = clock() - _tcalled[f] end
        
        -- convert callers table into strings
        local callers_str = ""
        if _callers[f] then
            local tmp = {}
            for caller_id, count in pairs(_callers[f]) do
                if caller_id ~= "<root>" then
                    tmp[#tmp+1] = string.format("%s (%d)", caller_id, count)
                else tmp[#tmp+1] = "<root>" end
            end
            table.sort(tmp, callerSortFunc)
            callers_str = table.concat(tmp, ", ")
        end

        local elapsed = _telapsed[f]+dt
        t[i]={i,_labeled[f] or "?",elapsed >= 1e-6 and string.format("%.6f", math.floor(elapsed*1e6)/1e6) or "0",_ncalls[f],_defined[f],callers_str}
    end
    return t
end

local function wrap_text(s, width)
    local lines = {}
    while #s > width do
        lines[#lines+1] = s:sub(1, width)
        s = s:sub(width+1)
    end
    lines[#lines+1] = s
    return lines
end

local cols = {3, 20, 8, 6, 32, 40}
---Generate the datasheet
---@param limit? number limit the number of functions to return
---@return string
function profile.report(limit)
    local out = {}
    local report = profile.query(limit)

    for _, row in ipairs(report) do
        local i     = tostring(row[1])
        local func  = tostring(row[2])
        local time  = tostring(row[3])
        local calls = tostring(row[4])
        local code  = tostring(row[5] or "")
        local callers_str = tostring(row[6] or "")

        -- split callers string into individual entries
        local callers = {}
        if callers_str ~= "" then
            for c in callers_str:gmatch("[^,]+") do
                c = c:gsub("^%s+", "")
                local wrapped = wrap_text(c, cols[6])
                for _, w in ipairs(wrapped) do
                    callers[#callers+1] = w
                end
            end
        else
            callers[1] = ""
        end

        -- wrap code column
        local code_wrapped = wrap_text(code, cols[5])

        -- maximum lines needed for this row
        local max_lines = math.max(#code_wrapped, #callers)

        -- first line (with index, func, etc.)
        local s = {i, func, time, calls, code_wrapped[1] or "", callers[1] or ""}
        for j = 1, #s do
            local l1, l2 = #s[j], cols[j]
            if l1 < l2 then
                s[j] = s[j] .. (" "):rep(l2 - l1)
            elseif l1 > l2 then
                s[j] = s[j]:sub(1, l2)
            end
        end
        out[#out+1] = " | " .. table.concat(s, " | ") .. " | "

        -- remaining wrapped lines
        for k = 2, max_lines do
            local s2 = {
                "", "", "", "", code_wrapped[k] or "", callers[k] or ""
            }
            for j = 1, #s2 do
                local l1, l2 = #s2[j], cols[j]
                if l1 < l2 then
                    s2[j] = s2[j] .. (" "):rep(l2 - l1)
                elseif l1 > l2 then
                    s2[j] = s2[j]:sub(1, l2)
                end
            end
            out[#out+1] = " : " .. table.concat(s2, " : ") .. " : "
        end
    end

    local row_sep = " +-----+----------------------+----------+--------+----------------------------------+------------------------------------------+ \n"
    local col_hdr = " | #   | Function             | Time     | Calls  | Code                             | Callers                                  | \n"
    local sz = row_sep .. col_hdr .. row_sep
    if #out > 0 then
        sz = sz .. table.concat(out, "\n") .. "\n"
    end
    return sz .. row_sep
end

local switch=false
---Turn profile mode on/off
---
---Automatically copy the report to clipboard when turned off
---@return boolean #current state
function profile.switch()
    switch=not switch
    if not switch then
        profile.stop()
        local res=profile.report()
        print(res)
        CLIPBOARD.set(res)
        profile.reset()
        return false
    else
        profile.start()
        return true
    end
end

-- store all internal profiler functions
for _,v in next,profile do
    _internal[v]=type(v)=='function'
end

return profile
