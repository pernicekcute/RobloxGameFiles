-- Delta iOS Mobile Optimized Script
local RemotesFolder = game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder")
local GameStats = game:GetService("ReplicatedStorage"):WaitForChild("GameStats")
local Player = game:GetService("Players").LocalPlayer
local DoorsCaptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Captions/main/init.luau"))()

DoorsCaptions.caption("Please load this with Admin Panel and GodMode ON!!", "info", 7)

local CustomLines = {
    "Hello...", 
    "I'm glad you found this place!", 
    "And i'm surprised how you even got here, since most elevators are broken or unstable.", 
    "Goodbye, and I hope I see you later!..."
}

-- 1. Safely inject your working DeathCause value first
pcall(function()
    GameStats["Player_" .. Player.Name].Total.DeathCause.Value = "Elevator"
end)

-- 2. Trigger the real typewriter signal natively using Delta's framework
task.spawn(function()
    firesignal(RemotesFolder.DeathHint.OnClientEvent, CustomLines, "Yellow")
end)

-- 3. MOBILE ENGINE TIMING BIND: Calculate exactly how long the text takes to print.
-- Each line takes roughly 3-4 seconds to type out and read. 
-- We wait 12 seconds so your phone can safely show the text while your character is alive!
task.wait(7)

-- 4. Clean local character reset after the text is fully finished
local character = Player.Character
if character and character:FindFirstChildOfClass("Humanoid") then
    character:FindFirstChildOfClass("Humanoid").Health = 0
else
    if character then character:BreakJoints() end
end
