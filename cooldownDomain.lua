local addon, ns = ...

local cooldownDomain = {

	new = function(self)

		local this = {}

		this.classes = {}

		for i,class in ipairs(CLASS_SORT_ORDER) do
			this.classes[class] = {}
		end

		return setmetatable(this, { __index = self })

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

	trackSpell = function(self, display, class, spec, spell)

		class, spec = class:upper(), spec:upper()

		local data = self:getSpellData(spell)
		data.display = display

		table.insert(self.classes[class][spec], data)

	end
}

ns.cooldownDomain = cooldownDomain
