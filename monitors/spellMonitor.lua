local addon, ns = ...

local monitor = ns.monitor

ns.monitors.spellMonitor = monitor:extend({

	events = {
		"ACTIONBAR_UPDATE_COOLDOWN",
		"SPELL_UPDATE_USABLE",
	},

	ctor = function(self, spellName)

		local name, subname, icon, castingTime, minRange, maxRange = GetSpellInfo(spellName)

		self.spellName = spellName
		self.texture = icon

	end,

	updateAuras = function(self)

		local spellName = self.spellName

		defaultAuraUpdate(spellName)

	end,

	updateCooldown = function(self)

		local spellName = self.spellName

		self:defaultCooldownUpdate(spellName)

	end,
})
