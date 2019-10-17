-- Load credentials initialized via _credentials.lua trough _start_boot.lua

print("--- Connecting on :", ENV_CLI_SSID, " ---")
wifi.sta.config{ssid = ENV_CLI_SSID, pwd = ENV_CLI_PWD, save = true}