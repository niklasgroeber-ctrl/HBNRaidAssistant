-------------------------------------------------------
-- Assignments.lua
-------------------------------------------------------

HBN.Assignments = {}

-------------------------------------------------------
-- Klassen
-------------------------------------------------------

HBN.Classes = {

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
-- Buff Assignment Tabelle
-------------------------------------------------------

function HBN.Assignments:Initialize()

    wipe(self)

    local buffs = {

        "KINGS",
        "WISDOM",
        "MIGHT",
        "SANCT",

        "FORT",
        "SHADOW",

        "INT",

        "MOTW",

    }

    for _, buff in ipairs(buffs) do

        self[buff] = {}

        for _, class in ipairs(HBN.Classes) do

            self[buff][class] = nil

        end

    end

end

-------------------------------------------------------
-- Set Assignment
-------------------------------------------------------

function HBN.Assignments:Set(buff,class,player)

    if not self[buff] then
        return
    end

    self[buff][class] = player

end

-------------------------------------------------------
-- Get Assignment
-------------------------------------------------------

function HBN.Assignments:Get(buff,class)

    if not self[buff] then
        return nil
    end

    return self[buff][class]

end

-------------------------------------------------------
-- Debug
-------------------------------------------------------

function HBN.Assignments:Print()

    HBN.Utils:Print(" ")

    HBN.Utils:Print("===== Assignments =====")

    for buff,data in pairs(self) do

        if type(data)=="table" then

            HBN.Utils:Print(buff)

            for class,name in pairs(data) do

                if name then

                    HBN.Utils:Print(

                        "   "..class.." -> "..name

                    )

                end

            end

        end

    end

end