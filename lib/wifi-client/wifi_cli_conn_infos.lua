-- Print infos about actual connected Wifi

local function wifiCliConnectionInfos(mDisplayPassword)
  
  local mWifiMode = wifi.getmode()

  if mWifiMode == wifi.NULLMODE then
      print("--- WIFI OFF ---")

  elseif mWifiMode == wifi.STATION then
      print("--- WIFI mode CLI ---")
      print("Connected IP:\n",wifi.sta.getip())
      print("Current client config:")
      print("\tssid:", wifi.sta.getconfig(true).ssid)
      if mDisplayPassword then
        print("\tpassword:", wifi.sta.getconfig(true).pwd)
      end
      print("\tbssid:", sta_config.bssid)

  elseif mWifiMode == wifi.SOFTAP then
      print("--- WIFI mode AP ---")
      print("AP MAC:\n",wifi.ap.getmac())
      print("AP IP:\n",wifi.ap.getip())
      print("AP Connect:\n",wifi.ap.getconfig())

  elseif mWifiMode == wifi.STATIONAP then
      print("--- WIFI mode CLI + AP ---")
      print("Connected IP:\n",wifi.sta.getip())
      print("Current client config:")
      print("\tssid:", wifi.sta.getconfig(true).ssid)
      if mDisplayPassword then
        print("\tpassword:", wifi.sta.getconfig(true).pwd)
      end
      print("\tbssid:", wifi.sta.getconfig(true).bssid)
      print("AP MAC: ", wifi.ap.getmac())
      print("AP IP: ", wifi.ap.getip())
  end

  mWifiMode = nil
  
end

wifiCliConnectionInfos(ENV_DISPLAY_WIFI_PWD)
wifiCliConnectionInfos = nil
collectgarbage()