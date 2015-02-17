local addon, ns = ...

local spellData = ns.lib.spellData

local class = ns.lib.class
local events = ns.lib.mixins.events

local monitor = class:extend({

	eventNames = {},

	ctor = function(self)
		self:include(events)
	end,

	enable = function(self)

		for i, event in ipairs(self.eventNames) do

			self[event] = self.onEvent
			self:register(event)

		end

		self:onEvent()
	end,

	disable = function(self)

		for i, event in ipairs(self.eventNames) do
			self[event] = nil
			self:unregister(event)
		end

	end,

	getTalentName = function(self)
	end,

	onEvent = function(self)

		self:updateAuras()

		if self.mode ~= "ACTIVE" then
			self:updateCooldown()
		end

		if self.afterUpdateAction then
			self.afterUpdateAction()
		end

	end,

	updateAuras = function(self)
		self:setInactive()
	end,

	updateCooldown = function(self)
	end,

	afterUpdate = function(self, action)
		self.afterUpdateAction = action
	end,

	setActive = function(self)
		self.mode = "ACTIVE"
	end,

	setInactive = function(self)
		self.mode = "INACTIVE"
	end,

	isActive = function(self)
		return self.mode == "ACTIVE"
	end,

	defaultAuraUpdate = function(self, spellName)

		local auraName, auraRank, auraTexture, auraCount, auraDispel, auraDuration, auraExpires = UnitAura("player", spellName)

		if auraName then
			self:setActive()

			local start = auraExpires - auraDuration

			self.start = start
			self.duration = auraDuration

			self.charges = auraCount
			self.maxCharges = spellData:getMaxCharges(spellName)
			self.usableCharges = spellData:getUsableCharges(spellName)

		else
			self:setInactive()
		end

	end,

	defaultCooldownUpdate = function(self, spellName)

		local start, duration, enable, charges, maxCharges = GetSpellCooldown(spellName)
		local usable, notEnoughPower = IsUsableSpell(spellName)

		self.texture  = GetSpellTexture(spellName)
		self.start = start
		self.duration = duration
		--self.enable = enable
		self.charges = charges
		self.maxCharges = maxCharges
		self.usable = usable
		self.notEnoughPower = notEnoughPower

	end,

})

ns.monitor = monitor
