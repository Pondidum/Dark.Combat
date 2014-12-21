local addon, ns = ...

local core = Dark.core

ns.lib = {
	events = core.events,
	cache = core.cache,
	layout = core.layout,
	ui = core.ui,
	style = core.style,
	class = Darker.class,
	mixins = Darker.mixins,
}

ns.infrastructure = {}
ns.monitors = {}
ns.domain = {}
ns.ui = {}
