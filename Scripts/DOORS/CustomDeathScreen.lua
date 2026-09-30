firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"Hello...", "I'm glad you found this place!", "And i'm surprised how you even got here, since most elevators are broken or unstable.", "Goodbye, and I hope I see you later!..."})

game.ReplicatedStorage.GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Elevator"

game.Players.LocalPlayer.Character.Humanoid.Health = -100
