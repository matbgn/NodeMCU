-- Turn ON LED when button pressed

mLed = 0         -- LED NodeMCU 
mSwitch = 3      -- switch NodeMCU

gpio.mode(mSwitch, gpio.INT, gpio.PULLUP)

function toggleLed()
    if gpio.read(mSwitch) == 0  then
        ledState = "ON"
        gpio.write(mLed, gpio.LOW)
    else 
        ledState = "OFF"
        gpio.write(mLed, gpio.HIGH)
    end
        print(ledState)
end

gpio.trig(mSwitch, "both", toggleLed)