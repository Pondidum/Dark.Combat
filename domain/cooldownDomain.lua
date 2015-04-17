local addon, ns = ...

local class = ns.lib.class
local mixins = ns.lib.mixins

local cooldownModel = ns.domain.cooldownConfigModel

local domain = class:extend({

	events = {
		"PLAYER_TALENT_UPDATE",
		"ACTIVE_TALENT_GROUP_CHANGED",
	},

	ctor = function(self, talentCache)
		self:include(mixins.configReader)
		self:include(mixins.events)

		self.classes = {}
		self.talents = talentCache

		for i,class in ipairs(CLASS_SORT_ORDER) do
			self.classes[class] = {}
		end

	end,

	PLAYER_TALENT_UPDATE = function(self)
		self.talents:scanTalents()
	end,

	ACTIVE_TALENT_GROUP_CHANGED = function(self)
		self.talents:scanTalents()
	end,

	readConfigRow = function(self, methodName, ...)
		self[methodName](self, cooldownModel:new(...))
	end,

	clear = function(self)
		for k, v in pairs(self.classes) do
			table.wipe(v)
		end
	end,

	getSpellMonitor = function(self, action, data)

		local monitorName = action:lower() .. "Monitor"

		local monitor = ns.monitors[monitorName]

		if not monitor then
			print("Unknown monitor type " .. action)
			return {}
		end

		return monitor:new(unpack(data))

	end,

	trackSpell = function(self, model)

		local class = model.class
		local spec = model.spec

		local monitor = self:getSpellMonitor(model.action, model.data)
		monitor.display = model.display

		self.classes[class][spec] = self.classes[class][spec] or {}

		table.insert(self.classes[class][spec], monitor)

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
})

ns.domain.cooldownDomain = domain
