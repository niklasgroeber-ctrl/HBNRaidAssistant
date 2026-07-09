-------------------------------------------------------
-- Assignments.lua
-------------------------------------------------------

HBN.Assignments = {}

-------------------------------------------------------
-- Runtime Data
-------------------------------------------------------

HBN.Assignments.Data = {}

-------------------------------------------------------
-- Klassen
-------------------------------------------------------

HBN.Classes = {
    "WARRIOR","ROGUE","MAGE","WARLOCK","HUNTER",
    "PRIEST","DRUID","PALADIN","SHAMAN",
}

-------------------------------------------------------
-- Initialize
-------------------------------------------------------

function HBN.Assignments:Initialize()

    wipe(self.Data)

    local buffs = {
        "KINGS","WISDOM","MIGHT","SANCT",
        "FORT","SHADOW","INT","MOTW",
    }

    for _, buff in ipairs(buffs) do
        self.Data[buff] = {}

        for _, class in ipairs(HBN.Classes) do
            self.Data[buff][class] = nil
        end
    end

end

-------------------------------------------------------
-- Save
-------------------------------------------------------

function HBN.Assignments:Save()

    HBNRaidAssistantDB = HBNRaidAssistantDB or {}
    HBNRaidAssistantDB.Assignments = self.Data

end

-------------------------------------------------------
-- Load
-------------------------------------------------------

function HBN.Assignments:Load()

    HBNRaidAssistantDB = HBNRaidAssistantDB or {}

    if HBNRaidAssistantDB.Assignments then
        self.Data = HBNRaidAssistantDB.Assignments
    else
        self:Initialize()
        self:Save()
    end

end

-------------------------------------------------------
-- Reset
-------------------------------------------------------

function HBN.Assignments:Reset()
    self:Initialize()
    self:Save()
end

-------------------------------------------------------
-- Clear
-------------------------------------------------------

function HBN.Assignments:Clear(buff,class)

    if not self.Data[buff] then return end

    self.Data[buff][class] = nil
    self:Save()

end

-------------------------------------------------------
-- Set Assignment
-------------------------------------------------------

function HBN.Assignments:Set(buff,class,player)

    if not self.Data[buff] then return end

    self.Data[buff][class] = player
    self:Save()

end

-------------------------------------------------------
-- Get Assignment
-------------------------------------------------------

function HBN.Assignments:Get(buff,class)

    if not self.Data[buff] then
        return nil
    end

    return self.Data[buff][class]

end

-------------------------------------------------------
-- Debug
-------------------------------------------------------

function HBN.Assignments:Print()

    HBN.Utils:Print(" ")
    HBN.Utils:Print("===== Assignments =====")

    for buff,data in pairs(self.Data) do
        HBN.Utils:Print(buff)

        for class,name in pairs(data) do
            if name then
                HBN.Utils:Print("   "..class.." -> "..name)
            end
        end
    end

end
