local colorValue = ...

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui", 10)
local topbar = playerGui and playerGui:WaitForChild("TopbarUI", 10)
local buttonsLeft = topbar and topbar:WaitForChild("ButtonsLeft", 10)
local btn = buttonsLeft and buttonsLeft:WaitForChild("PanelButton", 10)

if not btn then return end

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

if colorValue then
    local key = string.lower(tostring(colorValue)):match("^%s*(.-)%s*$")
    
    if colorThemes[key] then
        local theme = colorThemes[key]
        btn.BackgroundColor3 = theme.background

        local icon = btn:FindFirstChild("IconImage") or btn:FindFirstChildWhichIsA("ImageLabel", true)
        if icon then
            icon.ImageColor3 = theme.icon
        end
    end
end
