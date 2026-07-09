-------------------------------------------------------
-- HBN Raid Assistant
-------------------------------------------------------

local addonName, HBN = ...

_G.HBN = HBN

HBN.Name = addonName
HBN.Version = "0.1.0 Alpha"

-------------------------------------------------------
-- Global Tables
-------------------------------------------------------

HBN.DB = {}

HBN.Config = {}

HBN.Assignments = {}

HBN.RaidRoster = {}

HBN.Modules = {}

HBN.Events = {}

-------------------------------------------------------
-- Debug
-------------------------------------------------------

HBN.DebugEnabled = true

function HBN:Debug(...)

    if not self.DebugEnabled then
        return
    end

    print("|cff00ff88[HBN]|r", ...)

end