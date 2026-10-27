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
        warn("RoomExit MeshPart not found in room:", room.Name)
        return
    end

    -- Offset 15 studs backward from the exit's facing direction.
    local spawnPosition =
        roomExit.Position - roomExit.CFrame.LookVector * OFFSET

    print("New room:", room.Name)
    print("Noise spawn position:", spawnPosition)

    AdminCommand:FireServer("Noise", spawnPosition)
end

CurrentRooms.ChildAdded:Connect(function(room)
    task.spawn(spawnNoise, room)
end)

print("Noise auto-spawner is running!")
