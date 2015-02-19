local addon, ns = ...

local class = ns.lib.class
local events = ns.lib.events

local cache = ns.lib.cache

local cooldownView = ns.ui.cooldownView
local cooldownPresenter = ns.ui.cooldownPresenter


local frameCache = cache:extend({

	onCreate = function(self, i)
		return cooldownView:new(i)
	end,

	onRecycle = function(self, view)
		view.frame:Hide()
	end,
})

local orchestrator = class:extend({

	events = {
		"PLAYER_TALENT_UPDATE",
		"ACTIVE_TALENT_GROUP_CHANGED",
	},

	ctor = function(self, domain, displayBuilder)
		self:include(events)


		self.domain = domain
		self.containers = displayBuilder

		self.containers:createContainers()

		self.views = frameCache:new()
		self.presenters = {}

	end,

	PLAYER_TALENT_UPDATE = function(self)
		self:spellsChanged()
	end,

	ACTIVE_TALENT_GROUP_CHANGED = function(self)
		self:spellsChanged()
	end,

	spellsChanged = function(self)

		local class, spec = self:getClassSpec()

		if not class or not spec then
			return
		end

		local displaySpells = self.domain:compile(class, spec)


		self:clearViews()
		self:clearPresenters()

		for display, spells in pairs(displaySpells) do

			for i, spell in ipairs(spells) do

				local view = self.views:get()

				spell:afterUpdate(function() view:update(spell) end)

				self.containers:addView(display, view)
				table.insert(self.presenters, spell)

			end

		end

		self:update()

	end,

	clearViews = function(self)


		self.views:recycleAll()
		self.containers:emptyAll()

	end,

	clearPresenters = function(self)

		for i, presenter in ipairs(self.presenters) do
			presenter:disable()
		end

		table.wipe(self.presenters)

	end,

	update = function(self)

		for i, presenter in ipairs(self.presenters) do
			presenter:enable()
		end

	end,

	getClassSpec = function(self)

		local localisedClass, class = UnitClass("player")
		local spec

		local specID = GetSpecialization()

		if specID ~= nil then
			spec = select(2, GetSpecializationInfo(specID))
		end

		return class, spec

	end,

})

ns.orchestrator = orchestrator
