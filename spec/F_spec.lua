describe("string interpolation", function()
	local F = require "F"
	local assert = assert
	it("works with literals", function()
		assert.same("foo", F'{"foo"}')
	end);
	it("works with locals", function()
		do
			local x = "foo"
			assert.same("foo", F'{x}')
		end
	end);
	it("works with referenced upvalues", function()
		do
			local x = "foo"
			(function()
				assert.same("foo", x) -- reference the upvalue
				assert.same("foo", F'{x}')
			end)()
		end
	end);
	it("works with referenced upvalues (extra argument trick)", function()
		do
			local x = "foo"
			(function()
				-- F ignores the second argument
				-- but just referencing `x` is enough...
				assert.same("foo", F('{x}', x))
			end)()
		end
	end);
	it("fails with unreferenced upvalues", function()
		do
			local x = "foo"
			(function()
				assert.not_same("foo", F'{x}')
			end)()
		end
	end);
	it("fails when F is a tail-call", function()
		do
			local function g(x)
				return F'{x}'
			end
			assert.same('nil', g("foo"))
		end
	end);
	(_VERSION == "Lua 5.1" and it or pending)("works with setfenv'd functions", function()
		setfenv(1, {x = "foo"})
		assert.same("foo", x)
		assert.same("foo", F'{x}')
	end);
	(_VERSION == "Lua 5.1" and pending or it)("works with _ENV scopes", function()
		do
			local _ENV = {x = "foo"}
			assert.same("foo", F'{x}')
		end
	end);
	(_VERSION == "Lua 5.1" and pending or it)("fails with _ENV as an unreferenced upvalue", function()
		do
			local _ENV = {x = "foo"}
			(function()
				assert.not_same("foo", F'{x}')
			end)()
		end
	end);
	(_VERSION == "Lua 5.1" and pending or it)("works with _ENV as a referenced upvalue", function()
		do
			local _ENV = {x = "foo"}
			(function()
				assert.same("foo", x) -- reference the upvalue
				assert.same("foo", F'{x}')
			end)()
		end
	end);
	(_VERSION == "Lua 5.1" and pending or it)("fails with unreferenced upvalue in custom _ENV", function()
		do
			(function()
				local _ENV = {x = "foo"}
				return function()
					assert.not_same("foo", F'{x}')
				end
			end)()()
		end
	end);
	(_VERSION == "Lua 5.1" and pending or it)("works with referenced upvalue in custom _ENV", function()
		do
			(function()
				local _ENV = {x = "foo"}
				return function()
					assert.same("foo", x) -- reference the upvalue
					assert.same("foo", F'{x}')
				end
			end)()()
		end
	end)
end)
