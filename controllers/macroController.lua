local addon, ns = ...

local macroController = ns.controller:new({

	type = "macro",

	new = function(self, view, args)

		local this = {}
		setmetatable(this, { __index = self })

		this.bus = ns.bus:new()
		this.view = view
		this.args = args

		this.view:reset()

		return this

	end,

	enable = function(self)

		local macroName = self.args.macroName
		local filter = function(args)
			return  args.macroName == macroName
		end

		self.bus.subscribe("macroChanged", filter, function(args) self:onMacroChanged(args) end)

	end,

	disable = function(self)

		self.bus.unsubscribe("macroChanged")

	end,

	getMonitorConfigs = function(self)

		return {
			{ "macro", self.args.macroName },
		}

	end,

	onMacroChanged = function(self, args)

		self.view:setIcon(args.spellTexture or args.macroTexture)
		self.view:setCooldown(args.spellStart, args.spellDuration, 1, 0, 0)

	end,

})

ns.controllerFactory.add(macroController)
