-- Healthy start and scripts loaded at standard boot

f= "heartbeat.lua" if file.exists(f) then dofile(f) end

f= "web_srvr.lua" if file.exists(f) then dofile(f) end

f= nil
collectgarbage()