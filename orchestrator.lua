local addon, ns = ...

local eventStore = ns.lib.events

local orchestrator = {

	new = function(self, domain)

		local this = setmetatable({}, { __index = self })

		this.events = eventStore.new()
		this.events.register("PLAYER_TALENT_UPDATE", function() self:spellsChanged() end)
		this.events.register("ACTIVE_TALENT_GROUP_CHANGED", function() self:spellsChanged() end)


		return this

	end,

	spellsChanged = function(self)

		local class, spec = self:getClassSpec()
		local displaySpells = self.domain:compile(class, spec)

		for display, spells in pairs(displaySpells) do
			print(display, #spells)
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
