
local F = require("F")

a = "Hello"
b = "World"
print(F"{a} {b}")

local c = "Hello"
local d = "World"
print(F"Also works with locals: {c} {d}")

print(F"Allows arbitrary expressions: one plus one is {1 + 1}")

local t = { foo = "bar" }

print(F"And values: t.foo is {t.foo}; print function is {_G.print}")

do
   local h = "Hello"
   do
      local w = "World"
      print(F"Of any scope level: {h} {w}")
   end
end

local ok, err = pcall(function()
   print(F"This fails: { 1 + } ")
end)
print("Errors display nicely: ", err)

