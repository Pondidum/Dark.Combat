local addon, ns = ...
local bus = ns.bus
local events = ns.lib.events:new()

local auraMonitor = ns.monitor:new({

	new = function(self)

		local this = {}
		setmetatable(this, { __index = self })

		this.type = "aura"
		this.filter = {}

		return this

	end,

	enable = function(self)

		local message = {}

		local onUpdate = function(eventStore, event, unitID)

			local forUnit = self.filter[unitID]

			if not forUnit then
				return
			end


			for i, details in ipairs(forUnit) do

				local auraName, auraRank, auraTexture, auraCount, auraDispel, auraDuration, auraExpires, caster, isStealable = UnitAura(unitID, details.spellName, nil, details.spellFilter)

				table.wipe(message)

				message.spellName = details.spellName
				message.name = auraName
				message.texture = auraTexture
				message.start = (auraExpires or 0) - (auraDuration or 0)
				message.duration = auraDuration
				message.finish = auraExpires

				message.spellClass = auraDispel
				message.isStealable = isStealable


				bus.push("auraChanged", message)

			end


		end

		events.register("UNIT_AURA", onUpdate)
		-- events.register("PLAYER_TARGET_CHANGED", self.update)
		-- events.register("PLAYER_FOCUS_CHANGED", self.update)

	end,

	register = function(self, unit, spellID, spellFilter)

		local spellName, rank, texture = GetSpellInfo(spellID)

		self.filter[unit] = self.filter[unit] or {}

		local details = {
			spellName = spellName,
			spellFilter = spellFilter
		}

		table.insert(self.filter[unit], details)

	end,

})

ns.monitorFactory.add(auraMonitor)
