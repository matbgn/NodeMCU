-- Healthy start and scripts loaded at secure boot

print("\n--- Started healthy ---")
print("-- [LOG] RAM left - At secure boot:"..node.heap().."\n")

f= "heartbeat.lua" if file.exists(f) then dofile(f) end

f= "_credentials.lua" if file.exists(f) then dofile(f) end

f= "wifi_client_loader.lua" if file.exists(f) then dofile(f) end

local mTelnetConn = true
f= "is_telnet_active.txt"
if (file.exists(f) and file.getcontents('is_telnet_active.txt') == "true") then mTelnetConn = true else mTelnetConn = false end
local t = tmr.create()
t:alarm(500, tmr.ALARM_AUTO, function()
  if (wifi.sta.status() == wifi.STA_GOTIP) then
    t:unregister()
    t=nil
    f= "telnet_srvr.lua" if (file.exists(f) and mTelnetConn) then dofile(f) end
    f= "web_ide.lc" if (file.exists(f) and not mTelnetConn) then dofile(f) end
  end
end)

local t = tmr.create()
t:alarm(500, tmr.ALARM_AUTO, function()
  if srv then
    f= "heartbeat.lua" if file.exists(f) then dofile(f) end
    t:unregister()
    t=nil
    collectgarbage()
    print("\n--- Debug tools started healthy ---")
    print("--- 30 sec or push the btn for final boot ---")

    local mSwitch = 3     -- switch NodeMCU
    gpio.mode(mSwitch, gpio.INT, gpio.PULLUP)
    local initStdBootTimer = tmr.create()

    local function bootStdModeFaster()
      gpio.trig(mSwitch, "none")
      initStdBootTimer:unregister()
      mSwitch = nil
      f= "_std_boot.lua" if file.exists(f) then dofile(f) end
    end
    
    gpio.trig(mSwitch, "both", bootStdModeFaster)

    initStdBootTimer:alarm(30*1000, tmr.ALARM_SINGLE, function()
      mSwitch = nil
      f= "_std_boot.lua" if file.exists(f) then dofile(f) end
    end)
  end
end)

f= nil
collectgarbage()
