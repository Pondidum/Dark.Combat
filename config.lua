local addon, ns = ...

local config = {

	displays = {
		{ "configureDisplay", "rotation", { {"LEFT", "UIParent", "LEFT", 50, 0} } },	--?
	},

	cooldowns = {

		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", "spell", 17364 },	-- storm strike
		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", "spell", 117014 }, -- elemental blast
		{ "trackSpell", "rotation", "SHAMAN", "Elemental", "spell", 51505 },	-- lava burst
	},

}

ns.config = config
