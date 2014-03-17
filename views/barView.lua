local addon, ns = ...

local barView = ns.view:new({

	type = "bar",

	new = function(self, id)

		local this = {}
		setmetatable(this, { __index = self })
		this.id = id

		return this

	end,

	init = function(self, container)

	end,

})

ns.viewFactory.add(barView)
