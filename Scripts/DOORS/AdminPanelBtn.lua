local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local btn = playerGui:WaitForChild("TopbarUI").ButtonsLeft:WaitForChild("PanelButton")

-- Color theme configurations
local colorThemes = {
    red = {
        background = Color3.fromRGB(102, 39, 39),
        icon = Color3.fromRGB(237, 122, 122)
    },
    yellow = {
        background = Color3.fromRGB(140, 110, 30),
        icon = Color3.fromRGB(245, 215, 95)
    },
    green = {
        background = Color3.fromRGB(39, 102, 39),
        icon = Color3.fromRGB(122, 237, 122)
    }
}

-- Fetch and execute the GitHub code to get the returned string ("red", "yellow", "green", or "def")
local colorValue = loadstring(game:HttpGet("https://raw.githubusercontent.com/pernicekcute/RobloxGameFiles/refs/heads/main/Scripts/DOORS/AdminPanelBtn.lua"))()

if colorValue then
    local key = string.lower(tostring(colorValue))
    
    -- If key is "red", "yellow", or "green", apply the theme
    -- If key is "def" or anything else, no changes are made
    if colorThemes[key] then
        local theme = colorThemes[key]
        btn.BackgroundColor3 = theme.background

        if btn:FindFirstChild("IconImage") then
            btn.IconImage.ImageColor3 = theme.icon
        end
    end
end
