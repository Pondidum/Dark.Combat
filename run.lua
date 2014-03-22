local addon, ns = ...

local run = function()

	local config = { spellID = 53817, glowOn = 5, controller = "aura" }

	local view = ns.viewFactory.getInstance("icon")
	view:init(UIParent)
	view.frame:SetSize(25, 25)

	local controller = ns.controllerFactory.create(config.controller, view, config)

	for i,v in ipairs(controller:getMonitorConfigs()) do
		ns.monitorFactory.startType(unpack(v))
	end

	controller:enable()


	local groups = {
		{
			name = "rotation",
			type = "iconbar",
			position = {"CENTER", "UIParent", "CENTER", 0, -150},
		},
	}

	for name, groupConfig in pairs(groups) do

		local group = ns.groupFactory.create(groupConfig.type)
		group:init(groupConfig)

		group:addChild(view)

	end

end

run()
