local addon, ns = ...

local eventStore = ns.lib.eventStore

local cooldownScanner = {

	new = function(self)

		local this = setmetatable(this, { __index = self })

		this.displaySpells = {}
		this.events = eventStore.new()

		this.events.register("")

		this.events.register("ACTIONBAR_UPDATE_COOLDOWN", function() this:updateCooldowns() end)
		this.events.register("SPELL_UPDATE_USABLE", function() this:updateCooldowns() end)
		this.events.register("UNIT_POWER", function() this:updateCooldowns() end)
		this.events.register("UNIT_POWER_FREQUENT", function() this:updateCooldowns() end)
		this.events.register("UNIT_DISPLAYPOWER", function() this:updateCooldowns() end)

		return this

	end,

	setSpells = function(self, displaySpells)

		self.displaySpells = displaySpells

	end,

	updateCooldowns = function(self)

		for displayName, spells in pairs(self.displaySpells) do

			for i, spell in ipairs(spells) do

				local start, duration, enable, charges, maxCharges = GetSpellCooldown(spellName)
				local usable, notEnoughPower = IsUsableSpell(spellName)

				print("spell:", spell, "start:", start, "duration:", duration, "usable:", usable)

			end

		end

	end,

}

ns.domain.cooldownScanner = cooldownScanner
