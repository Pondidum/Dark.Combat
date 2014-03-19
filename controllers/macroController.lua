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

		local macroName = self.args.macroName
		local filter = function(args)
			return  args.macroName == macroName
		end

		bus.subscribe("macroChanged", filter, function(args) self:onMacroChanged(args) end)

	end,

	disable = function(self)

		bus.unsubscribe("macroChanged")

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
