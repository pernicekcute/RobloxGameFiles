local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local playerGui = localPlayer:WaitForChild("PlayerGui", 10)
local topbar = playerGui and playerGui:WaitForChild("TopbarUI", 10)
local buttonsLeft = topbar and topbar:WaitForChild("ButtonsLeft", 10)
local btn = buttonsLeft and buttonsLeft:WaitForChild("PanelButton", 10)

if not btn then return end

local colorThemes = {
    red = {
        background = Color3.fromRGB(102, 39, 39),
        icon = Color3.fromRGB(237, 122, 122)
    },
    orange = {
        background = Color3.fromRGB(140, 80, 30),
        icon = Color3.fromRGB(245, 160, 80)
    },
    yellow = {
        background = Color3.fromRGB(140, 110, 30),
        icon = Color3.fromRGB(245, 215, 95)
    },
    green = {
        background = Color3.fromRGB(39, 102, 39),
        icon = Color3.fromRGB(122, 237, 122)
    },
    lime = {
        background = Color3.fromRGB(70, 120, 30),
        icon = Color3.fromRGB(160, 240, 90)
    },
    teal = {
        background = Color3.fromRGB(30, 100, 100),
        icon = Color3.fromRGB(90, 210, 210)
    },
    cyan = {
        background = Color3.fromRGB(30, 110, 130),
        icon = Color3.fromRGB(90, 220, 245)
    },
    blue = {
        background = Color3.fromRGB(39, 65, 102),
        icon = Color3.fromRGB(122, 165, 237)
    },
    lightblue = {
        background = Color3.fromRGB(40, 90, 130),
        icon = Color3.fromRGB(130, 200, 250)
    },
    navy = {
        background = Color3.fromRGB(20, 35, 70),
        icon = Color3.fromRGB(90, 130, 210)
    },
    purple = {
        background = Color3.fromRGB(75, 39, 102),
        icon = Color3.fromRGB(180, 122, 237)
    },
    violet = {
        background = Color3.fromRGB(55, 35, 95),
        icon = Color3.fromRGB(150, 110, 230)
    },
    magenta = {
        background = Color3.fromRGB(110, 35, 95),
        icon = Color3.fromRGB(230, 110, 210)
    },
    pink = {
        background = Color3.fromRGB(130, 50, 90),
        icon = Color3.fromRGB(245, 140, 190)
    },
    brown = {
        background = Color3.fromRGB(85, 55, 35),
        icon = Color3.fromRGB(190, 140, 100)
    },
    black = {
        background = Color3.fromRGB(30, 30, 35),
        icon = Color3.fromRGB(140, 140, 150)
    },
    grey = {
        background = Color3.fromRGB(60, 60, 65),
        icon = Color3.fromRGB(180, 180, 185)
    },
    gray = {
        background = Color3.fromRGB(60, 60, 65),
        icon = Color3.fromRGB(180, 180, 185)
    },
    lightgrey = {
        background = Color3.fromRGB(90, 90, 95),
        icon = Color3.fromRGB(220, 220, 225)
    },
    lightgray = {
        background = Color3.fromRGB(90, 90, 95),
        icon = Color3.fromRGB(220, 220, 225)
    },
    white = {
        background = Color3.fromRGB(120, 120, 125),
        icon = Color3.fromRGB(255, 255, 255)
    }
}

local function applyTheme(message)
    if not message then return end
    local key = string.lower(tostring(message)):match("^%s*(.-)%s*$")
    
    if colorThemes[key] then
        local theme = colorThemes[key]
        btn.BackgroundColor3 = theme.background

        local icon = btn:FindFirstChild("IconImage") or btn:FindFirstChildWhichIsA("ImageLabel", true)
        if icon then
            icon.ImageColor3 = theme.icon
        end
    end
end

-- Connect listener to a player's chat
local function bindChatListener(plr)
    plr.Chatted:Connect(applyTheme)
end

-- Listen to your own chat messages
bindChatListener(localPlayer)

-- Listen to current and future players in the server
for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= localPlayer then
        bindChatListener(plr)
    end
end

Players.PlayerAdded:Connect(bindChatListener)
