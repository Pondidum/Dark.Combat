local addon, ns = ...

local run = function()

	local talents = ns.talentCache:new()
	local domain = ns.cooldownDomain:new(talents)
	local orchestrator = ns.orchestrator:new(domain)

end

run()
