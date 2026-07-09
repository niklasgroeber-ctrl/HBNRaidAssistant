-------------------------------------------------------
-- Utilities
-------------------------------------------------------

HBN.Utils = {}

function HBN.Utils:Print(message)

    DEFAULT_CHAT_FRAME:AddMessage(
        "|cff00ff88HBN|r "..message
    )

end

-------------------------------------------------------

function HBN.Utils:IsInRaid()

    return IsInRaid()

end

-------------------------------------------------------

function HBN.Utils:PlayerClass(unit)

    local _, class = UnitClass(unit)

    return class

end

-------------------------------------------------------

function HBN.Utils:PlayerName(unit)

    return UnitName(unit)

end