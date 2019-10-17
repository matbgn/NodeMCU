-- Toggle state of file telnet_active.txt

if file.getcontents('telnet_active.txt') == "true" then file.putcontents('telnet_active.txt', "false") else file.putcontents('telnet_active.txt', "true") end
print("Telnet server activated: " ..file.getcontents('telnet_active.txt').. "\n")