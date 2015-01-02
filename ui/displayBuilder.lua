local addon, ns = ...

local layout = ns.lib.layout
local cache = ns.lib.cache
local class = ns.lib.class
local mixins = ns.lib.mixins

local cooldownView = ns.ui.cooldownView


local displayBuilder = class:extend({

	ctor = function(self)
		self:include(mixins.configReader)

		self.configs = {}
		self.containers = {}
		self.displays = cache.new(function(i) cooldownView:new(i) end)

	end,

	configureDisplay = function(self, name, point, childSize)

		self.configs[name] = {
			name = name,
			point = point,
			childSize = childSize,
		}

	end,

	createContainers = function(self)

		for name, containerConfig in pairs(self.configs) do

			local childWidth, childHeight = unpack(containerConfig.childSize)
			local container = CreateFrame("Frame", "DarkCombat" .. name, UIParent)

			layout.init(container, {
				autosize = true,
				defaultChildWidth = childWidth,
				defaultChildHeight = childHeight,
				forceChildSize = true
			})

			container:SetPoint(unpack(containerConfig.point))

			self.containers[name] = container

		end

	end,

	emptyAll = function(self)

		for name, container in pairs(self.containers) do
			container.clear()
		end

	end,

	addView = function(self, name, view)

		local container = self.containers[name]
		container.add(view.frame)

	end,

})

ns.ui.displayBuilder = displayBuilder
