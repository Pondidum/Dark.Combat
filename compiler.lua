local addon, ns = ...


local addRange = function(accumulator, items)
	for id, data in pairs(items) do
		accumulator[id] = data
	end
end

local removeRange = function(accumulator, items)
	for id, data in pairs(items) do
		accumulator[id] = nil
	end
end

local blacklistCompiler = function(domain, unit, playerClass, playerSpec)

	unit, playerClass, playerSpec = unit:upper(), playerClass:upper(), playerSpec:upper()

	local blacklist = {}

	addRange(blacklist, domain.globalBlack)
	removeRange(blacklist, domain.globalWhite)

	addRange(blacklist, domain:get("unitBlack", unit))
	removeRange(blacklist, domain:get("unitWhite", unit))

	addRange(blacklist, domain:get("classBlack", unit, playerClass))
	removeRange(blacklist, domain:get("classWhite", unit, playerClass))

	addRange(blacklist, domain:get("specBlack", unit, playerClass, playerSpec))
	removeRange(blacklist, domain:get("specWhite", unit, playerClass, playerSpec))

	return blacklist
end

local whitelistCompiler = function(domain, unit, playerClass, playerSpec)

	unit, playerClass, playerSpec = unit:upper(), playerClass:upper(), playerSpec:upper()

	local whitelist = {}

	addRange(whitelist, domain.globalWhite)
	removeRange(whitelist, domain.globalBlack)

	addRange(whitelist, domain:get("unitWhite", unit))
	removeRange(whitelist, domain:get("unitBlack", unit))

	addRange(whitelist, domain:get("classWhite", unit, playerClass))
	removeRange(whitelist, domain:get("classBlack", unit, playerClass))

	addRange(whitelist, domain:get("specWhite", unit, playerClass, playerSpec))
	removeRange(whitelist, domain:get("specBlack", unit, playerClass, playerSpec))

	return whitelist
end

local compiler = {
	compileWhite = whitelistCompiler,
	compileBlack = blacklistCompiler
}

ns.compiler = compiler
