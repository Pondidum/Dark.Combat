local addon, ns = ...

local iconView = ns.view:new({

	type = "icon",

	new = function(self)

		local this = {}
		setmetatable(this, { __index = self })

		return this

	end,
})

ns.viewFactory.add(iconView)
