local F = require("F")

local f = 99
local c = (f-32)/9*5

print(F"{f} degrees Fahrenheit is {c:%.2f} degrees Celsius")
