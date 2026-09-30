local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")

-- 1. Trigger the client signal exactly how you want it (No "Yellow" parameter)
if ReplicatedStorage.RemotesFolder:FindFirstChild("DeathHint") and typeof(firesignal) == "function" then
    task.spawn(function()
        firesignal(ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"Yo", "sup vruh"})
    end)
end

-- 2. Update the local player death tracking stat mapping
pcall(function()
    ReplicatedStorage.GameStats["Player_" .. player.Name].Total.DeathCause.Value = "Test"
end)

-- 3. CRUCIAL FIX: Wait 0.08 seconds so the typewriter loads before the game handles health
task.wait(0.08)

-- 4. Safely kill the character to drop into the transition loop cleanly
if humanoid then
    humanoid.Health = -100
else
    if character then character:BreakJoints() end
end
