local addon, ns = ...

local views = {}

local viewFactory = {

	add = function(view)
		views[view.type] = view
	end,
}

ns.viewFactory = viewFactory
