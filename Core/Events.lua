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

function HBN:PLAYER_LOGIN()

    if not HBNRaidAssistantDB then

        HBNRaidAssistantDB = {}

    end

    self.DB = HBNRaidAssistantDB
	HBN.Priority:Build()	

    self:Debug("Loaded")

end

-------------------------------------------------------

-------------------------------------------------------

function HBN:GROUP_ROSTER_UPDATE()

    self:Debug("Raid Updated")

    ---------------------------------------------------
    -- Assignment Engine
    ---------------------------------------------------

	HBN.Raid:Scan()

    ---------------------------------------------------
    -- Assignments
    ---------------------------------------------------

	HBN.Assignments:Initialize()

	HBN.Assignments:Print()

    ---------------------------------------------------
    -- Buff Scanner
    ---------------------------------------------------

	HBN.BuffScanner:Scan()

	HBN.BuffScanner:Print()

end

-------------------------------------------------------

function HBN:PLAYER_REGEN_ENABLED()

    self:Debug("Left Combat")

end

-------------------------------------------------------

function HBN:READY_CHECK()

    self:Debug("Ready Check")

end