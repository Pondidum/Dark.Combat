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

		local frame = CreateFrame("Frame", "DarkCombatGroup" .. config.name, UIParent)
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

		self.config = config
		self.frame = frame

	end,

	createView = function(self)

		local view = ns.viewFactory.getInstance("icon")
		view:init(self.frame)
		view.frame:SetSize(unpack(self.config.viewSize))

		self.frame.add(view.frame)

		return view

	end,

	clearViews = function(self)
		self.frame.clear()
	end,

})

ns.groupFactory.add(iconbarGroup)
