local addon, ns = ...
local compilers = ns.infrastructure.compilers

local auraDomain = {

	new = function(self)

		local this = {}

		this.globalWhite = {}
		this.globalBlack = {}
		this.unitWhite = {}
		this.unitBlack = {}
		this.classWhite = {}
		this.classBlack = {}
		this.specWhite = {}
		this.specBlack = {}

		setmetatable(this, { __index = self })

		return this
	end,

	getSpellData = function(self, spell)

		local name, rank, icon = GetSpellInfo(spell)
		local id = spell

		if type(spell) == "string" then
			local link = GetSpellLink(spell)
			id = link:match("spell:(%d+)")
		end

		return { id = id, name = name, icon = icon }

	end,

	trackGlobal = function(self, spell)

		local data = self:getSpellData(spell)

		self.globalWhite[data.id] = data

	end,

	hideGlobal = function(self, spell)

		local data = self:getSpellData(spell)

		self.globalBlack[data.id] = data

	end,

	trackUnit = function(self, unit, spell)

		unit = unit:upper()

		self.unitWhite[unit] = self.unitWhite[unit] or {}

		local data = self:getSpellData(spell)
		self.unitWhite[unit][data.id] = data

	end,

	hideUnit = function(self, unit, spell)

		unit = unit:upper()

		self.unitBlack[unit] = self.unitBlack[unit] or {}

		local data = self:getSpellData(spell)
		self.unitBlack[unit][data.id] = data

	end,

	trackClass = function(self, unit, class, spell)

		unit, class = unit:upper(), class:upper()

		self.classWhite[unit] = self.classWhite[unit] or {}
		self.classWhite[unit][class] = self.classWhite[unit][class] or {}

		local data = self:getSpellData(spell)
		self.classWhite[unit][class][data.id] = data

	end,

	hideClass = function(self, unit, class, spell)

		unit, class = unit:upper(), class:upper()

		self.classBlack[unit] = self.classBlack[unit] or {}
		self.classBlack[unit][class] = self.classBlack[unit][class] or {}

		local data = self:getSpellData(spell)
		self.classBlack[unit][class][data.id] = data

	end,

	trackSpec = function(self, unit, class, spec, spell)

		unit, class, spec = unit:upper(), class:upper(), spec:upper()

		self.specWhite[unit] = self.specWhite[unit] or {}
		self.specWhite[unit][class] = self.specWhite[unit][class] or {}
		self.specWhite[unit][class][spec] = self.specWhite[unit][class][spec] or {}

		local data = self:getSpellData(spell)

		self.specWhite[unit][class][spec][data.id] = data

	end,

	hideSpec = function(self, unit, class, spec, spell)

		unit, class, spec = unit:upper(), class:upper(), spec:upper()

		self.specBlack[unit] = self.specBlack[unit] or {}
		self.specBlack[unit][class] = self.specBlack[unit][class] or {}
		self.specBlack[unit][class][spec] = self.specBlack[unit][class][spec] or {}

		local data = self:getSpellData(spell)

		self.specBlack[unit][class][spec][data.id] = data

	end,

	get = function(self, collectionName, ...)

		local result = self[collectionName]
		local keys = {...}

		for i, key in ipairs(keys) do

			if not result[key] then
				return {}
			end

			result = result[key]

		end

		return result

	end,

	compile = function(self, unit, class, spec)

		unit, class, spec = unit:upper(), class:upper(), spec:upper()

		local compiler

		if unit == "PLAYER" or unit == "PET" then
			compiler = compilers.white:new()
		else
			compiler = compilers.black:new()
		end

		compiler:addItems(
			self.globalBlack,
			self.globalWhite
		)

		compiler:addItems(
			self.unitBlack[unit],
			self.unitWhite[unit]
		)

		compiler:addItems(
			self.classBlack[unit][class],
			self.classWhite[unit][class]
		)

		compiler:addItems(
			self.specBlack[unit][class][spec],
			self.specWhite[unit][class][spec]
		)

		return compiler:compile()

	end,

}

ns.domain.auraDomain = auraDomain
