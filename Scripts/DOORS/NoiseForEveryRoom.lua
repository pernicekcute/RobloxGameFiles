local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local CurrentRooms = Workspace:WaitForChild("CurrentRooms")

local AdminCommand = ReplicatedStorage
    :WaitForChild("RemotesFolder")
    :WaitForChild("AdminPanelRunCommand")

local function spawnNoise(room)
    local roomExit = room:WaitForChild("RoomExit", 10)

    if not roomExit or not roomExit:IsA("MeshPart") then
        warn("RoomExit MeshPart not found in room:", room.Name)
        return
    end

    local spawnPosition = roomExit.Position

    print("New room:", room.Name)
    print("Noise spawn position:", spawnPosition)

    -- Replace these arguments with the format expected by the admin remote.
    AdminCommand:FireServer("Noise", spawnPosition)
end

CurrentRooms.ChildAdded:Connect(function(room)
    task.spawn(spawnNoise, room)
end)

print("Noise auto-spawner is running!")
