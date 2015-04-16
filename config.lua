local addon, ns = ...

local config = {

	displays = {
		{ "configureDisplay", "rotation", {"CENTER", "UIParent", "CENTER", 0, -150}, { 32, 32} },	--?
		{ "configureDisplay", "cooldowns", {"CENTER", "UIParent", "CENTER", 0, -115}, { 25, 25} },	--?
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
		{ "trackSpell", "cooldowns", "SHAMAN", "Enhancement", "spell", 114051 },-- ascendance
		{ "trackSpell", "cooldowns", "SHAMAN", "Enhancement", "spell", 16166 },	-- elemental mastery
		{ "trackSpell", "cooldowns", "SHAMAN", "Enhancement", "spell", 16188 },	-- ancestral swiftness

		{ "trackSpell", "rotation", "SHAMAN", "Elemental", "spell", 51505 },	-- lava burst


		{ "trackSpell", "rotation", "DEATHKNIGHT", "Unholy", "spell", 45529, 114851 },	-- blood tap
		{ "trackSpell", "rotation", "DEATHKNIGHT", "Unholy", "spell", 130736 },	-- soul reaper (unholy)
		{ "trackSpell", "rotation", "DEATHKNIGHT", "Unholy", "spell", 81340 },	-- sudden doom
		{ "trackSpell", "rotation", "DEATHKNIGHT", "Unholy", "spell", 91342 },	-- shadow infusion

		{ "trackSpell", "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 47568 },	-- Empower Rune Weapon
		{ "trackSpell", "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 20572 },	-- blood fury (attack power)
		{ "trackSpell", "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 49206 },	-- summon gargoyle
		{ "trackSpell", "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 152280 },-- defile
		{ "trackSpell", "cooldowns", "DEATHKNIGHT", "Unholy", "spell", 115989 },-- Unholy Blight

		{ "trackSpell", "rotation", "DEATHKNIGHT", "Frost", "spell", 45529, 114851 },	-- blood tap
		{ "trackSpell", "rotation", "DEATHKNIGHT", "Frost", "spell", 130735 },	-- soul reaper (frost)
		{ "trackSpell", "rotation", "DEATHKNIGHT", "Frost", "spell", 51128 },	-- killing machine
		{ "trackSpell", "rotation", "DEATHKNIGHT", "Frost", "spell", 59052 },	-- Freezing Fog (rime)

		{ "trackSpell", "cooldowns", "DEATHKNIGHT", "Frost", "spell", 47568 },	-- Empower Rune Weapon
		{ "trackSpell", "cooldowns", "DEATHKNIGHT", "Frost", "spell", 20572 },	-- blood fury (attack power)
		{ "trackSpell", "cooldowns", "DEATHKNIGHT", "Frost", "spell", 51271 },	-- pillar of frost

		{ "trackSpell", "rotation", "DRUID", "Feral", "spell", 5217 },		-- tigers fury
		{ "trackSpell", "rotation", "DRUID", "Feral", "spell", 5221 },		-- shred
		{ "trackSpell", "rotation", "DRUID", "Feral", "spell", 1822 },		-- rake
		{ "trackSpell", "rotation", "DRUID", "Feral", "spell", 1079 },		-- rip
		{ "trackSpell", "cooldowns", "DRUID", "Feral", "spell", 135700 },	-- clearcasting
		{ "trackSpell", "cooldowns", "DRUID", "Feral", "spell", 102543 },	-- incarnation
		{ "trackSpell", "cooldowns", "DRUID", "Feral", "spell", 26297 },	-- berserking (racial)
		{ "trackSpell", "cooldowns", "DRUID", "Feral", "spell", 106951 },	-- berserk


		{ "trackSpell", "rotation", "PALADIN", "Retribution", "spell", 20271 },	--judgement
		{ "trackSpell", "rotation", "PALADIN", "Retribution", "spell", 35395 },	--crusader strike
		{ "trackSpell", "rotation", "PALADIN", "Retribution", "spell", 85256 },	--templar's verdict
		{ "trackSpell", "rotation", "PALADIN", "Retribution", "spell", 879 },	--exorcism
		{ "trackSpell", "rotation", "PALADIN", "Retribution", "spell", 24275 },	--hammer of wrath
	},

}

ns.config = config
