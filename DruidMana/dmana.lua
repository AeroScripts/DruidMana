local background = CreateFrame("Frame", nil, PlayerFrame)
background:SetWidth(258)
background:SetHeight(33)
background:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 100, -62)

local texb = background:CreateTexture(nil, "BACKGROUND")
texb:SetAllPoints(background)
texb:SetWidth(258)
texb:SetHeight(33)
texb:SetTexture("Interface\\Addons\\DruidMana\\background.blp")


local bar = CreateFrame("StatusBar", nil, PlayerFrame)
bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
bar:GetStatusBarTexture():SetHorizTile(false)
bar:SetWidth(118)
bar:SetHeight(8)
bar:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 107, -66)
bar:SetStatusBarColor(0.1,0.1,1)   

local border = CreateFrame("Frame", nil, UIParent)
border:SetWidth(258)
border:SetHeight(33)
border:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 100, -62)

local tex = border:CreateTexture(nil, "BACKGROUND")
tex:SetAllPoints(border)
tex:SetWidth(258)
tex:SetHeight(33)
tex:SetTexture("Interface\\Addons\\DruidMana\\border.blp")

bar.border = border
bar.background = background

bar:RegisterEvent("UNIT_POWER_UPDATE")
bar:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
bar:SetScript("OnEvent", function(self, evt, ...)
    if evt == "UNIT_POWER_UPDATE" then
        --if not self.hasSetMax then
        --    self.hasSetMax = true
        self:SetMinMaxValues(0, UnitPowerMax("player", 0))
        --end
        self:SetValue(UnitPower("player", 0))
    elseif evt == "UPDATE_SHAPESHIFT_FORM" then
        local form = GetShapeshiftForm()
        if form == 1 or form == 2 or form == 3 then
            self.background:Show()
            self:Show()
            self.border:Show()
        else
            self.background:Hide()
            self:Hide()
            self.border:Hide()
        end
    end
end)

local form = GetShapeshiftForm()
if form == 1 or form == 2 or form == 3 then
    bar.background:Show()
    bar:Show()
    bar.border:Show()
else
    bar.background:Hide()
    bar:Hide()
    bar.border:Hide()
end
