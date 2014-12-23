local addon, ns = ...

local class = ns.lib.class
local dsl = ns.lib.controls.dsl

local spellEditorConfig = {
	type = "group",
	layout = "horizontal",
	origin = "LEFT",
	wrap = false,
	autosize = "x",
	height = 25,
	controls = {
		{ type = "label", 	name = "$parentDisplayLabel", text = "Display Group" },
		{ type = "textbox", name = "$parentDisplay", 	  text = "" },
		{ type = "label", 	name = "$parentClassLabel",	  text = "Class" },
		{ type = "textbox", name = "$parentClass", 		  text = "" },
		{ type = "label", 	name = "$parentSpecLabel", 	  text = "Spec" },
		{ type = "textbox", name = "$parentSpec", 		  text = "" },
		{ type = "label", 	name = "$parentSpellLabel",	  text = "SpellID" },
		{ type = "textbox", name = "$parentSpell", 		  text = "" },
	}
}

local spellEditor = {

	new = function(self, name, parent)

		spellEditorConfig.name = name

		return dsl:single(parent, spellEditorConfig)

	end,
}

ns.configui.spellEditor = spellEditor
