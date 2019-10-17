-- Stop NodeMCU Access Point (AP) and only AP

function wifiAPStop()
    local mWifiMode = wifi.getmode()

    if mWifiMode == wifi.SOFTAP then
        -- If only Access Point was selected then drop it
        wifi.setmode(wifi.NULLMODE)
    elseif mWifiMode == wifi.STATIONAP then
        -- Otherwise if dual mode was setup then drop only the AP and leave Client only
        wifi.setmode(wifi.STATION)
    end
end

wifiAPStop()
wifiAPStop = nil

print("--- Wifi Access Point stopped ---")