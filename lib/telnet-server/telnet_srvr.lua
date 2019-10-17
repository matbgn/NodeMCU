-- Telnet server for remote connection with NodeMCU via Wifi
-- source: https://github.com/nodemcu/nodemcu-firmware/blob/master/lua_examples/telnet/telnet.lua

local node, table, tmr, wifi, uwrite,     tostring =
      node, table, tmr, wifi, uart.write, tostring

local function telnet_listener(socket) 
  local queueLine = (require "fifosock").wrap(socket)

  local function receiveLine(s, line)
    node.input(line)
  end

  local function disconnect(s)
    socket:on("disconnection", nil)
    socket:on("reconnection", nil)
    socket:on("connection", nil)
    socket:on("receive", nil)
    socket:on("sent", nil)
    node.output(nil)
    package.loaded.telnet = nil
    collectgarbage()
  end

  socket:on("receive",       receiveLine)
  socket:on("disconnection", disconnect)
  node.output(queueLine, 0)
  print("Welcome to NodeMCU terminal \n")
end

local t = tmr.create()
t:alarm(500, tmr.ALARM_AUTO, function()
  if (wifi.sta.status() == wifi.STA_GOTIP) then
    t:unregister()
    t=nil
    print("\n--- Telnet server started ---")
    srv = net.createServer(net.TCP, 180)
    srv:listen(port or 23, telnet_listener)
  else
    uwrite(0,".")
  end
end)