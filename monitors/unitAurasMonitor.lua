local addon, ns = ...
local bus = ns.bus
local events = ns.lib.events:new()

local auraMonitor = ns.monitor:new({

	type = "unitAuras",

	new = function(self)

		local this = {}
		setmetatable(this, { __index = self })

		this.units = {}

		return this

	end,

	enable = function(self)

		local message = {}

		local onUpdate = function(eventStore, event, unitID)

			local forUnit = self.filter[unitID]

			if not forUnit then
				return
			end

			local i = 1
			local processNext = true

			repeat

				local auraName, auraRank, auraTexture, auraCount, auraDispel, auraDuration, auraExpires, caster, isStealable = UnitAura(unitID, i, spellFilter)


				--message stuff

				i = i + 1
				processNext = auraName ~= nil

			until i >= 20 or not processNext

		end

		events.register("UNIT_AURA", onUpdate)
		-- events.register("PLAYER_TARGET_CHANGED", self.update)
		-- events.register("PLAYER_FOCUS_CHANGED", self.update)

	end,

	register = function(self, unit)
		self.units[unit] = true
	end,

})

ns.monitorFactory.add(auraMonitor)
