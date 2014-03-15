local addon, ns = ...

local view = {

	type = "unknown",

	new = function(self, config)

		setmetatable(self, { __index = self })

		return this

	end,

	init = function(self, id, container)

	end,

	setIcon = function(self, texture)

	end,

	setText = function(self, value)

	end,

	setCooldown = function(self, start, duration, active, stacks, maxStacks)

	end,

	showGlow = function(self)

	end,

	hideGlow = function(self)

	end,

	setTextVisible = function(self)

	end,

	setCooldownVisible = function(self)

	end,
}

ns.view = view
