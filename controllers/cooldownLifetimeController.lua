local addon, ns = ...
local bus = ns.bus:new()

local cooldownLifetimeController = ns.controller:new({

	type = "cooldownLifetime",

	new = function(self, view, args)

		local this = {}
		setmetatable(this, { __index = self })

		this.view = view
		this.args = args

		return this

	end,

	enable = function(self)

		bus.subscribe("auraChanged", function(args) self:onAuraChanged(args) end)
		bus.subscribe("cooldownChanged", function(args) self:onCooldownChanged(args) end)
		bus.subscribe("initialise", function(args) self:onInitialise(args) end)
	end,

	disable = function(self)
		bus.unsubscribe("auraChanged")
		bus.unsubscribe("cooldownChanged")
	end,


	onInitialise = function(self, args)
		self.view:setIcon(args.texture)
	end,

	onAuraChanged = function(self, args)
		if args.spellID == self.args.spellID then
		end
	end,

	onCooldownChanged = function(self, args)
		if args.spellID == self.args.spellID then
			local view = self.view
			view:setCooldown(args.start, args.duration, args.duration, 0, 0)
		end
	end,

})

ns.controllerFactory.add(cooldownLifetimeController)
