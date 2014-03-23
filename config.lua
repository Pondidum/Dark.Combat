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

		},

		rotation = {
			{ spellID = 8042, controller = "cooldownLifetime" },	-- earthshock
			{ spellID = 60103, controller = "cooldownLifetime" },	-- lava lash
			{ spellID = 17364, controller = "cooldownLifetime" },	-- stormstrike
			{ macroName = "EnhUnleash", controller = "macro" },			-- unleash/flameshock macro
			{ spellID = 53817, glowOn = 5, controller = "aura" }, -- maelstrom weapon
		}
	}
}


ns.config = config