local addon, ns = ...

local domain = ns.domain
local infrastructure = ns.infrastructure

local run = function()

	local talents = domain.talentCache:new()
	local cdDomain = domain.cooldownDomain:new(talents)

	local reader = infrastructure.configReader:new(cdDomain)
	reader:read(ns.config.cooldowns)

	local scanner = domain.cooldownScanner:new()

	local orchestrator = ns.orchestrator:new(cdDomain, scanner)

	Dark.combat = {
		talents = talents,
		cdDomain = cdDomain,
		orchestrator = orchestrator
	}

end

run()
