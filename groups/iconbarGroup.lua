local addon, ns = ...

local layout = ns.lib.layout

local iconbarGroup = ns.group:new({

	type = "iconbar",

	new = function(self)

		local this = {}
		setmetatable(this, { __index = self })

		return this

	end,

	init = function(self, config)

		local frame = CreateFrame("Frame", config.name, UIParent)
		frame:SetPoint(unpack(config.position))
		layout.init(frame, {
			type = "HORIZONTAL",
			autosize = true,
			marginLeft = 4,
			marginRight = 4,
			defaultChildWidth = 32,
			defaultChildHeight = 32,
			forceChildSize = true,
		})

		self.frame = frame

	end,

	addChild = function(self, child)

		self.frame.add(child.view)

	end,

})

ns.groupFactory.add(iconbarGroup)
