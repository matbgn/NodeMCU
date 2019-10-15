-- Healthy start and scripts loaded at boot
------- DON'T EDIT BELOW THIS LINE --------

print("\n--- Started healthy ---\n")

function heartBeat()
  f= "flash_led_x_times.lua" if file.exists(f) then dofile(f) end
  flashLedXTimes(4)
end

heartBeat ()

------- DON'T EDIT ABOVE THIS LINE --------
---------- EDIT BELOW THIS LINE -----------

f= "switch_led.lua" if file.exists(f) then dofile(f) end