local addon, ns = ...
local controls = ns.uiControls

controls.spellEditor = function(self)

	local container = self:frame()
	local child = self:createDefaults({ parent = container })

	local spells = child:spellList()

	local addButton = child:button({
		text = "Add",
		onClick = function(b, buttonName, down)
			spells:addRow(self:spellRow())
		end,
	})

	spells:SetPoint("TOPLEFT", container, "TOPELFT", 0, 0)
	spells:SetPoint("TOPRIGHT", container, "TOPRIGHT", 0, 0)
	spells:SetPoint("BOTTOM", addButton, "TOP", 0, 10)

	addButton:setPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", 0, 0)

	return container

end
