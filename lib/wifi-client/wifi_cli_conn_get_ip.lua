-- Verbose while getting IP adress on the connecting Wifi

function wifiCliConnectionGetIp(mDisplayWifiInfos, mDisplayPassword)

  local mWifiTimer=tmr.create()

  mWifiTimer:alarm(1000, tmr.ALARM_AUTO , function()
      if wifi.sta.getip() == nil then
        print("Connecting to Wifi...")
      else
        mWifiTimer:stop()
        if mDisplayWifiInfos then
          f= "wifi_cli_conn_infos.lua" if file.exists(f) then dofile(f) end
          wifiCliConnectionInfos(mDisplayPassword)
        end
      end
  end)

end