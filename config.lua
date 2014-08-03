local addon, ns = ...

ns.config = function()

	return class({

		HUNTER = spec({

			Survival = group(
				display("cooldowns",
					ability("stampede"),
					talent("dire beast")
				)
			),

		}),

		SHAMAN = spec({

			Enhancement = group(
				display("rotation",
					ability("lava lash"),
					ability("storm strike")
				),
				display("cooldowns",
					ability("ascendance"),
					ability("feral spirits"),
					ability("fire elemental totem")
				)
			),

			elemental = group(),
			restoration = group()
		}),

	})

end
