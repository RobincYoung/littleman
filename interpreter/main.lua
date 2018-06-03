pc=1
ir=1
ad=1
ac=1
out={1}
inp=1
for line in io.lines("torun.txt") do
  local a = string.explode(line,":")
  ram={[a[0]]=a[1]}
end
while true do
 ir = ram[pc] % 100
 ad=math.floor((ram[pc])/100)
 if ir == 0 then
   ac = ram[ad]
 elseif ir == 1 then
   ac= ac + ram[ad]
 elseif ir == 2 then
   ac= ac - ram[ad]
 elseif ir == 3 then
   ram[ad] = ac
 elseif ir == 4 then
   out[ad]=ac
 elseif ir == 5 then
   pc= ad
 elseif ir == 6 then
   print(out[ad])
 elseif ir == 7 then
   if ac == ram[ad] then
     pc=pc+1
   end
 elseif ir == 8 then
   pc = pc-1
 end
 pc=pc+1
end

function string.explode(str, div)
    assert(type(str) == "string" and type(div) == "string", "invalid arguments")
    local o = {}
    while true do
        local pos1,pos2 = str:find(div)
        if not pos1 then
            o[#o+1] = str
            break
        end
        o[#o+1],str = str:sub(1,pos1-1),str:sub(pos2+1)
    end
    return o
end