local addon, ns = ...

local views = {}
local instances = {}
local id = 0

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

		local view = getFirstFreeView(viewType)

		if not view then
			id = id + 1
			view = views[viewType]:new(id)
		end

		instances[view] = true

		return view

	end,

	recycle = function(view)

		if instances[view] then
			instances[view] = false
		end

	end,
}

ns.viewFactory = viewFactory
