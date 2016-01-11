local F = require("F")

local assert = assert
local _ENV = {x = "foo"}
function gee()
   assert("foo" == x)
   assert("foo" == F'{x}')
end
gee()
