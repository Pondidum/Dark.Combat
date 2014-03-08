local addon, ns = ...

local run = function()

	ns.monitorFactory.startType("aura", "player", "Lightning Shield")

	ns.bus.subscribe("auraChanged", function(args)
		print("AuraChanged:", args.spellName, args.name, args.start, args.duration, args.finish)
	end)

end

run()
