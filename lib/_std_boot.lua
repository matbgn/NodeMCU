-- Healthy start and scripts loaded at secure boot

f= "web_srvr.lua" if file.exists(f) then dofile(f) end

f= nil
collectgarbage()