local addon, ns = ...

local ui = ns.lib.ui
local style = ns.lib.style

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
		local icon  = button.icon
		local cooldown = button.cooldown
		local text = ui.createFont(button, nil, 18, 'OUTLINE')

		button:RegisterForClicks(nil);
		button:EnableMouse(false)

		style.actionButton(button)

		text:SetAllPoints(button)
		text:SetJustifyH("CENTER")
		text:Hide()

		glow:SetWidth(button:GetWidth() * 1.4)
		glow:SetHeight(button:GetHeight() * 1.4)
		glow:SetPoint("CENTER", button, "CENTER", 0 ,0)

		glow.animOut:SetScript("OnFinished", function(self) glow:Hide() end)

		cooldown:Show()

		self.frame = button
		self.cooldown = cooldown
		self.icon = icon
		self.glow = glow
		self.text = text

	end,

	update = function(self, spell)

		self.frame:Show()
		self.icon:SetTexture(spell.texture)

		if spell.charges and spell.charges > 0 then

			self.text:SetText(spell.charges)

			self.text:Show()
			self.cooldown:Hide()

		else

			self.text:SetText("")
			self.cooldown:SetCooldown(spell.start or 0, spell.duration or 0)

			self.text:Hide()
			self.cooldown:Show()

		end


		if spell.maxCharges and spell.maxCharges > 1 and spell.charges == spell.maxCharges then
			self:showGlow()
		else
			self:hideGlow()
		end

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

}

ns.ui.cooldownView = view
