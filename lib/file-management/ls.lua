-- Print all files present on NodeMCU

l=file.list()
for k,v in pairs(l) do
print(k.." "..v)
end