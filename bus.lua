local addon, ns = ...

local subscribers = {}

local bus = {

	push = function(messageType, ...)

		local handlers = subscribers[messageType]

		if not handlers then
			return
		end

		for owner, handler in pairs(handlers) do
			handler(...)
		end

	end,

	new = function(self)

		local this = {}
		setmetatable(this, { __index = self })

		this.subscribe = function(messageType, handler)

			subscribers[messageType] = subscribers[messageType] or {}
			subscribers[messageType][this] = handler

		end

		this.unsubscribe = function(messageType)

			if subscribers[messageType] and subscribers[messageType][this] then
				subscribers[messageType][this] = nil
			end

		end

		return this

	end,
}

ns.bus = bus
