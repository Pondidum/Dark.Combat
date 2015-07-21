local addon, ns = ...

local style = ns.lib.style
local events = ns.lib.events
local class = ns.lib.class
local controls = ns.lib.controls

if UnitClass("player") ~= "Shaman" then
	return
end

local GCD_SPELLID = 61304



controls.cooldown = function(self, owner, spellName, config)
	local cd = self:timerbar(config)

	local updateCooldown = function()
		local start, duration, enable = GetSpellCooldown(spellName)
		local gcdStart, gcdDuration = GetSpellCooldown(GCD_SPELLID)

		if duration and duration > gcdDuration then
			cd:setCooldown(start, duration)
		end
	end

	table.insert(owner.cooldowns, updateCooldown)

	return cd
end

controls.charges = function(self, owner, spellName, config)

	local left, right = self:series({}, self:timerbar(config), self:timerbar(config))

	local update = function()

		local charges, maxCharges, start, duration = GetSpellCharges(spellName)
		local gcdStart, gcdDuration = GetSpellCooldown(GCD_SPELLID)

		if charges == 0 then
			left:setCooldown(start, duration)
			right:setEmpty()
		elseif charges == 1 then
			left:setCooldown(0,0)
			right:setCooldown(start, duration)
		else
			left:setCooldown(0,0)
			right:setCooldown(0,0)
		end

		if maxCharges == 2 then
			right:Show()
			left:SetWidth(config.width)
		else
			right:Hide()
			left:SetWidth(config.totalWidth)
		end
	end

	table.insert(owner.charges, update)

	return left, right

end


local repeater = function(count, action)

	local result = {}

	for i = 1, count do
		table.insert(result, action(i))
	end

	return result

end

local spacing = 5
local totalWidth = 180
local fifth = (totalWidth - 4 * spacing) / 5
local tenth = (totalWidth - 9 * spacing) / 10
local fifths = fifth + spacing

local half = (totalWidth - spacing) /2


local controller = class:extend({

	ctor = function(self)
		self:include(events)

		self.cooldowns = {}
		self.charges = {}

		self:buildInterface()

		self:register("SPELL_UPDATE_USABLE")
		self:register("ACTIONBAR_UPDATE_COOLDOWN")
		self:register("UNIT_AURA")
		self:register("SPELL_UPDATE_CHARGES")

	end,

	buildInterface = function(self)

		local parent = controls:frame({
			name = "CombatUI",
			parent = UIParent,
			width = totalWidth,
			height = 55,
		})

		parent:SetPoint("CENTER", "UIParent", "CENTER", 0, -160)

		local combatui = controls:createDefaults({
			parent = parent,
			height = 10,
			width = fifth,
			xspacing = spacing,
		})


		local maels = repeater(10, function()
			return combatui:indicator({ color = { 212/255, 212/255, 212/255 }, width = tenth })
		end)

		combatui:series({}, unpack(maels))

		local lash1, lash2 = combatui:charges(self, "Lava Lash", { color = { 196/255, 30/255, 60/255 }, width = half, totalWidth = totalWidth })
		local storm1, storm2 = combatui:charges(self, "Stormstrike", { color = { 41/255, 79/255, 155/255 }, width = half, totalWidth = totalWidth })

		local frost, unleash, flame = combatui:series({},
			combatui:cooldown(self, "Frost Shock", { color = { 104/255, 205/255, 255/255 }, width = fifth }),
			combatui:cooldown(self, "Unleash Elements", { color = { 104/255, 205/255, 255/255 }, width = (3 * fifths) - spacing }),
			combatui:cooldown(self, "Flame Shock", { color = { 196/255, 30/255, 60/255 }, width = fifth })
		)

		combatui:series({ point = "TOP", relPoint = "BOTTOM", yspacing = -spacing},
			maels[1],
			lash1,
			storm1,
			frost
		)

		maels[1]:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)

		lash1:SetPoint("LEFT", parent, "LEFT")
		storm1:SetPoint("LEFT", parent, "LEFT")
		frost:SetPoint("LEFT", parent, "LEFT")

		self.mael = maels

	end,

	SPELL_UPDATE_USABLE = function(self)
		self:updateAll()
	end,

	ACTIONBAR_UPDATE_COOLDOWN = function(self)
		self:updateAll()
	end,

	UNIT_AURA = function(self, unitID)

		if unitID ~= "player" then
			return
		end

		self:updateAura("Maelstrom Weapon", unpack(self.mael))
	end,

	SPELL_UPDATE_CHARGES = function(self)
		self:updateAll()
	end,

	updateAll = function(self)

		for i, action in ipairs(self.charges) do
			action()
		end

		for i, action in ipairs(self.cooldowns) do
			action()
		end

	end,

	updateAura = function(self, spellName, ...)

		local auraName, auraRank, auraTexture, auraCount = UnitAura("player", spellName)
		local totalFrames = select('#', ...)
		local glows = floor((auraCount or 0) / 5) * 5

		for i = 1, totalFrames do

			local frame = select(i, ...)

			if auraCount then
				frame:setState(i <= auraCount)
			else
				frame:setState(false)
			end

			if i <= glows then
				frame:showGlow()
			else
				frame:hideGlow()
			end


		end

	end,

})

controller:new()
