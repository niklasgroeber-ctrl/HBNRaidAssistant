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
