local addon, ns = ...
local controls = ns.uiControls

controls.spellList = function(self)

	local container = controls:scrollFrame()

	container.display = function(self, spells)

		for i, model in ipairs(spells) do

			local row = self:spellRow()
			row:display(model)
			container:addChild(row)

		end
	end

	return container

end
