local addon, ns = ...
local controls = ns.uiControls

controls.spellList = function(self, config)

	local container = controls:scrollFrame({ name = config.name })

	container.display = function(self, spells)

		for i, model in ipairs(spells) do

			local row = self:spellRow()
			row:display(model)

			container:addRow(row)

		end

	end

	container.addRow = function(self, row)
		container:addChild(row)
	end

	return container

end
