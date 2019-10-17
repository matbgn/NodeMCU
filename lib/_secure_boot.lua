-- Healthy start and scripts loaded at secure boot

print("\n--- Started healthy ---")
print("-- [LOG] RAM left - At secure boot:"..node.heap().."\n")

f= "heartbeat.lua" if file.exists(f) then dofile(f) end

f= "_credentials.lua" if file.exists(f) then dofile(f) end

f= "wifi_client_loader.lua" if file.exists(f) then dofile(f) end

local mTelnetConn = true
f= "telnet_active.txt"
if (file.exists(f) and file.getcontents('telnet_active.txt') == "true") then mTelnetConn = true else mTelnetConn = false end
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
    t:unregister()
    t=nil
    collectgarbage()
    print("\n--- Debug tools started healthy ---")
    print("\n--- 30 sec before standard boot ---")
    print("-- [LOG] RAM left - At standard boot:"..node.heap().."\n")

    local initStdBootTimer = tmr.create()
    initStdBootTimer:alarm(30*1000, tmr.ALARM_SINGLE, function()
      print("\n--- Standard boot started healthy ---")
      mSwitch = nil
      f= "_std_boot.lua" if file.exists(f) then dofile(f) end
    end)
  end
end)

f= nil
collectgarbage()
