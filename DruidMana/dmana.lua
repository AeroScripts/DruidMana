local bar = CreateFrame("StatusBar", nil, PlayerFrame)
bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
bar:GetStatusBarTexture():SetHorizTile(false)
bar:SetWidth(118)
bar:SetHeight(8)
bar:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 107, -66)
bar:SetStatusBarColor(0.1,0.1,1)   

local border = CreateFrame("Frame", nil, UIParent)
border:SetWidth(257)
border:SetHeight(33)
border:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 100, -62)

local tex = border:CreateTexture(nil, "BACKGROUND")
tex:SetAllPoints(border)
tex:SetWidth(257)
tex:SetHeight(33)
tex:SetTexture("Interface\\Addons\\DruidMana\\border.blp")

bar.border = border

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
        if form == 1 or form == 3 then
            self:Show()
            self.border:Show()
        else
            self:Hide()
            self.border:Hide()
        end
    end
end)

local form = GetShapeshiftForm()
if form == 1 or form == 3 then
    bar:Show()
    bar.border:Show()
else
    bar:Hide()
    bar.border:Hide()
end
