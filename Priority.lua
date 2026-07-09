-------------------------------------------------------
-- Priority Lists
-------------------------------------------------------

HBN.Priority = {}

-------------------------------------------------------
-- Priority Lists
-------------------------------------------------------

HBN.Priority.Default = {

    PALADIN = {},

    PRIEST = {},

    DRUID = {},

    MAGE = {},

}

-------------------------------------------------------
-- Runtime Maps
-------------------------------------------------------

HBN.Priority.Map = {}

-------------------------------------------------------
-- Build Map
-------------------------------------------------------

function HBN.Priority:Build()

    wipe(self.Map)

    for class, list in pairs(self.Default) do

        self.Map[class] = {}

        for index, name in ipairs(list) do

            self.Map[class][name] = index

        end

    end

end

-------------------------------------------------------
-- Get Priority
-------------------------------------------------------

function HBN.Priority:Get(class, name)

    if not self.Map[class] then
        return 999
    end

    return self.Map[class][name] or 999

end