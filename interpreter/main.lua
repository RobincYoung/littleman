function love.load(arg)
pc=1
ir=1
ad=1
ac=1
out={1}
inp=1
ram={099, 398, 097, 397, 098, 196, 401, 601, 398, 097, 295, 794, 503, 800, [94]=0, [95]=1, [96]=3, [97]=10, [98]=0, [99]=5}
end
function love.update(dt)
 ir=ram[pc] % 100
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
function love.draw(dt)
 
end
