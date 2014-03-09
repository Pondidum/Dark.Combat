local addon, ns = ...

local view = {

	type = "unknown",

	new = function(self, config)

		setmetatable(self, { __index = self })

		return this

	end,

	setIcon = function(self)

	end,

	setText = function(self)

	end,

	setCooldown = function(self)

	end,

	setTextVisible = function(self)

	end,

	setCooldownVisible = function(self)

	end,
}

ns.view = view
