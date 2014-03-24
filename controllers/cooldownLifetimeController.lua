local addon, ns = ...


local cooldownLifetimeController = ns.controller:new({

	type = "cooldownLifetime",

	new = function(self, view, args)

		local this = {}
		setmetatable(this, { __index = self })

		this.bus = ns.bus:new()
		this.view = view
		this.args = args

		this.view:reset()
		this.view:setTextVisible()
		this.view:setIcon(GetSpellTexture(args.spellID))

		return this

	end,

	enable = function(self)

		local spellID = self.args.spellID
		local filter = function(args)
			return args.spellID == spellID
		end

		self.bus.subscribe("auraChanged", filter, function(args) self:onAuraChanged(args) end)
		self.bus.subscribe("cooldownChanged", filter, function(args) self:onCooldownChanged(args) end)

	end,

	disable = function(self)

		self.bus.unsubscribe("auraChanged")
		self.bus.unsubscribe("cooldownChanged")

	end,

	getMonitorConfigs = function(self)

		return {
			{ "aura", "player", self.args.spellID },
			{ "cooldown", self.args.spellID },
		}

	end,

	onAuraChanged = function(self, args)

		if args.duration and args.duration > 0 then
			self.active = true
			self.view:showGlow()
			self.view:setCooldown(args.start, args.duration, args.duration, 0, 0)
		else
			self.active = false
			self.view:hideGlow()
		end

	end,

	onCooldownChanged = function(self, args)

		if not self.active then
			self.view:setCooldown(args.start, args.duration, args.duration, 0, 0)
		end

	end,

})

ns.controllerFactory.add(cooldownLifetimeController)
