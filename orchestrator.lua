local addon, ns = ...

local eventStore = ns.lib.events

local orchestrator = {

	new = function(self, domain, scanner, displayBuilder)

		local this = setmetatable({}, { __index = self })

		this.domain = domain
		this.scanner = scanner
		this.displays = displayBuilder

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

		self.scanner:setSpells(displaySpells)
		self.displays:createDisplays(displaySpells)

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
