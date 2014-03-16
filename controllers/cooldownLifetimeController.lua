local addon, ns = ...
local bus = ns.bus:new()

local cooldownLifetimeController = ns.controller:new({

	type = "cooldownLifetime",

	new = function(self, args)

		local this = {}

		setmetatable(this, { __index = self })

		return this

	end,

	enable = function(self)

		bus.subscribe("auraChanged", function(args) self:onAuraChanged(args) end)
		bus.subscribe("cooldownChanged", function(args) self:onCooldownChanged(args) end)

	end,

	disable = function(self)
		bus.unsubscribe("auraChanged")
		bus.unsubscribe("cooldownChanged")
	end,



	onAuraChanged = function(self, args)
		print("OnAuraChanged", args.spellName)
	end,

	onCooldownChanged = function(self, args)
		print("onCooldownChanged", args.spellName)
	end,

})

ns.controllerFactory.add(cooldownLifetimeController)
