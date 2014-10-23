local addon, ns = ...

local eventStore = ns.lib.events

local monitor = {

	events = {},

	extend = function(self, this)
		return setmetatable(this, { __index = self })
	end,

	new = function(self, ...)

		local this = setmetatable({}, { __index = self })
		local events = eventStore.new()

		this.register = events.register
		this.unregister = events.unregister

		this:ctor(...)

		return this

	end,

	ctor = function(self, ...)

	end,

	enable = function(self)
		for i, event in ipairs(self.events) do
			self.register(event, function() self:onEvent() end)
		end
		self:onEvent()
	end,

	disable = function(self)
		for i, event in ipairs(self.events) do
			self.unregister(event)
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

	defaultAuraUpdate = function(self, spellName)

		local auraName, auraRank, auraTexture, auraCount, auraDispel, auraDuration, auraExpires = UnitAura("player", spellName)

		if auraName then
			self:setActive()

			local start = auraExpires - auraDuration

			self.start = start
			self.duration = auraDuration

			self.charges = auraCount
			self.maxCharges = auraCount

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
		self.enable = enable
		self.charges = charges
		self.maxCharges = maxCharges
		self.usable = usable
		self.notEnoughPower = notEnoughPower

	end,

}

ns.monitor = monitor
