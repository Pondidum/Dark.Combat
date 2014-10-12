local addon, ns = ...

local config = {

	cooldowns = {

		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", 17364 },	-- storm strike
		{ "trackSpell", "rotation", "SHAMAN", "Elemental", 51505 },	-- lava burst
		{ "trackSpell", "rotation", "SHAMAN", "Elemental", 117014 }, -- elemental blast
	},

}

ns.config = config
