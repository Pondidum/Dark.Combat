local addon, ns = ...

local groups = {}

local groupFactory = {

	add = function(group)
		groups[group.type] = group
	end,

	create = function(type, name)

		local group = groups[type]
		assert(group, string.format("No group type %s registered.", type))

		return group:new(name)

	end,
}

ns.groupFactory = groupFactory
