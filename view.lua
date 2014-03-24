local addon, ns = ...

local view = {

	type = "unknown",

	new = function(self, config)

		setmetatable(config, { __index = self })

		return config

	end,

	init = function(self, id, container)

	end,

	reset = function(self)
		self:setText("")
		self:setCooldown(nil)
		self:hideGlow()
	end,

	getFrame = function(self)
		return self.frame
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

	setTextVisible = function(self, value)

	end,

	setCooldownVisible = function(self, value)

	end,

	reset = function(self)

	end,
}

ns.view = view
