-- 1. Trigger the client signal WITH the required "Yellow" parameter added at the end
task.spawn(function()
    firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {
        "Hello...", 
        "I'm glad you found this place!", 
        "And i'm surprised how you even got here, since most elevators are broken or unstable.", 
        "Goodbye, and I hope I see you later!..."
    }, "Yellow")
end)

-- 2. Safely apply your working DeathCause value change
game.ReplicatedStorage.GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Elevator"

-- 3. CRUCIAL FIX: Give the engine a split-second window to load the UI before the character drops dead
task.wait(0.08)

-- 4. Execute the character kill sequence natively
local character = game.Players.LocalPlayer.Character
if character and character:FindFirstChildOfClass("Humanoid") then
    character:FindFirstChildOfClass("Humanoid").Health = -100
else
    if character then character:BreakJoints() end
end
