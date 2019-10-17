-- Toggle state of file is_winter_time.txt

if file.getcontents('is_winter_time.txt') == "true" then file.putcontents('is_winter_time.txt', "false") else file.putcontents('is_winter_time.txt', "true") end
print("Is winter time: " ..file.getcontents('is_winter_time.txt').. "\n")