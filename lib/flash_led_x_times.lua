-- Blink LED x times with a ratio on/off

function flashLedXTimes(xTimes)
  
  mLed = 0            -- LED NodeMCU
  mTimeLedOn = 50     -- in ms
  mTimeLedOff = 100   -- in ms

  mIterator = 0

  gpio.write(mLed, gpio.HIGH)
  gpio.mode(mLed, gpio.OUTPUT)
  mTimerFlashLed = tmr.create()
  
  function blinkLed ()
      if mIterator >= xTimes then
--        print(mIterator)
          mIterator = 0
      else 
          if gpio.read(mLed) == gpio.HIGH then
              gpio.write(mLed, gpio.LOW)
              mTimerFlashLed:alarm(mTimeLedOff, tmr.ALARM_SINGLE, blinkLed)
          else 
              gpio.write(mLed, gpio.HIGH)
              mIterator = mIterator + 1
              mTimerFlashLed:alarm(mTimeLedOn, tmr.ALARM_SINGLE, blinkLed)
          end
      end
  end
  
  blinkLed ()

end




