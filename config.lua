local addon, ns = ...

local config = {

	displays = {
		{ "configureDisplay", "rotation", { {"CENTER", "UIParent", "CENTER", 0, 0} } },	--?
	},

	cooldowns = {

		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", "spell", 17364 },	-- storm strike
		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", "macro", "EnhUnleash" },	-- unleash macro of win
		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", "spell", 53817 },	-- maelstrom weapon
		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", "spell", 117014 }, -- elemental blast
		{ "trackSpell", "rotation", "SHAMAN", "Elemental", "spell", 51505 },	-- lava burst
	},

}

ns.config = config
