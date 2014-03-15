local addon, ns = ...

local iconView = ns.view:new({

	type = "icon",

	new = function(self, id)

		local this = {}
		setmetatable(this, { __index = self })

		return this

	end,

	init = function(self, id, container)

		if not self.frame then

 			local button = CreateFrame("Frame", "DarkCombatIconView" .. id, container, "ActionButtonTemplate")
 			button:RegisterForClicks(nil);
			button:EnableMouse(false)

 			local glow = CreateFrame("Frame", nil, button, "ActionBarButtonSpellActivationAlert")
			glow:SetWidth(button:GetWidth() * 1.4)
			glow:SetHeight(button:GetHeight() * 1.4)
			glow:SetPoint("CENTER", button, "CENTER", 0 ,0)
			glow.animOut:SetScript("OnFinished", function(self) glow:Hide() end)

			local text = core.ui.createFont(button, core.fonts.normal, 18, 'OUTLINE')
			text:SetAllPoints(button)
			text:SetJustifyH("CENTER")

			local icon  = _G[name.."Icon"]
			local cooldown = _G[name.."Cooldown"]

			self.icon = icon
			self.cooldown = cooldown
			self.glow = glow
 			self.frame = button

		end

		self.frame:SetParent(container)

	end,

	setIcon = function(self, texture)
		self.icon:SetTexture(texture)
	end,

	setText = function(self, value)

	end,

	setCooldown = function(self, start, duration, active, stacks, maxStacks)
		CooldownFrame_SetTimer(self.cooldown, start, duration, active, stacks, maxStacks)
	end,

	showGlow = function(self)

		local glow = self.glow

		if glow.animOut:IsPlaying() then
			glow.animOut:Stop()
		end

		if not glow:IsVisible() then
			glow.animIn:Play()
		end

	end,

	hideGlow = function(self)

		local glow = self.glow

		if glow.animIn:IsPlaying() then
			glow.animIn:Stop()
		end

		if glow:IsVisible() then
			glow.animOut:Play()
		end

	end,

	setTextVisible = function(self)
		self.cooldown:Hide()
	end,

	setCooldownVisible = function(self)
		self.cooldown:Show()
	end,

})

ns.viewFactory.add(iconView)