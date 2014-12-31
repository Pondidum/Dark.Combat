local addon, ns = ...

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

