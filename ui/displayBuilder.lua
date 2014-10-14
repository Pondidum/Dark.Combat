local addon, ns = ...

local layout = ns.lib.layout
local cache = ns.lib.cache

local displayBuilder = {

	new = function(self)

		local this = {}

		this.configs = {}
		this.containers = {}
		this.displays = cache.new(function(i) self:createView(i))

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

		for displayName, spells in pairs(displaySpells) do

			local config = self.configs[displayName]
			self.containers[displayName] = self.containers[displayName] or self:createDisplay(displayName)

			self:configureDisplay(self.containers[displayName], config, spells)

			for i, spell in ipairs(spells) do
				local view = views.get()
				self:configureView(view)


			end

		end

	end,

	createDisplay = function(self, name)

		local frame = CreateFrame("Frame", "DarkCombat" .. displayName, UIParent)
		layout.init(frame, { autosize = true })

		return frame

	end,

	configureDisplay = function(self, frame, config, spells)

		frame:ClearAllPoints()

		for i, pointConfig in ipairs(config.points) do
			frame:SetPoint(unpack(pointConfig))
		end

	end,
}

ns.ui.displayBuilder = displayBuilder
