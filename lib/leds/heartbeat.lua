-- Blink LED x times with a ratio on/off

local function flashEmbeddedLedXTimes(xTimes)
  
    local ledIOIndex = 0      -- LED NodeMCU
    local mTimeLedOn = 50     -- in ms
    local mTimeLedOff = 100   -- in ms
  
    local mIterator = 0
  
    gpio.write(ledIOIndex, gpio.HIGH)
    gpio.mode(ledIOIndex, gpio.OUTPUT)
    
    local function blinkLed()
        if mIterator >= xTimes then
          mIterator = nil
        else 
            if gpio.read(ledIOIndex) == gpio.HIGH then
                gpio.write(ledIOIndex, gpio.LOW)
                tmr.create():alarm(mTimeLedOff, tmr.ALARM_SINGLE, blinkLed)
            else 
                gpio.write(ledIOIndex, gpio.HIGH)
                mIterator = mIterator + 1
                tmr.create():alarm(mTimeLedOn, tmr.ALARM_SINGLE, blinkLed)
            end
        end
    end
    
    blinkLed()
  
end

flashEmbeddedLedXTimes(3)
flashEmbeddedLedXTimes = nil
collectgarbage()