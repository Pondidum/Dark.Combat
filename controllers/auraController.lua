local addon, ns = ...

local auraController = ns.controller:new({

	type = "aura",

	new = function(self, view, args)

		local this = {}
		setmetatable(this, { __index = self })

		this.bus = ns.bus:new()
		this.view = view
		this.args = args

		this.view:reset()
		this.view:setIcon(GetSpellTexture(args.spellID))

		return this

	end,

	enable = function(self)

		local spellID = self.args.spellID
		local filter = function(args)
			return args.spellID == spellID
		end

		self.bus.subscribe("auraChanged", filter, function(args) self:onAuraChanged(args) end)

	end,

	disable = function(self)

		self.bus.unsubscribe("auraChanged")

	end,

	getMonitorConfigs = function(self)

		return {
			{ "aura", "player", self.args.spellID },
		}

	end,

	onAuraChanged = function(self, args)

		if self.args.glowOn then

			local stacks = args.stacks or 0

			if stacks > 0 then
				self.view:setText(args.stacks)
			else
				self.view:setText("")
			end

			if stacks == self.args.glowOn then
				self.view:showGlow()
			else
				self.view:hideGlow()
			end

		else
			self.view:setCooldown(args.start, args.duration, args.duration, 0, 0)
		end

	end,

})

ns.controllerFactory.add(auraController)
