local addon, ns = ...

local domain = ns.domain

local run = function()

	local talents = domain.talentCache:new()
	local cdDomain = domain.cooldownDomain:new(talents)
	local orchestrator = ns.orchestrator:new(cdDomain)

end

run()
