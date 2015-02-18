local addon, ns = ...

local core = Dark.core

ns.lib = {
	cache = Darker.mixins.cache,
	layout = Darker.layoutEngine,
	style = Darker.style,
	media = Darker.media,
	spellData = Darker.spellData,
	class = Darker.class,
	events = Darker.events,
	mixins = Darker.mixins,
	controls = Darker.controls
}

ns.infrastructure = {}
ns.monitors = {}
ns.domain = {}
ns.ui = {}
ns.configui = {}
