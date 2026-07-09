-------------------------------------------------------
-- Event Handler
-------------------------------------------------------

local Frame = CreateFrame("Frame")

HBN.EventFrame = Frame

-------------------------------------------------------

Frame:RegisterEvent("PLAYER_LOGIN")
Frame:RegisterEvent("GROUP_ROSTER_UPDATE")
Frame:RegisterEvent("PLAYER_ENTERING_WORLD")
Frame:RegisterEvent("PLAYER_REGEN_ENABLED")
Frame:RegisterEvent("READY_CHECK")

-------------------------------------------------------

Frame:SetScript("OnEvent", function(_, event, ...)

    if HBN[event] then
        HBN[event](HBN, ...)
    end

end)

-------------------------------------------------------
-- PLAYER_LOGIN
-------------------------------------------------------

function HBN:PLAYER_LOGIN()

    HBNRaidAssistantDB = HBNRaidAssistantDB or {}

    self.DB = HBNRaidAssistantDB

    HBN.Priority:Build()

    ---------------------------------------------------
    -- Load Assignments
    ---------------------------------------------------

    HBN.Assignments:Load()

    self:Debug("Loaded")

end

-------------------------------------------------------
-- GROUP_ROSTER_UPDATE
-------------------------------------------------------

function HBN:GROUP_ROSTER_UPDATE()

    self:Debug("Raid Updated")

    ---------------------------------------------------
    -- Raid
    ---------------------------------------------------

    HBN.Raid:Scan()

    ---------------------------------------------------
    -- Debug
    ---------------------------------------------------

    HBN.Assignments:Print()

    ---------------------------------------------------
    -- Refresh UI
    ---------------------------------------------------

    if HBN.UI and HBN.UI.Frame then
        HBN.UI:Refresh()
    end

    ---------------------------------------------------
    -- Buff Scanner
    ---------------------------------------------------

    if HBN.BuffScanner then
        HBN.BuffScanner:Scan()
        HBN.BuffScanner:Print()
    end

end

-------------------------------------------------------
-- PLAYER_REGEN_ENABLED
-------------------------------------------------------

function HBN:PLAYER_REGEN_ENABLED()

    self:Debug("Left Combat")

end

-------------------------------------------------------
-- READY_CHECK
-------------------------------------------------------

function HBN:READY_CHECK()

    self:Debug("Ready Check")

end
