local addon, ns = ...

local subscribers = {}

local bus = {

	subscribe = function(messageType, handler)

		subscribers[messageType] = subscribers[messageType] or {}
		subscribers[messageType][handler] = true

	end,

	unsubscribe = function(messageType, handler)

		if subscribers[messageType] and subscribers[messageType][handler] then
			subscribers[messageType][handler] = nil
		end

	end,

	push = function(messageType, ...)

		local handlers = subscribers[messageType]

		if not handlers then
			return
		end

		for handler, active in pairs(handlers) do
			handler(...)
		end

	end,
}

ns.bus = bus
