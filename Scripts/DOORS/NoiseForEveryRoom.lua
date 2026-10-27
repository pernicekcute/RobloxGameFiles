local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CurrentRooms = Workspace:WaitForChild("CurrentRooms")

local AdminCommand = ReplicatedStorage
    :WaitForChild("RemotesFolder")
    :WaitForChild("AdminPanelRunCommand")

local OFFSET = 15

local function spawnNoise(room)
    local roomExit = room:WaitForChild("RoomExit", 10)

    if not roomExit or not roomExit:IsA("MeshPart") then
        warn("RoomExit not found in", room.Name)
        return
    end

    -- Position 15 studs inside the room from its exit.
    local spawnPosition =
        roomExit.Position - roomExit.CFrame.LookVector * OFFSET

    print("Room:", room.Name)
    print("Requested Noise position:", spawnPosition)

    -- The admin panel sends command ID + parameter table.
    AdminCommand:FireServer("Noise", {
        Position = spawnPosition
    })
end

CurrentRooms.ChildAdded:Connect(function(room)
    task.spawn(spawnNoise, room)
end)

print("Noise room detector enabled!")
