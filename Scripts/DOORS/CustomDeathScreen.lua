-- Target the core network components
local RemotesFolder = game:GetService("ReplicatedStorage"):WaitForChild("RemotesFolder")
local GameStats = game:GetService("ReplicatedStorage"):WaitForChild("GameStats")
local Player = game:GetService("Players").LocalPlayer

-- 1. Thread the exact client signal execution from the repository configuration
task.spawn(function()
    -- Adding the "Yellow" structural tag prevents the typewriter module from throwing a silent data exception
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

-- 3. THE DEFINITIVE CRUCIAL FIX: Wait exactly 0.1 seconds 
-- This stops the race condition, giving the typing engine the padding it needs to load before dying
task.wait(0.1)

-- 4. Initiate the standard damage threshold sequence to process the kill loop cleanly
if Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") then
    Player.Character:FindFirstChildOfClass("Humanoid").Health = -100
else
    if Player.Character then Player.Character:BreakJoints() end
end
