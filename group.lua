local addon, ns = ...

local group = {

	type = "unknown",

	new = function(self, config)

		setmetatable(config, { __index = self })
		return config

	end,
}

ns.group = group
