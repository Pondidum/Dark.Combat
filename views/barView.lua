local addon, ns = ...

local core = Dark.core
local style = core.style
local ui = core.ui

local barView = ns.view:new({

	type = "bar",

	new = function(self, id)

		local this = {}
		setmetatable(this, { __index = self })
		this.id = id

		return this

	end,

	init = function(self, container)

		if not self.frame then

			local name = "DarkCombatBarView" .. self.id
			local frame = CreateFrame("Frame", name, container)

			style.addBackground(frame)
			style.addShadow(frame)

			local icon = frame:CreateTexture()
			icon:SetPoint("TOPLEFT")
			icon:SetPoint("BOTTOMLEFT")
			icon:SetTexCoord(.08, .92, .08, .92)
			icon:SetWidth(20)

			local stacks = ui.createFont(frame, nil, 16, "OUTLINE")
			stacks:SetAllPoints(icon)
			stacks:SetJustifyH("CENTER")

			local bar = ui.createCooldownBar(nil, frame)
			bar:SetStatusBarTexture(core.textures.normal)
			bar:SetPoint("BOTTOMLEFT", icon, "BOTTOMRIGHT", 0, 0)
			bar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0)

			local name = ui.createFont(bar)
			name:SetPoint("TOPLEFT", 5, 0)
			name:SetPoint("BOTTOMLEFT", 5, 0)
			name:SetPoint("RIGHT", bar, "CENTER", 0, 0)

			self.icon = icon
			self.bar = bar
			self.stacks = stacks
			self.name = name
			self.frame = frame
			self.remaining = 0

		end

		self.frame:SetParent(container)

	end,

	setIcon = function(self, texture)
		self.icon:SetTexture(texture)
	end,

	setText = function(self, value)

	end,

	setCooldown = function(self, start, duration, active, stacks, maxStacks)
		self.bar.setCooldown(start, duration)
		self.remaining = duration - (GetTime() - start)
	end,
})

ns.viewFactory.add(barView)
