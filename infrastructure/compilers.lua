local addon, ns = ...

local compiler = {

	extend = function(self, this)
		return setmetatable(this, { __index = self })
	end,

	new = function(self)

		local this = {}
		this.accumulator = {}

		return setmetatable(this, { __index = self})

	end,

	addItems = function(self, black, white)

	end,

	compile = function(self)
		return self.accumulator
	end,

	addRange = function(self, items)
		for id, data in pairs(items) do
			self.accumulator[id] = data
		end
	end,

	removeRange = function(self, items)
		for id, data in pairs(items) do
			self.accumulator[id] = nil
		end
	end,
}

local blacklistCompiler = compiler:extend({

	addItems = function(self, black, white)

		self:addRange(black)
		self:removeRange(white)

	end,
})

local whitelistCompiler = compiler:extend({

	addItems = function(self, black, white)

		self:addRange(white)
		self:removeRange(black)

	end,
})

ns.compilers = {
	base = compiler,
	black = blacklistCompiler,
	white = whitelistCompiler
}
