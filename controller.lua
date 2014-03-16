local addon, ns = ...

local empty = {}

local controller = {

	type = "unknown",

	new = function(self, config)

		setmetatable(config, { __index = self })
		return config

	end,

	enable = function(self)

	end,

	disable = function(self)

	end,

	getMonitorConfigs = function(self)
		return empty
	end,

}

ns.controller = controller
