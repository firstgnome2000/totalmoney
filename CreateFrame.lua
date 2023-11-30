-- CreateFrame.lua
local UIParent = require("UIParent")
local function CreateFrame(frameType, frameName, parentFrame, template)
    local frame = _G[frameName] or CreateFrame(frameType, frameName, parentFrame, template)
    frame:SetSize(200, 100)
    frame:SetPoint("CENTER", UIParent, "CENTER")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:SetClampedToScreen(true)
    return frame
end

return CreateFrame