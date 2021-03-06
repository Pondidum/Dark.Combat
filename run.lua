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

	Dark.combat = {
		talents = talents,
		cdDomain = cdDomain,
		orchestrator = orchestrator,
		config = ns.configui,

		addSpell = function(display, class, spec, action, id)

			table.insert(ns.config.cooldowns, { display, class, spec, action, id })

			cdDomain:readConfig(ns.config.cooldowns)
			orchestrator:spellsChanged()
		end,
	}

end

run()
