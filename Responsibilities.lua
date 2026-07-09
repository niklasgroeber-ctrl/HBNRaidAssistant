-------------------------------------------------------
-- Responsibilities.lua
-------------------------------------------------------

HBN.Responsibilities = {}

-------------------------------------------------------
-- Create
-------------------------------------------------------

function HBN.Responsibilities:Reset()

    wipe(self)

end

-------------------------------------------------------
-- Create Responsibility
-------------------------------------------------------

function HBN.Responsibilities:Add(buffKey, owner, backup)

    self[buffKey] = {

        key = buffKey,

        owner = owner,

        backup = backup,

        missing = {},

    }

end

-------------------------------------------------------
-- Get
-------------------------------------------------------

function HBN.Responsibilities:Get(buffKey)

    return self[buffKey]

end

-------------------------------------------------------
-- Missing Players
-------------------------------------------------------

function HBN.Responsibilities:ClearMissing()

    for _, data in pairs(self) do

        if type(data) == "table" then

            wipe(data.missing)

        end

    end

end

-------------------------------------------------------
-- Add Missing Player
-------------------------------------------------------

function HBN.Responsibilities:AddMissing(buffKey, player)

    local resp = self:Get(buffKey)

    if not resp then

        return

    end

    table.insert(resp.missing, player)

end

-------------------------------------------------------
-- Debug
-------------------------------------------------------

function HBN.Responsibilities:Print()

    HBN.Utils:Print(" ")

    HBN.Utils:Print("===== Responsibilities =====")

    for key, data in pairs(self) do

        if type(data) == "table" then

            local owner = "None"

            local backup = "None"

            if data.owner then
                owner = data.owner.name
            end

            if data.backup then
                backup = data.backup.name
            end

            HBN.Utils:Print(

                key..
                " -> "..owner..
                " | Backup: "..backup

            )

        end

    end

end