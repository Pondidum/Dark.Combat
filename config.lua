local addon, ns = ...

local config = {
	groups = {},
	classes = {},
}

config.groups = {
	{
		name = "cooldowns",
		type = "iconbar",
		position = {"CENTER", UIParent, "CENTER", 0, -115},
		viewSize = {25, 25},
	},

	{
		name = "rotation",
		type = "iconbar",
		position = {"CENTER", UIParent, "CENTER", 0, -150},
		viewSize = {32, 32},
	},
}

config.classes.SHAMAN = {

	["Enhancement"] = {

		cooldowns = {
			{ spellID = 120668, controller="cooldownLifetime" },		--stormlash
			{ spellID = 2894, controller="cooldownLifetime" },			--fire elemental
			{ spellID = 51533, controller="cooldownLifetime" },			--feral spirit
			{ spellID = 114049, controller="cooldownLifetime" },		--ascendance
			--{ spellID = {10, 96228} },	--gloves, synapse springs (agility)
			{ spellID = 16166, controller="cooldownLifetime" },			--elemental mastery
		},

		rotation = {
			{ spellID = 8042, controller = "cooldownLifetime" },	-- earthshock
			{ spellID = 60103, controller = "cooldownLifetime" },	-- lava lash
			{ spellID = 17364, controller = "cooldownLifetime" },	-- stormstrike
			{ macroName = "EnhUnleash", controller = "macro" },		-- unleash/flameshock macro
			{ spellID = 53817, glowOn = 5, controller = "aura" }, -- maelstrom weapon
		}
	}
}


ns.config = config