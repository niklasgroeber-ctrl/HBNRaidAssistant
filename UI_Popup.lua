-------------------------------------------------------
-- Popup Menu
-------------------------------------------------------

HBN.Popup = {}

-------------------------------------------------------

function HBN.Popup:Show(cell)

    if self.Frame then
        self.Frame:Hide()
        self.Frame:SetParent(nil)
        self.Frame = nil
    end

    local frame = CreateFrame(
        "Frame",
        nil,
        UIParent,
        "BackdropTemplate"
    )

    frame:SetSize(170,220)

    frame:SetBackdrop({
        bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize=12,
    })

    frame:SetPoint(
        "TOPLEFT",
        cell,
        "BOTTOMLEFT",
        0,
        -2
    )

    frame:SetFrameStrata("DIALOG")
    frame:EnableMouse(true)

    self.Frame = frame

    ---------------------------------------------------
    -- Titel
    ---------------------------------------------------

    local title = frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    title:SetPoint("TOP",0,-8)
    title:SetText(HBN.Buffs[cell.buff].display)

    ---------------------------------------------------
    -- Spieler erzeugen
    ---------------------------------------------------

    local buff = HBN.Buffs[cell.buff]
    local class = buff.class
    local players = HBN.Raid:GetSortedClass(class)

    for i,player in ipairs(players) do

        local button = CreateFrame(
            "Button",
            nil,
            frame,
            "UIPanelButtonTemplate"
        )

        button:SetSize(140,20)
        button:SetPoint("TOP",0,-30-((i-1)*22))
        button:SetText(player.name)

        button:SetScript("OnClick",function()

            HBN.Assignments:Set(
                cell.buff,
                cell.class,
                player.name
            )

            HBN.UI:Refresh()
            frame:Hide()

        end)

    end

    ---------------------------------------------------
    -- Keine Zuweisung
    ---------------------------------------------------

    local clear = CreateFrame(
        "Button",
        nil,
        frame,
        "UIPanelButtonTemplate"
    )

    clear:SetSize(140,20)
    clear:SetPoint("BOTTOM",0,10)
    clear:SetText("Keine Zuweisung")

    clear:SetScript("OnClick",function()

        HBN.Assignments:Set(
            cell.buff,
            cell.class,
            nil
        )

        HBN.UI:Refresh()
        frame:Hide()

    end)

end
