local addon, ns = ...

local views = {}
local instances = {}

local getFirstFreeView = function(viewType)

	for view, inUse in pairs(instances) do

		if view.type == viewType and not inUse then
			return view
		end

	end

end

local viewFactory = {

	add = function(view)
		views[view.type] = view
	end,

	getInstance = function(viewType)

		assert(views[viewType], string.format("No view type '%s' defined.", viewType))

		local view = getFirstFreeView(viewType) or views[viewType]:new()

		instances[view] = true

		return view

	end,

}

ns.viewFactory = viewFactory
