local addon, ns = ...
local bus = ns.bus
local events = ns.lib.events:new()

local macroMonitor = ns.monitor:new({

	type = "macro",

	new = function(self)

		local this = {}
		setmetatable(this, { __index = self })

		this.macros = {}

		return this

	end,

	enable = function(self)

		local message = {}

		local onUpdateMacros = function(eventStore, event)

			for macroName, value in pairs(self.macros) do

				local name, texture, body = GetMacroInfo(macroName)
				local spellName, spellRank, spellID = GetMacroSpell(macroName)
				local spellTexture = GetSpellTexture(spellName)
				local itemName, itemLink = GetMacroItem(macroName)

				table.wipe(message)

				message.macroName = macroName
				message.macroTexture = texture
				message.spellName = spellName
				message.spellID = spellID
				message.spellTexture = spellTexture
				message.itemName = itemName
				message.itemLink = itemLink

				bus.push("macroChanged", message)

			end

		end

		events.register("UPDATE_MACROS", onUpdateMacros)
		events.register("ACTIONBAR_UPDATE_COOLDOWN", onUpdateMacros)
		events.register("SPELL_UPDATE_USABLE", onUpdateMacros)

	end,

	register = function(self, macroName)
		self.macros[macroName] = true
	end,
})

ns.monitorFactory.add(macroMonitor)
