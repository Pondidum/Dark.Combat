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
		self.engines = {}
		self.displays = cache:new(function(this, i) cooldownView:new(i) end)

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

			local engine = layout:new(container, {
				layout = "horizontal",
				origin = "LEFT",
				wrap = false,
				autosize = "both",
				itemSpacing = 4
			})

			engine.viewWidth = childWidth
			engine.viewHeight = childHeight

			container:SetPoint(unpack(containerConfig.point))

			self.engines[name] = engine

		end

	end,

	emptyAll = function(self)

		for name, engine in pairs(self.engines) do
			engine:clearChildren()
		end

	end,

	addView = function(self, name, view)

		local engine = self.engines[name]

		view.frame:SetSize(engine.viewWidth, engine.viewHeight)
		engine:addChild(view.frame)
		engine:performLayout()

	end,

})

ns.ui.displayBuilder = displayBuilder
