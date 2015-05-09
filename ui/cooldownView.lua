local addon, ns = ...

local fonts = ns.lib.media.fonts
local style = ns.lib.style

local view = {

	new = function(self, name)

		local this = setmetatable({}, { __index = self })
		this.name = "DarkCombatCooldown" .. name

		this:ctor()

		return this
	end,

	ctor = function(self)

		local button = CreateFrame("CheckButton", self.name, UIParent, "ActionButtonTemplate")
		button:RegisterForClicks(nil);
		button:EnableMouse(false)
		button:SetAlpha(0.5)

		style:actionButton(button)

		local glow = CreateFrame("Frame", nil, button, "ActionBarButtonSpellActivationAlert")
		glow:SetWidth(button:GetWidth() * 1.4)
		glow:SetHeight(button:GetHeight() * 1.4)
		glow:SetPoint("CENTER", button, "CENTER", 0 ,0)
		glow.animOut:SetScript("OnFinished", function(self) glow:Hide() end)


		local cooldown = button.cooldown
		cooldown:SetDrawEdge(false);
		cooldown:SetDrawSwipe(true);
		cooldown:SetCooldown(0, 0);
		cooldown:Show()

		local stacks = fonts:create(button, nil, 18, "outline")
		stacks:SetAllPoints(button)
		stacks:SetJustifyH("CENTER")
		stacks:Hide()

		local charges = fonts:create(button, nil, 13, "outline")
		charges:SetPoint("TOPRIGHT", 2, 0)

		self.frame = button
		self.cooldown = cooldown
		self.icon = button.icon
		self.glow = glow
		self.stacks = stacks
		self.charges = charges

	end,

	update = function(self, spell)

		self.frame:Show()
		self.icon:SetTexture(spell.texture)

		if spell.stacks and spell.stacks > 0 then

			self.stacks:SetText(spell.stacks)

			self.stacks:Show()
			self.cooldown:Hide()

		else

			self.stacks:SetText("")
			self.cooldown:SetCooldown(spell.start or 0, spell.duration or 0)

			self.stacks:Hide()
			self.cooldown:Show()

		end

		local hasStacks = spell.stacks and spell.usableStacks and spell.usableStacks > 1

		local showStacksGlow = hasStacks and spell.stacks >= spell.usableStacks
		local showActiveGlow = not hasStacks and spell:isActive()

		if showStacksGlow or showActiveGlow then
			self:showGlow()
		else
			self:hideGlow()
		end

		if spell.maxCharges and spell.maxCharges > 0 then
			self.charges:SetText(spell.charges)
		else
			self.charges:SetText("")
		end

		local drawEdge = spell.charges and spell.charges ~= spell.maxCharges

		self.cooldown:SetDrawEdge(drawEdge)
		self.cooldown:SetDrawSwipe(not drawEdge)
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
