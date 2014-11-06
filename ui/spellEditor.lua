local addon, ns = ...

local spellEditor = control.group:extend({

	create = function(self, options)

		options.autosize = true

		self.base:create(options)

		self:add(control.label:new({text = "Class:", align="RIGHT"}))
		self:add(control.textbox:new())

		self:add(control.label:new({text = "Spec:", align="RIGHT"}))
		self:add(control.textbox:new())

		self:add(control.label:new({ text = "Type:", align="RIGHT"}))
		self:add(control.textbox:new())

		self:add(control.label:new({ text = "Value:", align="RIGHT"}))
		self:add(control.textbox:new())

	end,

})

ns.ui.spellEditor = spellEditor
