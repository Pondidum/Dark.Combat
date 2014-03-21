local addon, ns = ...

local auraController = ns.controller:new({

	type = "aura",

	new = function(self, view, args)

		local this = {}
		setmetatable(this, { __index = self })

		this.view = view
		this.args = args

		this.view:setIcon(GetSpellTexture(args.spellID))

		return this

	end,

	enable = function(self)

		local spellID = self.args.spellID
		local filter = function(args)
			return args.spellID == spellID
		end

		bus.subscribe("auraChanged", filter, function(args) self:onAuraChanged(args) end)

	end,

	disable = function(self)

		bus.unsubscribe("auraChanged")

	end,

	onAuraChanged = function(self, args)

		if self.args.glowOn then

			if args.stacks == self.args.glowOn then
				self.view:setText(args.stacks)
				self.view:showGlow()
			else
				self.view:setText("")
				self.view:hideGlow()
			end

		else
			self.view:setCooldown(args.start, args.duration, args.duration, 0, 0)
		end

	end,

})

ns.controllerFactory.add(auraController)
