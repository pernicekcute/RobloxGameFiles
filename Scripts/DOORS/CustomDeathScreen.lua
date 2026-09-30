-- Trigger the client signal
firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"Yo", "sup vruh"})

-- Update player stats
game.ReplicatedStorage.GameStats["Player_" .. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Test"

-- Set health to -100
local character = game.Players.LocalPlayer.Character
if character and character:FindFirstChildOfClass("Humanoid") then
    character.Humanoid.Health = -100
end
