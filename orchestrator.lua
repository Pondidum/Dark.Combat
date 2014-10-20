local addon, ns = ...

local eventStore = ns.lib.events
local cache = ns.lib.cache

local cooldownView = ns.ui.cooldownView
local cooldownPresenter = ns.ui.cooldownPresenter

local orchestrator = {

	new = function(self, domain, displayBuilder)

		local this = setmetatable({}, { __index = self })

		this.domain = domain
		this.containers = displayBuilder

		this.containers:createContainers()

		this.views = cache.new(function(i) return cooldownView:new(i) end)
		this.presenters = {}

		this.events = eventStore.new()
		this.events.register("PLAYER_TALENT_UPDATE", function() this:spellsChanged() end)
		this.events.register("ACTIVE_TALENT_GROUP_CHANGED", function() this:spellsChanged() end)

		return this

	end,

	spellsChanged = function(self)

		local class, spec = self:getClassSpec()

		if not class or not spec then
			return
		end

		local displaySpells = self.domain:compile(class, spec)

		self.views.recycleAll()
		self.containers:emptyAll()

		self:clearPresenters()

		for display, spells in pairs(displaySpells) do

			for i, spell in ipairs(spells) do

				local view = self.views:get()
				local presenter = cooldownPresenter:new(view, spell)

				self.containers:addView(display, view)
				table.insert(self.presenters, presenter)

			end

		end

		self:update()

	end,

	clearPresenters = function(self)

		for i, presenter in ipairs(self.presenters) do
			presenter:disable()
		end

		table.wipe(self.presenters)

	end,

	update = function(self)

		for i, presenter in ipairs(self.presenters) do
			presenter:update()
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

}

ns.orchestrator = orchestrator
