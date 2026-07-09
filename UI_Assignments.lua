-------------------------------------------------------
-- Assignment UI
-------------------------------------------------------

HBN.UIAssignments = {}

-------------------------------------------------------
-- Runtime
-------------------------------------------------------

HBN.UIAssignments.Rows = {}

HBN.UIAssignments.Columns = {}

-------------------------------------------------------
-- Klassen (Spalten)
-------------------------------------------------------

HBN.UIAssignments.Columns = {

    "WARRIOR",
    "ROGUE",
    "MAGE",
    "WARLOCK",
    "HUNTER",
    "PRIEST",
    "DRUID",
    "PALADIN",
    "SHAMAN",

}

-------------------------------------------------------
-- Buffzeilen automatisch erzeugen
-------------------------------------------------------

function HBN.UIAssignments:BuildRows()

    wipe(self.Rows)

    for key, buff in pairs(HBN.Buffs) do

        table.insert(self.Rows, {

            key = key,

            text = buff.display,

            icon = buff.icon,

        })

    end

    table.sort(self.Rows,function(a,b)

        return a.text < b.text

    end)

end