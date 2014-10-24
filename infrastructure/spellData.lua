local addon, ns = ...

local charges = {
	[53817] = 5,
	["Maelstrom Weapon"] = 5,
}

setmetatable(charges, { __index = function(key) return 1 end })

local spellData = {

	getMaxCharges = function(spellID)
		return charges[spellID]
	end,

}

ns.infrastructure.spellData = spellData
