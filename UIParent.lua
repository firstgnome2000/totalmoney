local WorldFrame = require("WorldFrame")

local CreateFrame = require("CreateFrame")
local function UIParent()
    -- Create the UIParent frame
    local frame = CreateFrame("Frame", "UIParent", nil)
    frame:SetSize(800, 600)
    frame:SetPoint("CENTER", WorldFrame, "CENTER")

    -- Add a background texture to the frame
    local texture = frame:CreateTexture(nil, "BACKGROUND")
    texture:SetAllPoints(frame)
    texture:SetColorTexture(0, 0, 0, 0.5)

    -- Add a title text to the frame
    local titleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    titleText:SetPoint("TOP", frame, "TOP", 0, -10)
    titleText:SetText("UIParent")

    -- Add a button to the frame
    local button = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    button:SetSize(100, 30)
    button:SetPoint("BOTTOM", frame, "BOTTOM", 0, 10)
    button:SetText("Click Me")
    button:SetScript("OnClick", function()
        print("Button clicked!")
    end)

    -- Add any additional configuration or functionality as needed

    return frame
end

return UIParent