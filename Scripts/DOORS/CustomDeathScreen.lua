-- Target the core network components
local RemotesFolder = game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder")
local GameStats = game:GetService("ReplicatedStorage"):WaitForChild("GameStats")
local Player = game:GetService("Players").LocalPlayer

-- 1. Thread the exact client signal execution from the repository configuration
task.spawn(function()
    -- Explicitly fires the native typewriter module event hook
    firesignal(RemotesFolder.DeathHint.OnClientEvent, {
        "Hello...", 
        "I'm glad you found this place!", 
        "And i'm surprised how you even got here, since most elevators are broken or unstable.", 
        "Goodbye, and I hope I see you later!..."
    }, "Yellow")
end)

-- 2. Safely inject your active DeathCause parameter values 
pcall(function()
    GameStats["Player_" .. Player.Name].Total.DeathCause.Value = "Elevator"
end)

-- 3. THE ABSOLUTE CRUCIAL FIX: Wait 1.5 seconds instead of 0.1
-- This gives the game engine enough time to start typing the sentences before the character resets
task.wait(1.5)

-- 4. Initiate the standard damage threshold sequence to process the kill loop cleanly
if Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
    Player.Character:FindFirstChildOfClass("Humanoid").Health = -100
else
    if Player.Character then Player.Character:BreakJoints() end
end
