-- Toggle state of file is_telnet_active.txt

if file.getcontents('is_telnet_active.txt') == "true" then file.putcontents('is_telnet_active.txt', "false") else file.putcontents('is_telnet_active.txt', "true") end
print("Telnet server activated: " ..file.getcontents('is_telnet_active.txt').. "\n")