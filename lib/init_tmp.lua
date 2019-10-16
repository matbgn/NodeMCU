-- Bootstrap script 
-- Holding button will quick launch start_boot
-- Otherwise it will wait 8 sec to launch start_boot (giving the time to fix errors)
-- WARNING: DO NOT CHANGE THIS FILE UNTIL YOU REALLY KNOW WHAT YOU DO!

print("\n--- Init NodeMCU ---\n")

local mSwitch = 3     -- switch NodeMCU
gpio.mode(mSwitch, gpio.INT, gpio.PULLUP)
local initAlarm = tmr.create()

function quickLaunch()
    gpio.trig(mSwitch, "none")
    tmr.unregister(initAlarm)
    f= "_start_boot.lua"   if file.exists(f) then dofile(f) end
end

gpio.trig(mSwitch, "both", quickLaunch)

tmr.alarm(initAlarm, 8000,  tmr.ALARM_SINGLE, function()
    f= "_start_boot.lua" if file.exists(f) then dofile(f) end
end)