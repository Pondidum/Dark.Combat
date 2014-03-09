local addon, ns = ...
local bus = ns.bus


local view = {

	new = function(self, config)

		local this = {}
		setmetatable(this, { __index = config })

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
