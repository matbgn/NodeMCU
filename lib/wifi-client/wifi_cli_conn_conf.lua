-- Load credentials initialized via _credentials.lua trough _start_boot.lua

function wifi_cli_conf()
  print("--- Connecting on :", CREDENTIALS_CLI_SSID, " ---")
  wifi.sta.config{ssid = CREDENTIALS_CLI_SSID, pwd = CREDENTIALS_CLI_PWD, save = true}
end

wifi_cli_conf()
wifi_cli_conf = nil