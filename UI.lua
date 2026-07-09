-------------------------------------------------------
-- UI
-------------------------------------------------------

HBN.UI = {}

-------------------------------------------------------
-- Runtime
-------------------------------------------------------

HBN.UI.Cells = {}

-------------------------------------------------------
-- Window
-------------------------------------------------------

function HBN.UI:Create()

    if self.Frame then
        return
    end

    local frame = CreateFrame(
        "Frame",
        "HBNRaidAssistantFrame",
        UIParent,
        "BackdropTemplate"
    )

    frame:SetSize(900,500)

    frame:SetPoint("CENTER")

    frame:SetBackdrop({

        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",

        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",

        tile = true,

        tileSize = 32,

        edgeSize = 32,

        insets = {

            left = 8,

            right = 8,

            top = 8,

            bottom = 8,

        },

    })

    frame:Hide()

    self.Frame = frame

end

-------------------------------------------------------
-- Header
-------------------------------------------------------

function HBN.UI:CreateHeader()

    local text = self.Frame:CreateFontString(

        nil,

        "OVERLAY",

        "GameFontNormalLarge"

    )

    text:SetPoint(

        "TOP",

        0,

        -20

    )

    text:SetText(

        "HBN Raid Assistant"

    )

end

-------------------------------------------------------
-- Create Class Header
-------------------------------------------------------

function HBN.UI:CreateClassHeader()

    local classes = {

        {"WARRIOR","War"},
        {"ROGUE","Rog"},
        {"MAGE","Mag"},
        {"WARLOCK","Wlk"},
        {"HUNTER","Hun"},
        {"PRIEST","Pri"},
        {"DRUID","Dru"},
        {"PALADIN","Pal"},
        {"SHAMAN","Sha"},

    }

    local startX = 170
    local y = -55

    for i,data in ipairs(classes) do

        local text = self.Frame:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontNormal"
        )

        text:SetPoint(
            "TOPLEFT",
            startX + ((i-1)*60),
            y
        )

        text:SetText(data[2])

    end

end

-------------------------------------------------------
-- Create Buff Labels
-------------------------------------------------------

function HBN.UI:CreateBuffLabels()

    local buffs = {

        "Kings",

        "Wisdom",

        "Might",

        "Sanct",

        "Fort",

        "Shadow",

        "MotW",

        "Int",

    }

    local x = 20
    local startY = -85

    for i,buff in ipairs(buffs) do

        local text = self.Frame:CreateFontString(

            nil,

            "OVERLAY",

            "GameFontNormal"

        )

        text:SetPoint(

            "TOPLEFT",

            x,

            startY - ((i-1)*30)

        )

        text:SetText(buff)

    end

end

-------------------------------------------------------
-- Assignment Grid
-------------------------------------------------------

function HBN.UI:CreateGrid()

    local startX = 165
    local startY = -78

    local cellWidth = 60
    local cellHeight = 30

    local buffs = {
        "KINGS","WISDOM","MIGHT","SANCT",
        "FORT","SHADOW","MOTW","INT",
    }

    local classes = {
        "WARRIOR","ROGUE","MAGE","WARLOCK",
        "HUNTER","PRIEST","DRUID","PALADIN","SHAMAN",
    }

    for row, buffKey in ipairs(buffs) do

        self.Cells[row] = {}

        for col, class in ipairs(classes) do

            local cell = CreateFrame(
                "Button",
                nil,
                self.Frame,
                "BackdropTemplate"
            )

            cell:SetSize(52,22)

            cell:SetPoint(
                "TOPLEFT",
                startX + ((col-1)*cellWidth),
                startY - ((row-1)*cellHeight)
            )

            cell:SetBackdrop({
                bgFile="Interface\\Buttons\\WHITE8X8",
                edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",
                edgeSize=10,
            })

            cell:SetBackdropColor(0.08,0.08,0.08,0.9)

            local label = cell:CreateFontString(
                nil,
                "OVERLAY",
                "GameFontNormalSmall"
            )

            label:SetPoint("CENTER")
            label:SetText("-")

            cell.Text = label

            cell.buff = buffKey
            cell.class = class

            cell:SetScript("OnClick", function(self)
                if HBN.Popup and HBN.Popup.Show then
                    HBN.Popup:Show(self)
                else
                    HBN.Assignments:Set(self.buff,self.class,"TEST")
                    HBN.UI:Refresh()
                end
            end)

            self.Cells[row][col] = cell

        end

    end

end

-------------------------------------------------------
-- Refresh Grid
-------------------------------------------------------

function HBN.UI:Refresh()

    local buffs = {

        "KINGS",
        "WISDOM",
        "MIGHT",
        "SANCT",

        "FORT",
        "SHADOW",

        "MOTW",

        "INT",

    }

    local classes = {

        "WARRIOR",
        "ROGUE",
        "MAGE",
        "WARLOCK",
        "HUNTER",
        "PRIEST",
        "DRUID",
        "PALADIN",
        "SHAMAN",

    }

    for row, buff in ipairs(buffs) do

        for col, class in ipairs(classes) do

            local cell = self.Cells[row][col]

            local player = HBN.Assignments:Get(

                buff,

                class

            )

            if player then

                cell.Text:SetText(player)
                cell.Text:SetTextColor(0.2,1.0,0.2)

            else

                cell.Text:SetText("-")
                cell.Text:SetTextColor(1.0,0.2,0.2)

            end

        end

    end

end


-------------------------------------------------------
-- Get Cell
-------------------------------------------------------

function HBN.UI:GetCell(buff,class)

    for _, row in ipairs(self.Cells) do
        for _, cell in ipairs(row) do
            if cell.buff == buff and cell.class == class then
                return cell
            end
        end
    end

end

-------------------------------------------------------
-- Toggle
-------------------------------------------------------

function HBN.UI:Toggle()

    if not self.Frame then

		self:Create()

		self:CreateHeader()

		self:CreateClassHeader()

		self:CreateBuffLabels()
		
		self:CreateGrid()
		
		self:Refresh()

    end

    if self.Frame:IsShown() then

        self.Frame:Hide()

    else

        self.Frame:Show()

    end

end

SLASH_HBN1="/hbn"

SlashCmdList["HBN"]=function()

    HBN.UI:Toggle()

end