local addon, ns = ...

local controllers = {}

local controllerFactory = {

	add = function(controller)
		controllers[controller.type] = controller
	end,

	getInstance = function(type, ...)

		local controller = controllers[type]

		if controller then
			return controller:new(...)
		end

	end,

}

ns.controllerFactory = controllerFactory
