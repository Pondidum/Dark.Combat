local addon, ns = ...

local run = function()

	local displays = ns.configBuilder.parse()

	for name,spells in pairs(displays) do

		print(name .. ":")
		for i,v in ipairs(spells) do
			print(i,v)
		end
	end

end

run()
