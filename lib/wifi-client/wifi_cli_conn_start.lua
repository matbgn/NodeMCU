-- Connect NodeMCU to a Wifi via _credentials.lua loaded trough _start_boot.lua 

function wifi_cli_start()
  
  local mWifiMode = wifi.getmode()

  if mWifiMode == wifi.NULLMODE then
      wifi.setmode(wifi.STATION)
      print("--- WIFI mode in CLI only ---")
  elseif mWifiMode == wifi.SOFTAP then
      wifi.setmode(wifi.STATIONAP)
      print("--- WIFI mode in AP + CLI ---")
  end
  wifi.sta.autoconnect(1)
  wifi.sta.connect()
end

wifi_cli_start()
wifi_cli_start=nil