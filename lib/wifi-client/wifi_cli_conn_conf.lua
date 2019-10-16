-- Load credentials initialized via _credentials.lua trough _start_boot.lua

print("--- Connecting on :", CREDENTIALS_CLI_SSID, " ---")
wifi.sta.config{ssid = CREDENTIALS_CLI_SSID, pwd = CREDENTIALS_CLI_PWD, save = true}