local addon, ns = ...
local controls = ns.uiControls
local style = ns.lib.style

controls.spellEditor = function(self)

	local container = self:frame({ width = 500, height = 500 })
	local child = self:createDefaults({ parent = container })

	local spells = child:spellList()
	style:frame(spells)

	local addButton = child:button({
		text = "Add",
		onClick = function(b, buttonName, down)
			spells:addRow(self:spellRow())
		end,
	})

	spells:SetPoint("TOPLEFT", container, "TOPLEFT", 0, 0)
	spells:SetPoint("TOPRIGHT", container, "TOPRIGHT", 0, 0)
	spells:SetPoint("BOTTOM", addButton, "TOP", 0, 0)

	addButton:SetPoint("BOTTOMRIGHT", container, "BOTTOMRIGHT", 0, 0)

	return container

end
