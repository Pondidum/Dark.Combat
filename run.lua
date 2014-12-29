local addon, ns = ...

local domain = ns.domain
local infrastructure = ns.infrastructure

local run = function()

	local talents = domain.talentCache:new()
	local cdDomain = domain.cooldownDomain:new(talents)
	local displayBuilder = ns.ui.displayBuilder:new()

	cdDomain:readConfig(ns.config.cooldowns)
	displayBuilder:readConfig(ns.config.displays)

	local orchestrator = ns.orchestrator:new(cdDomain, displayBuilder)

	local config = ns.configui.configui:new(displayBuilder)
	config:populate()

	Dark.combat = {
		talents = talents,
		cdDomain = cdDomain,
		orchestrator = orchestrator,
		config = ns.configui,
	}

end

run()
