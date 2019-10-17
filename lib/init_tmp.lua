-- Bootstrap script 
-- Holding button will quick launch start_boot
-- Otherwise it will wait 8 sec to launch start_boot (giving the time to fix errors)
-- WARNING: DO NOT CHANGE THIS FILE UNTIL YOU REALLY KNOW WHAT YOU DO!

print("\n--- Init NodeMCU ---\n")

local mSwitch = 3     -- switch NodeMCU
gpio.mode(mSwitch, gpio.INT, gpio.PULLUP)
local initSecureTimer = tmr.create()

local function quickLaunch()
    gpio.trig(mSwitch, "none")
    initSecureTimer:unregister()
    mSwitch = nil
    f= "_secure_boot.lua" if file.exists(f) then dofile(f) end
end

gpio.trig(mSwitch, "both", quickLaunch)

initSecureTimer:alarm(5000, tmr.ALARM_SINGLE, function()
    f= "_secure_boot.lua" if file.exists(f) then dofile(f) end
end)