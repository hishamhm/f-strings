
local F = require("F")

local u = "Hello"

local function f()
   local w = "World"
   return function()
      local gobo = "GOBO"
      print(u .. " " .. w)
      print(F"{u} {w} of {gobo}")
   end
end

f()()
