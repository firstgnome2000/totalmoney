local CreateFrame = require("CreateFrame")
local UIParent =  CreateFrame("Frame")

local goldTrackerFrame
local minimizeButtonFrame
local maximizeButtonFrame
local lifetimeEarningsLabel
local lifetimeEarningsValue

local function createGoldTrackerFrame()
    goldTrackerFrame = CreateFrame("Frame", "GoldTrackerFrame", UIParent)
    goldTrackerFrame:SetPoint("CENTER", 0, 0)
    goldTrackerFrame:SetSize(200, 100)
    goldTrackerFrame:SetMovable(true)
    goldTrackerFrame:SetResizable(true)
    goldTrackerFrame:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" then
            goldTrackerFrame:StartMoving()
            goldTrackerFrame.isMoving = true
        end
    end)
    goldTrackerFrame:SetScript("OnMouseUp", function(_, button)
        if button == "LeftButton" and goldTrackerFrame.isMoving then
            goldTrackerFrame:StopMovingOrSizing()
            goldTrackerFrame.isMoving = false
        end
    end)
end

local function createMinimizeButton()
    minimizeButtonFrame = CreateFrame("Button", "MinimizeButtonFrame", goldTrackerFrame)
    minimizeButtonFrame:SetPoint("TOPRIGHT", goldTrackerFrame, "TOPRIGHT", -5, -5)
    minimizeButtonFrame:SetSize(20, 20)
    minimizeButtonFrame:SetText("_")
    minimizeButtonFrame:SetScript("OnClick", function()
        if goldTrackerFrame:IsShown() then
            goldTrackerFrame:Hide()
        else
            goldTrackerFrame:Show()
        end
    end)
end

local function createMaximizeButton()
    maximizeButtonFrame = CreateFrame("Button", "MaximizeButtonFrame", goldTrackerFrame)
    maximizeButtonFrame:SetPoint("TOPRIGHT", minimizeButtonFrame, "TOPLEFT", -5, 0)
    maximizeButtonFrame:SetSize(20, 20)
    maximizeButtonFrame:SetText("X")
    maximizeButtonFrame:SetScript("OnClick", function()
        if goldTrackerFrame:IsMaximized() then
            goldTrackerFrame:Restore()
        else
            goldTrackerFrame:Maximize()
        end
    end)
end

local function createLifetimeEarningsLabels()
    lifetimeEarningsLabel = goldTrackerFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    lifetimeEarningsLabel:SetPoint("TOPLEFT", goldTrackerFrame, "TOPLEFT", 10, -30)
    lifetimeEarningsLabel:SetText("Lifetime Gold Earnings:")

    lifetimeEarningsValue = goldTrackerFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    lifetimeEarningsValue:SetPoint("TOPLEFT", lifetimeEarningsLabel, "BOTTOMLEFT", 0, -10)
end

local function calculateLifetimeEarnings()
    local totalGoldEarned = 1000
    lifetimeEarningsValue:SetText(totalGoldEarned .. " gold")
end

local function updateAddonInterface()
    calculateLifetimeEarnings()
end

local function onEvent(event, addonName)
    if event == "ADDON_LOADED" and addonName == "totalmoney" then
        updateAddonInterface()
    end
end

local function initializeAddon()
    createGoldTrackerFrame()
    createMinimizeButton()
    createMaximizeButton()
    createLifetimeEarningsLabels()

    goldTrackerFrame:RegisterEvent("ADDON_LOADED")
    goldTrackerFrame:SetScript("OnEvent", onEvent)
end

initializeAddon()