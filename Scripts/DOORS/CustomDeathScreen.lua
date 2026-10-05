-- Delta iOS Mobile Optimized Script
local RemotesFolder = game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder")
local GameStats = game:GetService("ReplicatedStorage"):WaitForChild("GameStats")
local Player = game:GetService("Players").LocalPlayer
local DoorsCaptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Captions/main/init.luau"))()

local deathType = "Yellow"
local ver = "1.0"

if deathType == "Yellow" then
    DoorsCaptions.caption("Loading - Curious Light Death Message! v" .. ver .. ", Made by rkyroaddd3!", "info", 7)
elseif deathType == "Blue" then
    DoorsCaptions.caption("Loading - Guiding Light Death Message! v" .. ver .. ", Made by rkyroaddd3!", "info", 7)
end

local CustomLines = {
    "You stayed in the dark a little too long...",
    "And the melody faded, leaving only empty halls.",
    "No one was left to watch you fall."
}

-- 1. Safely inject your working DeathCause value first
pcall(function()
    GameStats["Player_" .. Player.Name].Total.DeathCause.Value = "rkyroaddd3"
end)

-- 2. Trigger the real typewriter signal natively using Delta's framework
task.spawn(function()
    firesignal(RemotesFolder.DeathHint.OnClientEvent, CustomLines, deathType)
end)

-- 3. MOBILE ENGINE TIMING BIND: Calculate exactly how long the text takes to print.
-- Each line takes roughly 3-4 seconds to type out and read. 
-- We wait 7 seconds so your phone can safely show the text while your character is alive!
task.wait(7)

-- 4. Clean local character reset after the text is fully finished
local character = Player.Character
if character and character:FindFirstChildOfClass("Humanoid") then
    character:FindFirstChildOfClass("Humanoid").Health = 0
else
    if character then character:BreakJoints() end
end
