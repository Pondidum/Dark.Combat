local addon, ns = ...

local class = ns.lib.class
local controls = ns.lib.controls

local configUiConfig = {
	type = "frame",
	name = "DarkCombatConfig",
	size = { 800, 500 },
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
			type = "scroll",
			name = "$parentSpells",
			points = {
				{ "TOPLEFT", "$parentHeader", "BOTTOMLEFT", 0, 0 },
				{ "RIGHT", "$parent", "CENTER", 0, 0 },
				{ "BOTTOM", "$parent", "BOTTOM", 0, 0 },
			},
			controls = {
				{
					type = "group",
					name = "$parentContainer",
					layout = "vertical",
					origin = "TOP",
					itemSpacing = 5,
					wrap = false,
					points = {
						{"LEFT", "$parent", "LEFT", 0, 0},
						{"RIGHT", "$parent", "RIGHT", 0, 0},
					},
					customise = function(frame)
						frame.bg:Hide()
					end,
				}
			},
		},
		{
			type = "scroll",
			name = "$parentDisplays",
			points = {
				{ "TOPRIGHT", "$parentHeader", "BOTTOMRIGHT", 0, 0 },
				{ "LEFT", "$parent", "CENTER", 0, 0 },
				{ "BOTTOM", "$parent", "BOTTOM", 0, 0 },
			},
			controls = {
				{
					type = "group",
					name = "$parentContainer",
					layout = "vertical",
					origin = "TOP",
					itemSpacing = 5,
					wrap = false,
					points = {
						{"LEFT", "$parent", "LEFT", 0, 0},
						{"RIGHT", "$parent", "RIGHT", 0, 0},
					},
					customise = function(frame)
						frame.bg:Hide()
					end,
				}
			},
		}
	}
}

local configui = class:extend({

	ctor = function(self, displayBuilder)

		self.displayBuilder = displayBuilder

		self.component = controls.dsl:single(UIParent, configUiConfig)
		self.component.frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 50, -50)

	end,

	populate = function(self)

		local host = DarkCombatConfigDisplaysContainer

		for name, container in pairs(self.displayBuilder.containers) do

			local label = controls.label:new(host, {
				text = name,
				width = 50,
				height = 20,
				name = "$parent"..name
			})

			host.add(label.frame)

		end

	end,

})

ns.configui.configui = configui
