local addon, ns = ...

local talentCache = {

	new = function(self)

		local this = setmetatable({}, { __index = self })

		this.activeTalents = {}
		this.talents = {}

		return this

	end,

	isActive = function(self, spellName)

		return self.activeTalents[spellName]

	end,

	isTalent = function(self, spellName)

		return self.talents[spellName]

	end,

	scanTalents = function(self)

		table.wipe(self.activeTalents)
		table.wipe(self.talents)

		local group = GetActiveSpecGroup()

		for tier = 1, MAX_TALENT_TIERS do
			for column = 1, NUM_TALENT_COLUMNS do

				local talentID, name, texture, selected, available = GetTalentInfo(tier, column, group)

				if selected then
					self.activeTalents[name] = true
				end

				self.talents[name] = true
			end
		end

	end,
}

ns.domain.talentCache = talentCache
