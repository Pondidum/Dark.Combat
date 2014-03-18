local addon, ns = ...

local run = function()

	--local config = { spellID = 16166, controller = "cooldownLifetime" }
	local config = { macroName = "EnhUnleash", controller = "macro" }

	local view = ns.viewFactory.getInstance("icon")
	view:init(UIParent)
	view.frame:SetPoint("LEFT", UIParent, "LEFT", 20, 0)
	view.frame:SetSize(25, 25)

	local controller = ns.controllerFactory.create(config.controller, view, config)

	for i,v in ipairs(controller:getMonitorConfigs()) do
		ns.monitorFactory.startType(unpack(v))
	end


	controller:enable()

end

run()
