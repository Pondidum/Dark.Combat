local addon, ns = ...

local monitor = ns.monitor

ns.monitors.macroMonitor = monitor:extend({

	eventNames = {
		"ACTIONBAR_UPDATE_COOLDOWN",
		"SPELL_UPDATE_USABLE",
		"UPDATE_MACROS",
	},

	ctor = function(self, macroName)
		self:base():ctor()
		self.macroName = macroName
	end,

	updateAuras = function(self)

		local spellName = GetMacroSpell(self.macroName)

		self:defaultAuraUpdate(spellName)
		self.texture  = GetSpellTexture(spellName)

	end,

	updateCooldown = function(self)

		local spellName = GetMacroSpell(self.macroName)

		self:defaultCooldownUpdate(spellName)
		self.texture = GetSpellTexture(spellName)

	end,
})