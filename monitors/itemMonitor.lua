local addon, ns = ...

local monitor = ns.monitor

ns.monitors.itemMonitor = monitor:extend({

	eventNames = {
		"ACTIONBAR_UPDATE_COOLDOWN",
		"SPELL_UPDATE_USABLE",
		"UNIT_POWER",
		"UNIT_POWER_FREQUENT",
		"UNIT_DISPLAYPOWER",
	},

	ctor = function(self, slotID, auraID)
		self:base():ctor()

		self.auraID = auraID
		self.auraName = GetSpellInfo(auraID)

		self.slotID = slotID

	end,

	updateAuras = function(self)

		local spellName = self.auraName or self.spellName

		self:defaultAuraUpdate(spellName)
		self.texture = GetInventoryItemTexture("player", self.slotID)

	end,

	updateCooldown = function(self)

		self.stacks = 0
		self.maxStacks = 0
		self.texture = GetInventoryItemTexture("player", self.slotID)

		local start, duration, enable = GetInventoryItemCooldown("player", self.slotID)
		local charges, maxCharges, startCharges, durationCharges = 1, 1, 0, 0

		if maxCharges and maxCharges > 1  then
			self.start = startCharges
			self.duration = durationCharges
			self.charges = charges
			self.maxCharges = maxCharges
		else
			self.start = start
			self.duration = duration
			self.charges = 0
			self.maxCharges = 0
		end

		self.usable = true
		self.notEnoughPower = false

	end,
})