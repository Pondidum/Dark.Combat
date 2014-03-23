local addon, ns = ...

local group = {

	type = "unknown",

	new = function(self, config)

		setmetatable(config, { __index = self })
		return config

	end,

	init = function(self, config)
	end,

	createView = function(self)
	end,
}

ns.group = group
