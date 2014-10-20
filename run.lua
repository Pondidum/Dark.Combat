local addon, ns = ...

local domain = ns.domain
local infrastructure = ns.infrastructure

local run = function()

	local reader = infrastructure.configReader:new()



	local talents = domain.talentCache:new()
	local cdDomain = domain.cooldownDomain:new(talents)
	reader:read(cdDomain, ns.config.cooldowns)

	local displayBuilder = ns.ui.displayBuilder:new()
	reader:read(displayBuilder, ns.config.displays)


	local orchestrator = ns.orchestrator:new(cdDomain, displayBuilder)

	Dark.combat = {
		talents = talents,
		cdDomain = cdDomain,
		orchestrator = orchestrator
	}

end

run()
