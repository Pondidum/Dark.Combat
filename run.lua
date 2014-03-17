local addon, ns = ...

local run = function()

	local view = ns.viewFactory.getInstance("icon")
	view:init(UIParent)
	view.frame:SetPoint("LEFT", UIParent, "LEFT", 20, 0)
	view.frame:SetSize(25, 25)

	local controller = ns.controllerFactory.create("cooldownLifetime", view, { spellID = 16166 })

	for i,v in ipairs(controller:getMonitorConfigs()) do
		ns.monitorFactory.startType(unpack(v))
	end


	controller:enable()

	local bus = ns.bus:new()

	bus.push("initialise", { spellID = 16166 })



end

run()
