local addon, ns = ...

local controller = {

	new = function(self, config)

		setmetatable(config, { __index = self })
		return config

	end,

	enable = function(self)

	end,

	disable = function(self)

	end,

}

ns.controller = controller