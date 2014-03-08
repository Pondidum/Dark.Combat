local addon, ns = ...

local bus = {

	new = function()

		local this = {}
		local subscribers = {}

		this.subscribe = function(messageType, handler)

			subscribers[messageType] = subscribers[messageType] or {}
			subscribers[messageType][handler] = true

		end

		this.unsubscribe = function(messageType, handler)

			if subscribers[messageType] and subscribers[messageType][handler] then
				subscribers[messageType][handler] = nil
			end

		end

		this.push = function(messageType, ...)

			local handlers = subscribers[messageType]

			if not handlers then
				return
			end

			for handler, active in pairs(handlers) do
				handler(...)
			end

		end

		return this

	end,

}

ns.bus = bus