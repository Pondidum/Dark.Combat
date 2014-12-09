local addon, ns = ...

local config = {

	displays = {
		{ "configureDisplay", "rotation", { {"CENTER", UIParent, "CENTER", 0, -150} }, { 32, 32} },	--?
		{ "configureDisplay", "cooldowns", { {"CENTER", UIParent, "CENTER", 0, -115} }, { 25, 25} },	--?
	},

	cooldowns = {
		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", "spell", 8056 },	-- frost shock
		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", "spell", 60103 },	-- lava lash
		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", "spell", 17364 },	-- storm strike
		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", "macro", "EnhUnleash" },	-- unleash macro of win
		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", "spell", 53817 },	-- maelstrom weapon
		{ "trackSpell", "rotation", "SHAMAN", "Enhancement", "spell", 117014 }, -- elemental blast

		{ "trackSpell", "cooldowns", "SHAMAN", "Enhancement", "spell", 152255 },-- liquid magma
		{ "trackSpell", "cooldowns", "SHAMAN", "Enhancement", "spell", 2894 },	-- fire elemental
		{ "trackSpell", "cooldowns", "SHAMAN", "Enhancement", "spell", 51533 },	-- feral spirit
		{ "trackSpell", "cooldowns", "SHAMAN", "Enhancement", "spell", 165341 },-- ascendance
		{ "trackSpell", "cooldowns", "SHAMAN", "Enhancement", "spell", 16166 },	-- elemental mastery
		{ "trackSpell", "cooldowns", "SHAMAN", "Enhancement", "spell", 16188 },	-- ancestral swiftness

		{ "trackSpell", "rotation", "SHAMAN", "Elemental", "spell", 51505 },	-- lava burst


		{ "trackSpell", "rotation", "DEATHKNIGHT", "Unholy", "spell", 45529 },	-- blood tap
		{ "trackSpell", "rotation", "DEATHKNIGHT", "Unholy", "spell", 130736 },	-- soul reaper (unholy)
		{ "trackSpell", "rotation", "DEATHKNIGHT", "Unholy", "spell", 81340 },	-- sudden doom
		{ "trackSpell", "rotation", "DEATHKNIGHT", "Unholy", "spell", 91342 },	-- shadow infusion

		{ "trackSpell", "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 47568 },	-- Empower Rune Weapon
		{ "trackSpell", "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 20572 },	-- blood fury (attack power)
		{ "trackSpell", "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 49206 },	-- summon gargoyle
	},

}

ns.config = config
