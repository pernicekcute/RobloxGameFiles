local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Safely access TopbarUI inside PlayerGui
local btn = playerGui:WaitForChild("TopbarUI").ButtonsLeft:WaitForChild("PanelButton")

-- Ensure background transparency isn't hiding the color
btn.BackgroundTransparency = 0
btn.BackgroundColor3 = Color3.fromRGB(102, 39, 39)

-- Ensure icon is visible and tinted
if btn:FindFirstChild("IconImage") then
    btn.IconImage.ImageTransparency = 0
    btn.IconImage.ImageColor3 = Color3.fromRGB(237, 122, 122)
end
