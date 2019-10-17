-- Healthy start and scripts loaded at standard boot
print("\n--- Standard boot started healthy ---")
print("-- [LOG] RAM left - At standard boot:"..node.heap().."\n")

f= "heartbeat.lua" if file.exists(f) then dofile(f) end

f= "web_srvr.lua" if file.exists(f) then dofile(f) end

f= nil
collectgarbage()