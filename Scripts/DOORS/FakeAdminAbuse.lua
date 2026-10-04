local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local name = "LSPLASH"

local DoorsCaptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Captions/main/init.luau"))()

DoorsCaptions.caption("Run !startadmin for this script to start.", "thought", 5)

-- Variable tracking activation
local adminStarted = false

-- 1. Hook chat event
local chatConnection
chatConnection = LocalPlayer.Chatted:Connect(function(message)
    -- Normalize text (removes accidental spaces and mixed capitalization)
    local clearMessage = string.lower(string.gsub(message, "%s+", ""))
    
    if clearMessage == "!startadmin" then
        adminStarted = true
        if chatConnection then
            chatConnection:Disconnect()
        end
    end
end)

-- 2. Pause execution until adminStarted becomes true
while not adminStarted do
    task.wait(0.5)
end

-- 3. Sequenced caption display
DoorsCaptions.caption(name .. ": Yoo sup guys!!!!", "info", 5)
task.wait(7)

DoorsCaptions.caption(name .. ": Welcome to this first DOORS admin abuse :D", "info", 5)
task.wait(5)

DoorsCaptions.caption(name .. ": Should i spawn Alma?", "info", 5)
task.wait(10)

DoorsCaptions.caption("Spawn Alma? (20s left)", "thought", 20)
task.wait(1)
DoorsCaptions.caption("Yes", "warning", 19)
DoorsCaptions.caption("No", "warning", 19)
task.wait(19)

DoorsCaptions.caption(name .. ": Oh wow 79% of people voted yes, 21% voted no.", "info", 5)
task.wait(5)

DoorsCaptions.caption(name .. ": Sorry if i'll end your run.", "info", 5)
task.wait(3)

game.ReplicatedStorage.RemotesFolder.AdminPanelRunCommand:FireServer("Alma")

print("ended admin!")
return "ended admin!"
