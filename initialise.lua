local addon, ns = ...

local initialise = function()

	local core = Dark.core

	ns.lib = {
		events = core.events,
		style = core.style,
		ui = core.ui,
		layout = core.layout,
	}

end

initialise()
