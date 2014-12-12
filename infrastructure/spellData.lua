local addon, ns = ...

local defaults = {
	spellID = 0,
	spellName = "",
	maxCharges = 0,
	useAtCharges = 0,
}

local defaultsMeta = { __index = defaults }

local byID = {}
local byName = {}

local spellData = {

	register = function(info)

		setmetatable(info, defaultsMeta)

		byID[info.spellID] = info
		byName[info.spellName] = info

	end,

	getMaxCharges = function(spell)
		local info = byID[spell] or byName[spell] or defaults

		return info.maxCharges
	end,

	getUsableCharges = function(spell)
		local info = byID[spell] or byName[spell] or defaults

		return info.useAtCharges
	end,

}

spellData.register({spellID = 53817, spellName = "Maelstrom Weapon", maxCharges = 5, useAtCharges = 5 })
spellData.register({spellID = 91342, spellName = "Shadow Infusion", maxCharges = 5, useAtCharges = 5 })
spellData.register({spellID = 114851, spellName = "Blood Charge", maxCharges = 12, useAtCharges = 5 })

ns.infrastructure.spellData = spellData
