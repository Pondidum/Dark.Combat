local addon, ns = ...

local environment = ns.environment

local configBuilder = {

	parse = function()

		local env = environment.create()

		env.player = {
			class = function() return select(2, UnitClass("player")) end,
			spec = function() return select(2, GetSpecializationInfo(GetSpecialization())) end,
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
