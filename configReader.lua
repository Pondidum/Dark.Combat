local addon, ns = ...

local configReader = {

	new = function(self, domain)

		local this = {}

		this.domain = domain
		setmetatable(this, { __index = self })

		return this
	end,

	read = function(self, config)

		local domain = self.domain

		for i, row in ipairs(config) do

			local action = row[1]
			domain[action](domain, select(2, unpack(row)))

		end

	end,
}

ns.configReader = configReader
