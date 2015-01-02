local addon, ns = ...

local class = ns.lib.class
local controls = ns.lib.controls

local displayConfig = {
	type = "group",
	layout = "horizontal",
	origin = "LEFT",
	itemSpacing = 5,
	wrap = false,
	autosize = "x",
	controls = {
		{ type = "textbox", name = "$parentName" },
		{ type = "label",	text = "Point" },
		{ type = "textbox", name = "$parentPoint" },
		{ type = "label",	text = "target" },
		{ type = "textbox", name = "$parentTarget" },
		{ type = "label",	text = "TargetPoint" },
		{ type = "textbox", name = "$parentTargetPoint" },
		{ type = "label",	text = "X Offset" },
		{ type = "textbox", name = "$parentOffsetX" },
		{ type = "label",	text = "Y Offset" },
		{ type = "textbox", name = "$parentOffsetY" },
	}
}

local displayComponent = class:extend({

	ctor = function(self, host, data)

		displayConfig.name = data.name
		local component = controls.dsl:single(host, displayConfig)

		self.frame = component.frame
		self.data = data

		self:populate()
	end,

	populate = function(self)


	end,

})

ns.displayComponent = displayComponent
