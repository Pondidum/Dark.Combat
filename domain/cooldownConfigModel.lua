local addon, ns = ...

local class = ns.lib.class

local cooldownConfigModel = class:extend({

	ctor = function(self, ...)

		local display, class, spec, action = ...
		local data = {select(5, ...)}

		self.display = display
		self.class = class:upper()
		self.spec = spec:upper()
		self.action = action
		self.data = data

	end,

})

ns.domain.cooldownConfigModel = cooldownConfigModel
