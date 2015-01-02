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
		{ type = "textbox", text = "DisplayName" },
		{ type = "label", text = "Point" },
		{ type = "textbox", text = "TOP" },
		{ type = "label", text = "target" },
		{ type = "textbox", text = "UIParent" },
		{ type = "label", text = "TargetPoint" },
		{ type = "textbox", text = "CENTER" },
		{ type = "label", text = "X Offset" },
		{ type = "textbox", text = "0" },
		{ type = "label", text = "Y Offset" },
		{ type = "textbox", text = "-200" },
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
