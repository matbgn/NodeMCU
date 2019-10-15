-- Healthy start and scripts loaded at boot
------- DON'T EDIT BELOW THIS LINE --------

print("\nStart Healthy\n")

function heartBeat()
  f= "flash_led_x_times.lua" if file.exists(f) then dofile(f) end
  flashLedXTimes()
  mBootTimer = tmr.create()
  mBootTimer:alarm(1*1000,  tmr.ALARM_AUTO, function()
      xTimes = 2
      blinkLed ()
  end)
end

------- DON'T EDIT ABOVE THIS LINE --------
---------- EDIT BELOW THIS LINE -----------

f= "switch_led.lua" if file.exists(f) then dofile(f) end