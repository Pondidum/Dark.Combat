local addon, ns = ...

local eventStore = ns.lib.events

local cooldownPresenter = {

	events = {
		"ACTIONBAR_UPDATE_COOLDOWN",
		"SPELL_UPDATE_USABLE",
		"UNIT_POWER",
		"UNIT_POWER_FREQUENT",
		"UNIT_DISPLAYPOWER"
	},

	new = function(self, view, spellModel)

		local this = setmetatable({}, { __index = self })

		this.view = view
		this.spell = spellModel
		this.model = setmetatable({}, { __index = spellModel })

		local events = eventStore.new()

		this.register = events.register
		this.unregister = events.unregister

		this:ctor()

		return this

	end,

	ctor = function(self)

		self:updateView()
		self:enable()

	end,

	enable = function(self)
		for i, event in ipairs(self.events) do
			self.register(event, function() self:update() end)
		end
	end,

	disable = function(self)
		for i, event in ipairs(self.events) do
			self.unregister(event)
		end
	end,

	update = function(self)
		self:updateModel()
		self:updateView()
	end,

	updateModel = function(self)

		local model = self.model
		local spell = self.spell

		local start, duration, enable, charges, maxCharges = GetSpellCooldown(spell.name)
		local usable, notEnoughPower = IsUsableSpell(spell.name)

		model.start = start
		model.duration = duration
		model.enable = enable
		model.charges = charges
		model.maxCharges = maxCharges
		model.usable = usable
		model.notEnoughPower = notEnoughPower

	end,

	updateView = function(self)

		self.view:update(self.model)

	end,

}

ns.ui.cooldownPresenter = cooldownPresenter
