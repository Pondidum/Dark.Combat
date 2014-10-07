local addon, ns = ...

local eventStore = ns.lib.events

local talentCache = {

	new = function(self)

		local this = setmetatable({}, { __index = self })

		this.activeTalents = {}
		this.events = eventStore.new()

		this.events.register("PLAYER_TALENT_UPDATE", function() self:scanTalents() end)
		this.events.register("ACTIVE_TALENT_GROUP_CHANGED", function() self:scanTalents() end)

		return this

	end,

	isActive = function(self, spellName)

		return self.activeTalents[spellName]

	end,

	scanTalents = function(self)

		table.wipe(self.activeTalents)

		for i = 1, GetNumTalents() do

			local name, texture, tier, column, selected, available = GetTalentInfo(i)

			if selected then
				self.activeTalents[name] = true
			end

		end

	end,
}

ns.talentCache = talentCache