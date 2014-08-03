local addon, ns = ...

local environment = ns.environment

local configBuilder = {

	parse = function()

		local env = environment.create()

		env.player = {
			class = function() return "hunter" end,
			spec = function() return "suvival" end,
			talents = {
				["dire beast"] = true
			}
		}
		env.results = {}

		setmetatable(env, { __index = _G })

		local parse = function()

			local raw = ns.config()
			raw()

		end

		setfenv(parse, env)
		setfenv(config, env)

		parse()

		return  env.results

	end
}
