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

		local config = ns.config
		setfenv(config, env)

		local raw = config()
		raw()

		return  env.results

	end
}

ns.configBuilder = configBuilder
