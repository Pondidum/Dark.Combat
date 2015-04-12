local addon, ns = ...

local class = ns.lib.class
local controls = ns.lib.controls

local fullSpellRow = class:extend({

	ctor = function(self, model)
		self.model = model
	end,

	buildInterface = function(self)

		local container = controls:frame({})

		local children = controls:createDefaults({ parent = container })

		local displayName, classname, specName, type, spellid, auraid = children:series(
			children:textbox({}),
			children:textbox({}),
			children:textbox({}),
			children:textbox({}),
			children:textbox({}),
			children:textbox({}),
		)


	end,

})




