local addon, ns = ...

ns.config = function()

	return class({

		hunter = spec({

			suvival = group(
				display("cooldowns",
					ability("stampede"),
					talent("dire beast")
				)
			),

		}),

		shaman = spec({

			enhancement = group(
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
