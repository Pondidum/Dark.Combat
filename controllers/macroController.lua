local addon, ns = ...
local bus = ns.bus:new()

local macroController = ns.controller:new({

	type = "macro",

	new = function(self, view, args)

		local this = {}
		setmetatable(this, { __index = self })

		this.view = view
		this.args = args

		return this

	end,

	enable = function(self)

		bus.subscribe("initialise", function(args) self:onInitialise(args) end)
		bus.subscribe("macroChanged", function(args) self:onMacroChanged(args) end)

	end,

	disable = function(self)

		bus.unsubscribe("onInitialise")
		bus.unsubscribe("macroChanged")

	end,

	getMonitorConfigs = function(self)

		return {
			{ "macro", self.args.macroName },
		}

	end,

	onMacroChanged = function(self, args)

		if args.macroName == self.args.macroName then

			self.view:setIcon(args.spellTexture or args.macroTexture)
			self.view:setCooldown(args.spellStart, args.spellDuration, 1, 0, 0)

		end

	end,

})

ns.controllerFactory.add(macroController)
