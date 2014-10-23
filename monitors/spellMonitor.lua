local addon, ns = ...

local monitor = ns.monitor

ns.monitors.spellMonitor = monitor:extend({

	events = {
		"ACTIONBAR_UPDATE_COOLDOWN",
		"SPELL_UPDATE_USABLE",
		"UNIT_POWER",
		"UNIT_POWER_FREQUENT",
		"UNIT_DISPLAYPOWER",
	},

	ctor = function(self, spellID)

		local name, subname, icon, castingTime, minRange, maxRange = GetSpellInfo(spellID)

		self.spellID = spellID
		self.spellName = name
		self.texture = icon

	end,

	getTalentName = function(self)
		return self.spellName
	end,

	updateAuras = function(self)

		local spellID = self.spellID

		self:defaultAuraUpdate(spellID)

	end,

	updateCooldown = function(self)

		local spellID = self.spellID

		self:defaultCooldownUpdate(spellID)

	end,
})
