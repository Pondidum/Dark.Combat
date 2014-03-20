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

			local filter = self.filter[unitID]

			if not filter then
				return
			end

			local i = 1
			local processNext = true

			repeat

				local auraName, auraRank, auraTexture, auraCount, auraDispel, auraDuration, auraExpires, caster, isStealable = UnitAura(unitID, i, filter)

				if auraName then

					table.wipe(message)

					message.spellID = details.spellID
					message.spellName = details.spellName
					message.name = auraName
					message.texture = auraTexture
					message.start = (auraExpires or 0) - (auraDuration or 0)
					message.duration = auraDuration
					message.finish = auraExpires

					message.spellClass = auraDispel
					message.isStealable = isStealable

					bus.push("unitAuraChanged", message)


				end

				--message stuff

				i = i + 1
				processNext = auraName ~= nil

			until i >= 20 or not processNext

		end

		events.register("UNIT_AURA", onUpdate)
		-- events.register("PLAYER_TARGET_CHANGED", self.update)
		-- events.register("PLAYER_FOCUS_CHANGED", self.update)

	end,

	register = function(self, unit, filter)
		self.units[unit] = filter
	end,

})

ns.monitorFactory.add(auraMonitor)
