-------------------------------------------------------
-- Raid.lua
-- Raid Management
-------------------------------------------------------

HBN.Raid = {}

-------------------------------------------------------
-- Runtime
-------------------------------------------------------

HBN.Raid.Players = {}

HBN.Raid.Classes = {}

-------------------------------------------------------
-- Create Player Object
-------------------------------------------------------

function HBN.Raid:CreatePlayer(unit)

    local player = {}

	player.unit = unit

	player.name = UnitName(unit)

	player.raidIndex = tonumber(unit:match("%d+")) or 0

	local _, class = UnitClass(unit)

    player.class = class

    player.online = UnitIsConnected(unit)

    player.dead = UnitIsDeadOrGhost(unit)

    player.leader = UnitIsGroupLeader(unit)

    player.assistant = UnitIsGroupAssistant(unit)

    return player

end

-------------------------------------------------------
-- Scan Raid
-------------------------------------------------------

function HBN.Raid:Scan()

    wipe(self.Players)

    wipe(self.Classes)

    if not IsInRaid() then
        return
    end

    local members = GetNumGroupMembers()

    for i = 1, members do

        local unit = "raid"..i

        local player = self:CreatePlayer(unit)

        table.insert(self.Players, player)

    end

    self:BuildClassLists()

end

-------------------------------------------------------
-- Build Classes
-------------------------------------------------------

function HBN.Raid:BuildClassLists()

    for _, player in ipairs(self.Players) do

        if not self.Classes[player.class] then

            self.Classes[player.class] = {}

        end

        table.insert(

            self.Classes[player.class],

            player

        )

    end

end

-------------------------------------------------------
-- Get Class
-------------------------------------------------------

function HBN.Raid:GetClass(class)

    return self.Classes[class] or {}

end

-------------------------------------------------------
-- Get Player
-------------------------------------------------------

function HBN.Raid:GetPlayer(class,index)

    local players = self:GetClass(class)

    return players[index]

end

-------------------------------------------------------
-- Count Players
-------------------------------------------------------

function HBN.Raid:Count(class)

    return #self:GetClass(class)

end

-------------------------------------------------------
-- Get Sorted Class
-------------------------------------------------------

function HBN.Raid:GetSortedClass(class)

    local players = {}

    -- Kopie der Spielerliste erstellen
    for _, player in ipairs(self:GetClass(class)) do
        table.insert(players, player)
    end

    table.sort(players, function(a, b)

        local pa = HBN.Priority:Get(class, a.name)
        local pb = HBN.Priority:Get(class, b.name)

        -- Haben beide die gleiche Priorität (oder gar keine),
        -- dann bleibt die Raidreihenfolge erhalten.
        if pa == pb then
            return a.raidIndex < b.raidIndex
        end

        return pa < pb

    end)

    return players

end

-------------------------------------------------------
-- Get Sorted Player
-------------------------------------------------------

function HBN.Raid:GetSortedPlayer(class,index)

    local players = self:GetSortedClass(class)

    return players[index]

end