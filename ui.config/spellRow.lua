local addon, ns = ...
local controls = ns.uiControls

controls.spellRow = function(self)

	local container = self:frame({})
	local children = self:createDefaults({ parent = container })

	local displayName, classname, specName, action, spellid, auraid = children:series({},
		children:textbox(),
		children:textbox(),
		children:textbox(),
		children:textbox(),
		children:textbox(),
		children:textbox(),
	)

	displayName:SetPoint("LEFT", container, "LEFT", 0, 0)

	container.display = function(frame, model)
		displayName:SetText( model.display )
		classname:SetText( model.class )
		specName:SetText( model.spec )
		action:SetText( model.action )
		spellid:SetText( model.data[1] )
		auraid:SetText( model.data[2] )
	end

	container.writeTo = function(frame, model)
		model.display = displayName:GetText()
		model.class = classname:GetText()
		model.spec = specName:GetText()
		model.action = action:GetText()
		model.data[1] = spellid:GetText()
		model.data[2] = auraid:GetText()
	end

	return container

end
