local addon, ns = ...

local dsl = ns.lib.controls.dsl

local configUiConfig = {
	type = "frame",
	name = "DarkCombatConfig",
	size = { 400, 500},
	controls = {
		{
			type = "label",
			name = "$parentHeader",
			text = "Dark.Combat Configuration",
			align = "center",
			points = {
				{ "TOPLEFT", "$parent", "TOPLEFT", 0, 0 },
				{ "TOPRIGHT", "$parent", "TOPRIGHT", 0, 0 }
			},
			height = 30,
		},
		{
			type = "group",
			name = "$parentSpells",
			layout = "vertical",
			origin = "TOP",
			itemspacing = 5,
			wrap = false,
			points = {
				{ "TOPLEFT", "$parentHeader", "BOTTOMLEFT", 0, 0 },
				{ "RIGHT", "$parent", "CENTER", 0, 0 },
				{ "BOTTOM", "$parent", "BOTTOM", 0, 0 },
			}
		},
		{
			type = "group",
			name = "$parentDisplays",
			layout = "vertical",
			origin = "TOP",
			itemspacing = 5,
			wrap = false,
			points = {
				{ "TOPRIGHT", "$parentHeader", "BOTTOMRIGHT", 0, 0 },
				{ "LEFT", "$parent", "CENTER", 0, 0 },
				{ "BOTTOM", "$parent", "BOTTOM", 0, 0 },
			}
		}
	}
}

local configui = {

	new = function(self, parent)

		return dsl:single(parent, configUiConfig)

	end,
}

ns.configui.configui = configui
