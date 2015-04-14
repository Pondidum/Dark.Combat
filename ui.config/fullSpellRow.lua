local addon, ns = ...

local class = ns.lib.class
local controls = ns.lib.controls

local fullSpellRow = class:extend({

	ctor = function(self, model)
		self.model = model
	end,

	buildInterface = function(self)

		local model = self.model
		local container = controls:frame({})
		local children = controls:createDefaults({ parent = container })

		local displayName, classname, specName, action, spellid, auraid = children:series(
			children:textbox({ text = model.display }),
			children:textbox({ text = model.class }),
			children:textbox({ text = model.spec }),
			children:textbox({ text = model.action }),
			children:textbox({ text = model.data[1] }),
			children:textbox({ text = model.data[2] }),
		)

		displayName:SetPoint("LEFT", container, "LEFT", 0, 0)

	end,

})




