-- Load all files needed to connect to Wifi without Acess Point itself on NodeMCU

f= "wifi_ap_stop.lua" if file.exists(f) then dofile(f) end
f= "wifi_cli_conn_conf.lua" if file.exists(f) then dofile(f) end
f= "wifi_cli_conn_start.lua" if file.exists(f) then dofile(f) end
f= "wifi_cli_conn_get_ip.lua" if file.exists(f) then dofile(f) end