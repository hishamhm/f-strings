# f-strings

String interpolation for Lua, inspired by f-strings, a form of string interpolation
[coming in Python 3.6](https://zerokspot.com/weblog/2015/12/31/new-string-formatting-in-python/).

This module started as a [blog post](http://hisham.hm/2016/01/04/string-interpolation-in-lua/)
showcasing that Lua already has all features necessary to implement the equivalent Python feature.

## Usage

Require the `F` module and then use it directly on strings. Any `{expression}` occurring
in them will be evaluated and interpolated directly in the string.

    local F = require("F")

    local f = 99
    local c = (f - 32) / 9 * 5
    print(F"{f} degrees Fahrenheit is {c:%.2f} degrees Celsius")

Almost any Lua expression can be inserted (apart from two minor parsing caveats: `":%"`
is used as a separator for specifying formatting (according to the same rules of
`string.format`), and curly braces within expressions must be well-nested).

See the `examples` directory for more examples.

## Author

Hisham Muhammad - [http://twitter.com/hisham_hm](@hisham_hm) - http://hisham.hm/

## License

MIT/X11, the same as Lua.
