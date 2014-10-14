local addon, ns = ...

local configReader = {

	new = function(self)
		return setmetatable({}, { __index = self })
	end,

	read = function(self, domain, config)

		for i, row in ipairs(config) do

			local action = row[1]
			domain[action](domain, select(2, unpack(row)))

		end

	end,
}

ns.infrastructure.configReader = configReader
