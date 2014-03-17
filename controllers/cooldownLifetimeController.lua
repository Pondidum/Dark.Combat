local addon, ns = ...
local bus = ns.bus:new()

local cooldownLifetimeController = ns.controller:new({

	type = "cooldownLifetime",

	new = function(self, view, args)

		local this = {}
		setmetatable(this, { __index = self })

		this.view = view
		this.args = args

		this.view:setIcon(GetSpellTexture(args.spellID))

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

	getMonitorConfigs = function(self)

		return {
			{ "aura", "player", self.args.spellID },
			{ "cooldown", "player", self.args.spellID },
		}

	end,

	onAuraChanged = function(self, args)

		if args.spellID == self.args.spellID then

			if args.duration and args.duration > 0 then
				self.active = true
				self.view:showGlow()
				self.view:setCooldown(args.start, args.duration, args.duration, 0, 0)
			else
				self.active = false
				self.view:hideGlow()
			end

		end
	end,

	onCooldownChanged = function(self, args)
		if args.spellID == self.args.spellID then

			if not self.active then
				self.view:setCooldown(args.start, args.duration, args.duration, 0, 0)
			end

		end
	end,

})

ns.controllerFactory.add(cooldownLifetimeController)
