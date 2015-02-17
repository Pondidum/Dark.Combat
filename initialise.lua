local addon, ns = ...

local core = Dark.core

ns.lib = {
	events = core.events,
	cache = core.cache,
	layout = core.layout,
	--ui = core.ui,
	style = core.style,
	media = Darker.media,
	spellData = Darker.spellData,
	class = Darker.class,
	mixins = Darker.mixins,
	controls = Darker.controls
}

ns.infrastructure = {}
ns.monitors = {}
ns.domain = {}
ns.ui = {}
ns.configui = {}
