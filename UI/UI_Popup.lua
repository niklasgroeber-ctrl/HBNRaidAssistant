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

end

-------------------------------------------------------
-- Hide
-------------------------------------------------------

function HBN.Popup:Hide()

    if self.Frame then
        self.Frame:Hide()
    end

end

-------------------------------------------------------
-- Show
-------------------------------------------------------

function HBN.Popup:Show(cell)

    if not self.Frame then
        self:Create()
    end

    self.CurrentCell = cell

    local frame = self.Frame

    frame:ClearAllPoints()

    frame:SetPoint(

        "TOPLEFT",

        cell,

        "BOTTOMLEFT",

        0,

        -2

    )

    frame.Title:SetText(

        HBN.Buffs[cell.buff].display

    )

    frame:Show()

end

