local addon, ns = ...
local config = ns.config
local events = ns.lib.events:new()

local run = function()

	local activeGroups = {}
	local activeControllers = {}

	for i, groupConfig in pairs(config.groups) do

		local group = ns.groupFactory.create(groupConfig.type)
		group:init(groupConfig)

		activeGroups[groupConfig.name] = group

	end

	local cleanOldControllersAndViews = function()

		for i,v in ipairs(activeControllers) do
			v:disable()
		end

		table.wipe(activeControllers)

		for name, group in pairs(activeGroups) do
			group:clearViews()
		end

		ns.viewFactory.recycleAll()

	end

	local getSpecConfig = function()

		local _, class = UnitClass("player")

		if not config.classes[class] then
			return
		end

		local specID = GetSpecialization()

		if not specID then
			return
		end

		local id, name = GetSpecializationInfo(specID)
		local specConfig = config.classes[class][name]

		return specConfig

	end

	local onSpecChanged = function()

		cleanOldControllersAndViews()

		local specConfig = getSpecConfig()

		if not specConfig then
			return
		end

		for groupName, children in pairs(specConfig) do

			local group = activeGroups[groupName]

			for i, childConfig in ipairs(children) do

				local view = group:createView()
				local controller = ns.controllerFactory.create(childConfig.controller, view, childConfig)

				for i,v in ipairs(controller:getMonitorConfigs()) do
					ns.monitorFactory.startType(unpack(v))
				end

				table.insert(activeControllers, controller)

			end

		end

		for i,v in ipairs(activeControllers) do
			v:enable()
		end

	end

	events.register("SPELLS_CHANGED", onSpecChanged)

end

run()
