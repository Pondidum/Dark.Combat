local addon, ns = ...

local environment = {

	create = function()

		local env = {}

		env.case = function(condition, resultTable)

			return function()
				local result = condition()

				local action = resultTable[result]

				if action then
					action()
				end
			end
		end

		env.group = function(...)

			local actions = {...}

			return function()
				for i, action in ipairs(actions) do
					action()
				end
			end
		end

		env.talent = function(name)

			return function()
				if env.player.talents[name] then
					env.ability(name)()
				end
			end
		end

		env.ability = function(name)

			return function()
				env.results[env.currentDisplay] = env.results[env.currentDisplay] or {}
				table.insert(env.results[env.currentDisplay], name)
			end
		end

		env.display = function(displayName, ...)

			local actions = {...}

			return function()
				env.currentDisplay = displayName

				for i,action in ipairs(actions) do
					action()
				end
			end

		end

		env.class = function(options)

			return function()
				local action = options[env.player.class()]

				if action then
					action()
				end
			end
		end

		env.spec = function(options)

			return function()
				local action = options[env.player.spec()]

				if action then
					action()
				end
			end
		end

		return env

	end
}

ns.environment = environment
