local addon, ns = ...

local run = function()

	ns.monitorFactory.startType("aura", "player", 16166) -- em
	ns.monitorFactory.startType("cooldown", "player", 16166) -- em

	local view = ns.viewFactory.getInstance("icon")
	view:init(1, UIParent)
	view.frame:SetPoint("LEFT", UIParent, "LEFT", 20, 0)
	view.frame:SetSize(25, 25)
	
	local controller = ns.controllerFactory.create("cooldownLifetime", view, { spellID = 16166 })
	controller:enable()

	local bus = ns.bus:new()

	bus.push("initialise", { spellID = 16166, texture = GetSpellTexture(16166) })
end

run()
