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

	createDisplays = function(self, displaySpells)

		local views = self.cache
		views.recycleAll()

		self:createContainers(displaySpells)

		for name, spells in pairs(displaySpells) do

			local container = self.containers[name]

			for i, spell in ipairs(spells) do

				local view = views.get()
				view:configure(spell)

				container.add(view.frame)
			end

		end

	end,

	createContainers = function(self, displaySpells)

		for name, spells in pairs(displaySpells) do

			local container = self.containers[name]
			local config = self.configs[name]

			if not container then

				container = CreateFrame("Frame", "DarkCombat" .. name, UIParent)
				self.containers[name] = container
				layout.init(container, { autosize = true })

			end

			container.clear()
			container:ClearAllPoints()

			for i, pointConfig in ipairs(config.points) do
				container:SetPoint(unpack(pointConfig))
			end

		end

	end,

}

ns.ui.displayBuilder = displayBuilder
