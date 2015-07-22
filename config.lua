local addon, ns = ...

local config = {

	displays = {
		{ "configureDisplay", "rotation", {"CENTER", "UIParent", "CENTER", 0, -150}, { 32, 32} },	--?
		{ "configureDisplay", "cooldowns", {"CENTER", "UIParent", "CENTER", 0, -115}, { 25, 25} },	--?
	},

	cooldowns = {

		{ "cooldowns", "SHAMAN", "Enhancement", "spell", 152255 },-- liquid magma
		{ "cooldowns", "SHAMAN", "Enhancement", "spell", 2894 },	-- fire elemental
		{ "cooldowns", "SHAMAN", "Enhancement", "spell", 51533 },	-- feral spirit
		{ "cooldowns", "SHAMAN", "Enhancement", "spell", 114051 },-- ascendance
		{ "cooldowns", "SHAMAN", "Enhancement", "spell", 16166 },	-- elemental mastery
		{ "cooldowns", "SHAMAN", "Enhancement", "spell", 16188 },	-- ancestral swiftness

		{ "rotation", "SHAMAN", "Elemental", "spell", 51505 },	-- lava burst


		{ "rotation", "DEATHKNIGHT", "Unholy", "spell", 45529, 114851 },	-- blood tap
		{ "rotation", "DEATHKNIGHT", "Unholy", "spell", 130736 },	-- soul reaper (unholy)
		{ "rotation", "DEATHKNIGHT", "Unholy", "spell", 81340 },	-- sudden doom
		{ "rotation", "DEATHKNIGHT", "Unholy", "spell", 91342 },	-- shadow infusion

		{ "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 47568 },	-- Empower Rune Weapon
		{ "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 20572 },	-- blood fury (attack power)
		{ "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 49206 },	-- summon gargoyle
		{ "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 152280 },-- defile
		{ "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 115989 },-- Unholy Blight

		{ "rotation", "DEATHKNIGHT", "Frost", "spell", 45529, 114851 },	-- blood tap
		{ "rotation", "DEATHKNIGHT", "Frost", "spell", 130735 },	-- soul reaper (frost)
		{ "rotation", "DEATHKNIGHT", "Frost", "spell", 51128 },	-- killing machine
		{ "rotation", "DEATHKNIGHT", "Frost", "spell", 59052 },	-- Freezing Fog (rime)

		{ "cooldowns", "DEATHKNIGHT", "Frost", "spell", 47568 },	-- Empower Rune Weapon
		{ "cooldowns", "DEATHKNIGHT", "Frost", "spell", 20572 },	-- blood fury (attack power)
		{ "cooldowns", "DEATHKNIGHT", "Frost", "spell", 51271 },	-- pillar of frost

		{ "rotation", "DRUID", "Feral", "spell", 5217 },		-- tigers fury
		{ "rotation", "DRUID", "Feral", "spell", 5221 },		-- shred
		{ "rotation", "DRUID", "Feral", "spell", 1822 },		-- rake
		{ "rotation", "DRUID", "Feral", "spell", 1079 },		-- rip
		{ "cooldowns", "DRUID", "Feral", "spell", 135700 },	-- clearcasting
		{ "cooldowns", "DRUID", "Feral", "spell", 102543 },	-- incarnation
		{ "cooldowns", "DRUID", "Feral", "spell", 26297 },	-- berserking (racial)
		{ "cooldowns", "DRUID", "Feral", "spell", 106951 },	-- berserk


		{ "rotation", "PALADIN", "Retribution", "spell", 20271 },	--judgement
		{ "rotation", "PALADIN", "Retribution", "spell", 35395 },	--crusader strike
		{ "rotation", "PALADIN", "Retribution", "spell", 85256 },	--templar's verdict
		{ "rotation", "PALADIN", "Retribution", "spell", 879 },	--exorcism
		{ "rotation", "PALADIN", "Retribution", "spell", 24275 },	--hammer of wrath
	},

}

ns.config = config
