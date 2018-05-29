function love.load()
  out = {}
  local curin = 0
  local curvar = 100
  local varnam={}
  local lab = {}
  for line in love.filesystem.lines("tocomp.txt") do
    local p = string.explode(line, ":")
    op = p[1]
    it= p[2]
     if op == "lab" then
      lab[it] = curin
     elseif op == "var" then
      p = string.explode(it, "=")
      local a = p[1]
      local b = p[2]
      varnam[a] = curvar
      out[curvar] = b
      print(curvar, out[curvar])
      curvar= curvar - 1
    elseif op == "get" then
      out[curin] = ((varnam[it]*100)+0)
      curin = curin + 1 
    elseif op == "add" then
      out[curin] = ((varnam[it]*100)+1)
      curin = curin + 1 
    elseif op == "min" then
      out[curin] = ((varnam[it]*100)+2)
      curin = curin + 1 
    elseif op == "put" then
      out[curin] = ((varnam[it]*100)+3)
      curin = curin + 1 
    elseif op == "print" then
      out[curin] = ((100)+4)
      curin = curin + 1 
      out[curin] = ((100)+6)
      curin = curin + 1
    elseif op == "goto" then
      out[curin] = ((lab[it]*100)+5)
      curin = curin + 1 
    elseif op == "if" then
      out[curin] = ((varnam[it]*100)+7)
      curin = curin + 1 
    end
  end
  local file = love.filesystem.newFile("write.txt")
  file:open('w')
  for i,v in pairs(out) do
   local res = file:write(i..":"..v..'\n')
   print ("res:", res)
   print("v is: ",v)
  end
  file:close()
end
 
function love.update(dt)

end
function love.draw()

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