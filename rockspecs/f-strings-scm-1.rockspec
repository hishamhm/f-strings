package = "f-strings"
version = "scm-1"
source = {
   url = "git://github.com/hishamhm/f-strings"
}
description = {
   summary = [[String interpolation for Lua.]],
   detailed = [[
      String interpolation for Lua, inspired by f-strings,
      a form of string interpolation in Python 3.6.
      It allows you to interpolate variables in strings
      (including local variables) using the syntax:
      str = F"The value of x is {x} and the value of y is {y:%.2f}."
   ]],
   homepage = "http://github.com/hishamhm/f-strings",
   license = "MIT"
}
dependencies = {}
build = {
   type = "builtin",
   modules = {
      F = "F.lua",
   }
}
