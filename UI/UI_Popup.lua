-------------------------------------------------------
-- Popup Menu
-------------------------------------------------------

HBN.Popup = {}

HBN.Popup.Buttons = {}

HBN.Popup.Frame = nil

-------------------------------------------------------
-- Create
-------------------------------------------------------

function HBN.Popup:Create()

    if self.Frame then
        return
    end

    local frame = CreateFrame(

        "Frame",

        "HBNPopup",

        UIParent,

        "BackdropTemplate"

    )

    frame:SetSize(180,260)

    frame:SetBackdrop({

        bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",

        edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",

        edgeSize=12,

    })

    frame:SetFrameStrata("DIALOG")

    frame:EnableMouse(true)

    frame:Hide()

    self.Frame = frame

    ---------------------------------------------------
    -- Title
    ---------------------------------------------------

    local title = frame:CreateFontString(

        nil,

        "OVERLAY",

        "GameFontNormal"

    )

    title:SetPoint("TOP",0,-10)

    frame.Title = title

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
