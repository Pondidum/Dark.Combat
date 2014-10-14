local addon, ns = ...

local displayBuilder = {

	new = function(self)

		local this = {}
		this.configs = {}
		this.displays = {}

		setmetatable(this, { __index = self })
		return this

	end,

	configureDisplay = function(self, name)
		self.configs[name] = {}
	end,

	createDisplays = function(self, displaySpells)

		for displayName, spells in pairs(displaySpells) do

			local config = self.configs[displayName]

			-- ?
		end

	end,


}

ns.ui.displayBuilder = displayBuilder
