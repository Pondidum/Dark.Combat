local addon, ns = ...

local layout = ns.lib.layout
local cache = ns.lib.cache

local cooldownView = ns.ui.cooldownView

local displayBuilder = {

	new = function(self)

		local this = {}

		this.configs = {}
		this.containers = {}
		this.displays = cache.new(function(i) cooldownView:new(i))

		setmetatable(this, { __index = self })
		return this

	end,

	configureDisplay = function(self, name, points)

		self.configs[name] = {
			points = points
		}

	end,

	createContainers = function(self)

		for name, containerConfig in pairs(self.configs) do

			local container = CreateFrame("Frame", "DarkCombat" .. name, UIParent)
			layout.init(container, { autosize = true })

			for i, pointConfig in ipairs(config.points) do
				container:SetPoint(unpack(pointConfig))
			end

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

}

ns.ui.displayBuilder = displayBuilder
