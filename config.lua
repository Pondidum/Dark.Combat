local addon, ns = ...

local config = {

	displays = {
		{ "configureDisplay", "rotation", { {"LEFT", "UIParent", "LEFT", 50, 0} } },	--?
	},

	cooldowns = {

		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", 17364 },	-- storm strike
		{ "trackSpell", "rotation", "SHAMAN", "Elemental", 51505 },	-- lava burst
		{ "trackSpell", "rotation", "SHAMAN", "Elemental", 117014 }, -- elemental blast
	},

}

ns.config = config
