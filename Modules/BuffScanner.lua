-------------------------------------------------------
-- Buff Scanner
-------------------------------------------------------

HBN.BuffScanner = {}

-------------------------------------------------------
-- Has Buff
-------------------------------------------------------

function HBN.BuffScanner:HasBuff(unit, buff)

    if buff.group then

        if UnitBuff(unit, buff.group.name) then
            return true
        end

    end

    if buff.single then

        if UnitBuff(unit, buff.single.name) then
            return true
        end

    end

    return false

end

-------------------------------------------------------
-- Scan
-------------------------------------------------------

function HBN.BuffScanner:Scan()

    HBN.Responsibilities:ClearMissing()

    for key, resp in pairs(HBN.Responsibilities) do

        if type(resp) == "table" then

            self:ScanResponsibility(resp)

        end

    end

end

-------------------------------------------------------
-- Scan Responsibility
-------------------------------------------------------

function HBN.BuffScanner:ScanResponsibility(resp)

    local buff = HBN.Buffs[resp.key]

    if not buff then
        return
    end

    for _, player in ipairs(HBN.Raid.Players) do

        if not self:HasBuff(player.unit, buff) then

            HBN.Responsibilities:AddMissing(

                resp.key,

                player

            )

        end

    end

end

-------------------------------------------------------
-- Debug
-------------------------------------------------------

function HBN.BuffScanner:Print()

    HBN.Utils:Print(" ")

    HBN.Utils:Print("===== Missing Buffs =====")

    for key, resp in pairs(HBN.Responsibilities) do

        if #resp.missing > 0 then

            HBN.Utils:Print(key)

            for _, player in ipairs(resp.missing) do

                HBN.Utils:Print(

                    "   "..player.name

                )

            end

        end

    end

end