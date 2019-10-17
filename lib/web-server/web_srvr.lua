-- Web Server with Active Server Page Lua
-- Send an HTML file on target port. KEEP ATTENTION: Maxmal ligne length is 1'024 bytes!

----------------------------------------------------------------------------------
-- Interface with the HTML pages -> KEEP THIS LINES AS LONG AS YOU USE IT IN .html
mGlblTmp = nil

function mPrintOut(mString)
    glblClient:send(mString)    -- Print on open port as Global variable
end
----------------------------------------------------------------------------------

local mPort = 80

-- Page handler

function send_file(mClient, mFilename)
    print("Sending html...\n")
    mClient:send("HTTP/1.1 200 OK\n")
    mClient:send("Content-Type: text/html\n\n")
    glblClient = mClient        -- Export port in global environment
    if mFilename == "" then mFilename = "index.html" end  
    file_web = file.open(mFilename, "r")
    if file_web then
        repeat
            local line = file_web:read('\n')
            if line then
                if string.find(line, "<%%") then
                    flag_lua_code = true        -- Switch on lua inline code
                    lua_code = ""
                elseif string.find(line, "%%>") then
                    flag_lua_code = false       -- Switch back on HTML code
                    loadstring(lua_code)()      -- Here it execute the inline lua code
                elseif flag_lua_code then
                    lua_code = lua_code..line   -- grab the inline lua code
                else
                    mClient:send(line)          -- send HTML code
                end
            end
        until not line    
        file_web:close()   file_web = nil
    else
        file_web = file.open("404.html", "r")
        if file_web then
          repeat
              local line = file_web:read('\n')
              if line then
                  mClient:send(line)          -- send HTML code
              end
          until not line    
          file_web:close()   file_web = nil
        end
    end
end

-- HTTP server
-- NB: only one server at a time
if srv then srv:close() end
srv = net.createServer()
srv:listen(mPort, function(conn)
    conn:on("receive", function(client, request)
        _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP")
        
    print("Request: \n---\n\n"..request.."---")
            
        if not string.find(request, "/favicon.ico") then
            if (method == nil) then
                _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP")
            end
            print("method: ", method)   print("path: ", path)   print("vars: ", vars)
            _GET = {}
            if (vars ~= nil) then
                for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                    _GET[k] = v
                    print(k..": "..v)
                end
            end
            file_html=string.gsub(path, "/", "")
            send_file(client, file_html)      
        end
    end)
    conn:on("sent", function(c) c:close() end)
end)


