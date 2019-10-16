-- Connect NodeMCU to a Wifi via _credentials.lua loaded trough _start_boot.lua 

function wifiCLIConnectionStart() 
    local mWifiMode = wifi.getmode()

    if mWifiMode == wifi.NULLMODE then
        wifi.setmode(wifi.STATION)
        print("--- WIFI mode set in CLI only ---")
    elseif mWifiMode == wifi.SOFTAP then
        wifi.setmode(wifi.STATIONAP)
        print("--- WIFI mode set in AP + CLI ---")
    end
    wifi.sta.autoconnect(1)
    wifi.sta.connect()
end

wifiCLIConnectionStart()
wifiCLIConnectionStart = nil

print("--- Wifi connection started ---")
