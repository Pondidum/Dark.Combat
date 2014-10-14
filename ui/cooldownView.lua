local addon, ns = ...

local view = {

	new = function(self, name)

		local this = setmetatable({}, { __index = self })
		this.name = "DarkCombatCooldown" .. name

		this:ctor()

		return this
	end,

	ctor = function(self)

		local button = CreateFrame("Button", self.name, UIParent, "ActionButtonTemplate")

		local glow = CreateFrame("Frame", nil, button, "ActionBarButtonSpellActivationAlert")
		local icon  = button.icon --_G[name.."Icon"]
		local cooldown = button.cooldown -- _G[name.."Cooldown"]
		local text = core.ui.createFont(button, core.fonts.normal, 18, 'OUTLINE')

		button:RegisterForClicks(nil);
		button:EnableMouse(false)

		text:SetAllPoints(button)
		text:SetJustifyH("CENTER")

		glow:SetWidth(button:GetWidth() * 1.4)
		glow:SetHeight(button:GetHeight() * 1.4)
		glow:SetPoint("CENTER", button, "CENTER", 0 ,0)

		glow.animOut:SetScript("OnFinished", function(self) glow:Hide() end)

		self.frame = button
		self.cooldown = cooldown
		self.icon = icon
		self.glow = glow
		self.text = text

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

	setCooldown = function(self, start, duration, active, stacks, maxStacks)
		CooldownFrame_SetTimer(self.cooldown, start, duration, active, stacks, maxStacks)
	end
}

ns.ui.cooldownView = view
