local addon, ns = ...

local style = ns.lib.style
local events = ns.lib.events
local class = ns.lib.class
local controls = ns.lib.controls

if UnitClass("player") ~= "Shaman" then
	return
end

local repeater = function(count, action)

	local result = {}

	for i = 1, count do
		table.insert(result, action(i))
	end

	return result

end

local controller = class:extend({

	ctor = function(self)
		self:include(events)

		self:buildInterface()

		self:register("SPELL_UPDATE_USABLE")
		self:register("ACTIONBAR_UPDATE_COOLDOWN")
		self:register("UNIT_AURA")
		self:register("SPELL_UPDATE_CHARGES")

	end,

	buildInterface = function(self)

		local spacing = 5
		local totalWidth = 180
		local fifth = (totalWidth - 4 * spacing) / 5
		local tenth = (totalWidth - 9 * spacing) / 10
		local fifths = fifth + spacing

		local half = (totalWidth - spacing) /2

		local parent = controls:frame({
				name = "CombatUI",
				parent = UIParent,
				width = totalWidth,
				height = 55,
		})

		local combatui = controls:createDefaults({
				parent = parent,
				height = 10,
				width = fifth,
				spacing = spacing,
		})

		local lash1, lash2 = combatui:series({},
			combatui:timerbar({ color = { 196/255, 30/255, 60/255 }, width = half }),
			combatui:timerbar({ color = { 196/255, 30/255, 60/255 }, width = half  })
		)

		local storm1, storm2  = combatui:series({},
			combatui:timerbar({ color = { 41/255, 79/255, 155/255 }, width = half  }),
			combatui:timerbar({ color = { 41/255, 79/255, 155/255 }, width = half  })
		)

		local frost = combatui:timerbar({ color = { 104/255, 205/255, 255/255 }, width = fifth})
		local flame = combatui:timerbar({ color = { 196/255, 30/255, 60/255 }, width = fifth})

		local unleash = combatui:timerbar({ color = { 104/255, 205/255, 255/255 }, width = 3 * fifths })

		local maels = repeater(10, function()
				return  combatui:indicator({ color = { 212/255, 212/255, 212/255 }, width = tenth })
		end)

		combatui:series({}, unpack(maels))

		parent:SetPoint("CENTER", "UIParent", "CENTER", 0, -160)

		maels[1]:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)

		lash1:SetPoint("TOPLEFT", maels[1], "BOTTOMLEFT",0, -spacing)
		storm1:SetPoint("TOPLEFT", lash1, "BOTTOMLEFT", 0, -spacing)

		frost:SetPoint("TOPLEFT", storm1, "BOTTOMLEFT", 0, -spacing)
		flame:SetPoint("TOPRIGHT", storm2, "BOTTOMRIGHT", 0,-spacing)

		unleash:SetPoint("LEFT", frost, "RIGHT", spacing, 0)
		unleash:SetPoint("RIGHT", flame, "LEFT", -spacing, 0)

		self.mael = maels
		self.lash = {lash1, lash2}
		self.storm = {storm1, storm2}
		self.shocks = {frost, flame}
		self.unleash = unleash

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
		self:updateCooldown("Unleash Elements", self.unleash)
		self:updateCooldown("Frost Shock", self.shocks[1])
		self:updateCooldown("Flame Shock", self.shocks[2])

		self:updateCharges("Lava Lash", unpack(self.lash))
		self:updateCharges("Stormstrike", unpack(self.storm))
	end,

	updateCooldown = function(self, spellName, frame)

		local start, duration, enable = GetSpellCooldown(spellName)
		local gcdStart, gcdDuration = GetSpellCooldown(61304)

		if duration and duration > gcdDuration then
			frame:setCooldown(start, duration)
		end

	end,

	updateCharges = function(self, spellName, left, right)

		local charges, maxCharges, start, duration = GetSpellCharges(spellName)
		local gcdStart, gcdDuration = GetSpellCooldown(61304)

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

	end,

	updateAura = function(self, spellName, ...)

		local auraName, auraRank, auraTexture, auraCount = UnitAura("player", spellName)
		local totalFrames = select('#', ...)
		local glow = auraCount and auraCount >= 5


		for i = 1, totalFrames do

			local frame = select(i, ...)

			if auraCount then
				frame:setState(i <= auraCount)
			else
				frame:setState(false)
			end

			if glow then
				frame:showGlow()
			else
				frame:hideGlow()
			end


		end

	end,

})

controller:new()
