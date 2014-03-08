local addon, ns = ...

local monitor = {

	new = function(self, config)

		setmetatable(config, { __index = self })

		return config

	end,

	enable = function(self)

	end,

	register = function(self)

	end,

}

ns.monitor = monitor
