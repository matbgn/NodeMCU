-- Blink LED x times with a ratio on/off

function flashIOIndexLedXTimes(ledIOIndex, xTimes)
  
--ledIOIndex = 0            -- LED NodeMCU
  local mTimeLedOn = 50     -- in ms
  local mTimeLedOff = 100   -- in ms

  local mIterator = 0

  gpio.write(ledIOIndex, gpio.HIGH)
  gpio.mode(ledIOIndex, gpio.OUTPUT)
  local mTimerFlashLed = tmr.create()
  
  function blinkLed()
      if mIterator >= xTimes then
        mTimerFlashLed:unregister()
        mIterator = nil
        mTimeLedOn = nil
        mTimeLedOff = nil
      else 
          if gpio.read(ledIOIndex) == gpio.HIGH then
              gpio.write(ledIOIndex, gpio.LOW)
              mTimerFlashLed:alarm(mTimeLedOff, tmr.ALARM_SINGLE, blinkLed)
          else 
              gpio.write(ledIOIndex, gpio.HIGH)
              mIterator = mIterator + 1
              mTimerFlashLed:alarm(mTimeLedOn, tmr.ALARM_SINGLE, blinkLed)
          end
      end
  end
  
  blinkLed()

end




