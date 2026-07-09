-------------------------------------------------------
-- Buff Definitions
-------------------------------------------------------

HBN.Buffs = {

    ---------------------------------------------------
    -- Mage
    ---------------------------------------------------

	INT = {

		display = "Arcane Intellect",

		class = "MAGE",

		icon = 135932,

		targets = {

			"MAGE",
			"WARLOCK",
			"HUNTER",
			"PRIEST",
			"DRUID",
			"PALADIN",
			"SHAMAN",

		},

		single = {
			spellID = 27126,
			name = "Arcane Intellect",
		},

		group = {
			spellID = 23028,
			name = "Arcane Brilliance",
		},

	},

    ---------------------------------------------------
    -- Druid
    ---------------------------------------------------

	MOTW = {

		display = "Mark of the Wild",

		class = "DRUID",

		icon = 136078,

		targets = "ALL",

		single = {
			spellID = 26990,
			name = "Mark of the Wild",
		},

		group = {
			spellID = 26991,
			name = "Gift of the Wild",
		},

	},

    ---------------------------------------------------
    -- Priest
    ---------------------------------------------------

	FORT = {

		display = "Fortitude",

		class = "PRIEST",

		icon = 135987,

		targets = "ALL",

		single = {
			spellID = 25389,
			name = "Power Word: Fortitude",
		},

		group = {
			spellID = 25392,
			name = "Prayer of Fortitude",
		},

	},

	SHADOW = {

		display = "Shadow Protection",

		class = "PRIEST",

		icon = 136121,

		targets = "ALL",

		single = {
			spellID = 10958,
			name = "Shadow Protection",
		},

		group = {
			spellID = 27683,
			name = "Prayer of Shadow Protection",
		},

	},

    ---------------------------------------------------
    -- Paladin
    ---------------------------------------------------

	KINGS = {

		display = "Kings",

		class = "PALADIN",

		icon = 135995,

		targets = "ALL",

		single = {
			spellID = 20217,
			name = "Blessing of Kings",
		},

		group = {
			spellID = 25898,
			name = "Greater Blessing of Kings",
		},

	},

	WISDOM = {

		display = "Wisdom",

		class = "PALADIN",

		icon = 135970,

		targets = {

			"MAGE",
			"WARLOCK",
			"HUNTER",
			"PRIEST",
			"DRUID",
			"PALADIN",
			"SHAMAN",

		},

		single = {
			spellID = 27142,
			name = "Blessing of Wisdom",
		},

		group = {
			spellID = 27143,
			name = "Greater Blessing of Wisdom",
		},

	},

	MIGHT = {

		display = "Might",

		class = "PALADIN",

		icon = 135906,

		targets = {

			"WARRIOR",
			"ROGUE",
			"PALADIN",
			"HUNTER",
			"SHAMAN",

		},

		single = {
			spellID = 27140,
			name = "Blessing of Might",
		},

		group = {
			spellID = 27141,
			name = "Greater Blessing of Might",
		},

	},

	SANCT = {

		display = "Sanctuary",

		class = "PALADIN",

		icon = 136051,

		targets = {

			"WARRIOR",
			"PALADIN",
			"DRUID",

		},

		single = {
			spellID = 20911,
			name = "Blessing of Sanctuary",
		},

		group = {
			spellID = 25899,
			name = "Greater Blessing of Sanctuary",
		},

	},

}