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
		{ type = "textbox", key = "name" },
		{ type = "label",	text = "Point" },
		{ type = "textbox", key = "point" },
		{ type = "label",	text = "target" },
		{ type = "textbox", key = "target" },
		{ type = "label",	text = "TargetPoint" },
		{ type = "textbox", key = "targetPoint" },
		{ type = "label",	text = "X Offset" },
		{ type = "textbox", key = "offsetX" },
		{ type = "label",	text = "Y Offset" },
		{ type = "textbox", key = "offsetY" },
	}
}

local displayComponent = class:extend({

	ctor = function(self, host, data)

		displayConfig.name = data.name
		local component = controls.dsl:single(host, displayConfig)

		self.data = data
		self.frame = component.frame
		self.controls = component.controls

		self:populate()
	end,

	populate = function(self)

		local controls = self.controls
		local data = self.data

		local name = data.name
		local point, target, targetPoint, x, y = unpack(data.point)
		local childWidth, childHeight = unpack(data.childSize)

		controls.name:text(name)
		controls.point:text(point)
		controls.target:text(target)
		controls.targetPoint:text(targetPoint)
		controls.offsetX:text(x)
		controls.offsetY:text(y)

	end,

})

ns.displayComponent = displayComponent
