-- Verbose while getting IP adress on the connecting Wifi

local function wifiCliConnectionGetIp(mDisplayWifiInfos)

  local mWifiTimer=tmr.create()
  local mCounter = 0

  mWifiTimer:alarm(1000, tmr.ALARM_AUTO , function()
      if wifi.sta.getip() == nil then
        mCounter = mCounter + 1
        print("Attempt to connect to wifi...", 11 - mCounter)
        if mCounter > 10 then
          node.restart()
        end
      else
        mWifiTimer:unregister()
        mWifiTimer = nil
        mCounter = nil
        if mDisplayWifiInfos then
          f= "wifi_cli_conn_infos.lua" if file.exists(f) then dofile(f) end
        end
      end
  end)

end

wifiCliConnectionGetIp(ENV_DISPLAY_WIFI_INFOS)
wifiCliConnectionGetIp = nil
collectgarbage()