local addon, ns = ...
local bus = ns.bus
local events = ns.lib.events:new()

local auraMonitor = ns.monitor:new({

	type = "cooldown",

	new = function(self)

		local this = {}
		setmetatable(this, { __index = self })

		this.cooldowns = {}
		this.textures = {}

		return this

	end,

	enable = function(self)

		local textures = self.textures
		local cooldowns = self.cooldowns

		local message = {}

		local update = function(eventStore, event, unitID)

			for spellID, spellName in pairs(cooldowns) do

				local start, duration, enable = GetSpellCooldown(spellName)

				table.wipe(message)

				message.spellID = spellID
				message.spellName = spellName
				message.name = spellName
				message.texture = textures[spellName]
				message.start = start
				message.duration = duration
				message.finish = (start or 0) - (duration or 0)

				bus.push("cooldownChanged", message)

			end


		end

		events.register("ACTIONBAR_UPDATE_COOLDOWN", update)
		events.register("SPELL_UPDATE_USABLE", update)

	end,

	register = function(self, unit, spellID, spellFilter)

		local spellName, rank, texture = GetSpellInfo(spellID)

		self.cooldowns[spellID] = spellName
		self.textures[spellID] = texture

	end,

})

ns.monitorFactory.add(auraMonitor)
