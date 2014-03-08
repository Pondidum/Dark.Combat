local addon, ns = ...

local monitors = {}
local running = {}

local monitorFactory = {

	add = function(monitor)

		assert(not monitors[monitor.type], "Monitor for type " .. monitor.type .. " is already registered.")

		monitors[monitor.type] = monitor

	end,

	startType = function(type, ...)

		local monitor = running[type]

		if not monitor then

			monitor = monitors[type]:new()
			monitor:enable()

			running[type] = monitor

		end

		monitor:register(...)

	end,

}

ns.monitorFactory = monitorFactory
