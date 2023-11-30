local CreateFrame = require("CreateFrame")
local UIParent = require("UIParent")
local function WorldFrame()
    -- Create the WorldFrame frame
    local frame = CreateFrame("Frame", "WorldFrame", nil)
    frame:SetSize(1024, 768)
    frame:SetPoint("CENTER", UIParent, "CENTER")

    -- Add a background texture to the frame
    local texture = frame:CreateTexture(nil, "BACKGROUND")
    texture:SetAllPoints(frame)
    texture:SetColorTexture(0.1, 0.1, 0.1)

    -- Add a title text to the frame
    local titleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    titleText:SetPoint("TOP", frame, "TOP", 0, -10)
    titleText:SetText("WorldFrame")

    -- Add any additional configuration or functionality as needed

    return frame
end

return WorldFrame