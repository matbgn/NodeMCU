-- Healthy start and scripts loaded at boot
------- DON'T EDIT BELOW THIS LINE --------

print("\n--- Started healthy ---\n")

f= "flash_io_index_led_x_times.lua" if file.exists(f) then dofile(f) end
flashIOIndexLedXTimes(0, 3)
flashIOIndexLedXTimes=nil

------- DON'T EDIT ABOVE THIS LINE --------
---------- EDIT BELOW THIS LINE -----------

f= "_credentials.lua" if file.exists(f) then dofile(f) end

f= "wifi_client_loader.lua" if file.exists(f) then dofile(f) end
f= "telnet_srvr.lua" if file.exists(f) then dofile(f) end
f= "web_ide.lua" if file.exists(f) then dofile(f) end