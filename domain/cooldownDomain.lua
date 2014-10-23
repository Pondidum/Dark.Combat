local addon, ns = ...

local eventStore = ns.lib.events

local cooldownDomain = {

	new = function(self, talentCache)

		local this = {}

		this.events = eventStore.new()

		this.events.register("PLAYER_TALENT_UPDATE", function() talentCache:scanTalents() end)
		this.events.register("ACTIVE_TALENT_GROUP_CHANGED", function() talentCache:scanTalents() end)

		this.classes = {}
		this.talents = talentCache

		for i,class in ipairs(CLASS_SORT_ORDER) do
			this.classes[class] = {}
		end

		return setmetatable(this, { __index = self })

	end,

	getSpellData = function(self, typeName, ...)

		local monitorName = typeName:lower() .. "Monitor"

		local monitor = ns.monitors[monitorName]

		if not monitor then
			print("Unknown monitor type " .. typeName)
			return {}
		end

		return monitor:new(...)

	end,

	trackSpell = function(self, display, class, spec, ...)

		class, spec = class:upper(), spec:upper()

		local data = self:getSpellData(...)
		data.display = display

		self.classes[class][spec] = self.classes[class][spec] or {}

		table.insert(self.classes[class][spec], data)

	end,

	compile = function(self, class, spec)

		class, spec = class:upper(), spec:upper()

		local talents = self.talents
		local spells = self.classes[class][spec] or {}
		local displays = {}

		for i, data in ipairs(spells) do

			if not talents:isTalent(data:getTalentName()) or talents:isActive(data:getTalentName()) then

				displays[data.display] = displays[data.display] or {}

				table.insert(displays[data.display], data)

			end

		end

		return displays

	end,
}

ns.domain.cooldownDomain = cooldownDomain
