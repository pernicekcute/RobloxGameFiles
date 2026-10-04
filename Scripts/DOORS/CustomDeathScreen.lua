-- Delta iOS Mobile Optimized Script with Custom UI & Input Validation
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")

local RemotesFolder = ReplicatedStorage:WaitForChild("RemotesFolder")
local GameStats = ReplicatedStorage:WaitForChild("GameStats")
local Player = Players.LocalPlayer

local DoorsCaptions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Captions/main/init.luau"))()

-- Determine GUI Parent (CoreGui for executors, fallback to PlayerGui)
local guiParent = Player:WaitForChild("PlayerGui")
pcall(function()
    guiParent = CoreGui
end)

-- Destroy existing UI if re-executed
if guiParent:FindFirstChild("DeathMessageConfigGui") then
    guiParent.DeathMessageConfigGui:Destroy()
end

-- Create UI Elements
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DeathMessageConfigGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = guiParent

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 340, 0, 450)
mainFrame.Position = UDim2.new(0.5, -170, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleLabel.Text = "Death Message Setup"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleLabel

-- Helper to create labels
local function createLabel(text, posY)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.9, 0, 0, 20)
    lbl.Position = UDim2.new(0.05, 0, 0, posY)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Font = Enum.Font.SourceSans
    lbl.TextSize = 14
    lbl.Parent = mainFrame
    return lbl
end

-- 1. Death Light Type Toggle Button
createLabel("Light Type (Tap to Toggle):", 50)
local selectedType = "Yellow"

local typeBtn = Instance.new("TextButton")
typeBtn.Size = UDim2.new(0.9, 0, 0, 35)
typeBtn.Position = UDim2.new(0.05, 0, 0, 75)
typeBtn.BackgroundColor3 = Color3.fromRGB(200, 170, 0)
typeBtn.Text = "Curious Light (Yellow)"
typeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
typeBtn.Font = Enum.Font.SourceSansBold
typeBtn.TextSize = 15
typeBtn.Parent = mainFrame

local typeBtnCorner = Instance.new("UICorner")
typeBtnCorner.CornerRadius = UDim.new(0, 8)
typeBtnCorner.Parent = typeBtn

typeBtn.MouseButton1Click:Connect(function()
    if selectedType == "Yellow" then
        selectedType = "Blue"
        typeBtn.Text = "Guiding Light (Blue)"
        typeBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        typeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        selectedType = "Yellow"
        typeBtn.Text = "Curious Light (Yellow)"
        typeBtn.BackgroundColor3 = Color3.fromRGB(200, 170, 0)
        typeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    end
end)

-- 2. Entity Input
createLabel("Death Entity Name:", 120)
local entityBox = Instance.new("TextBox")
entityBox.Size = UDim2.new(0.9, 0, 0, 30)
entityBox.Position = UDim2.new(0.05, 0, 0, 145)
entityBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
entityBox.TextColor3 = Color3.fromRGB(255, 255, 255)
entityBox.Text = "Elevator"
entityBox.Font = Enum.Font.SourceSans
entityBox.TextSize = 14
entityBox.Parent = mainFrame

-- 3. Custom Messages Input
createLabel("Death Messages (Use Shift+Enter or \\n for lines):", 185)
local messageBox = Instance.new("TextBox")
messageBox.Size = UDim2.new(0.9, 0, 0, 120)
messageBox.Position = UDim2.new(0.05, 0, 0, 210)
messageBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
messageBox.TextColor3 = Color3.fromRGB(255, 255, 255)
messageBox.Text = "Hello...\nI'm glad you found this place!\nAnd i'm surprised how you even got here...\nGoodbye, and I hope I see you later!..."
messageBox.Font = Enum.Font.SourceSans
messageBox.TextSize = 13
messageBox.MultiLine = true
messageBox.ClearTextOnFocus = false
messageBox.TextYAlignment = Enum.TextYAlignment.Top
messageBox.TextXAlignment = Enum.TextXAlignment.Left
messageBox.Parent = mainFrame

-- Validation Error Display
local errorLabel = Instance.new("TextLabel")
errorLabel.Size = UDim2.new(0.9, 0, 0, 20)
errorLabel.Position = UDim2.new(0.05, 0, 0, 340)
errorLabel.BackgroundTransparency = 1
errorLabel.Text = ""
errorLabel.TextColor3 = Color3.fromRGB(255, 85, 85)
errorLabel.Font = Enum.Font.SourceSansBold
errorLabel.TextSize = 13
errorLabel.Parent = mainFrame

-- 4. Confirm Button
local confirmBtn = Instance.new("TextButton")
confirmBtn.Size = UDim2.new(0.9, 0, 0, 40)
confirmBtn.Position = UDim2.new(0.05, 0, 0, 370)
confirmBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 75)
confirmBtn.Text = "Confirm & Start"
confirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmBtn.Font = Enum.Font.SourceSansBold
confirmBtn.TextSize = 16
confirmBtn.Parent = mainFrame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = confirmBtn

-- Validation & Yielding Logic
local confirmSignal = Instance.new("BindableEvent")

local function trim(s)
    return s:match("^%s*(.-)%s*$")
end

confirmBtn.MouseButton1Click:Connect(function()
    local entityText = trim(entityBox.Text)
    local messageText = trim(messageBox.Text)

    if entityText == "" then
        errorLabel.Text = "Error: Entity name cannot be empty!"
        return
    end

    if messageText == "" then
        errorLabel.Text = "Error: Death message cannot be empty!"
        return
    end

    errorLabel.Text = ""
    confirmSignal:Fire()
end)

-- Block execution until validation succeeds and Confirm is tapped
confirmSignal.Event:Wait()

-- Capture valid inputs
local deathType = selectedType
local deathEntity = trim(entityBox.Text)
local rawMessages = trim(messageBox.Text)

-- Parse lines into table
local customLines = {}
for line in string.gmatch(rawMessages, "[^\r\n]+") do
    table.insert(customLines, line)
end

-- Clean up GUI
confirmSignal:Destroy()
screenGui:Destroy()

---------------------------------------------------------
-- Execution Logic
---------------------------------------------------------

local ver = "1.0"

if deathType == "Yellow" then
    DoorsCaptions.caption("Loading - Curious Light Death Message! v" .. ver, "info", 7)
elseif deathType == "Blue" then
    DoorsCaptions.caption("Loading - Guiding Light Death Message! v" .. ver, "info", 7)
end

-- 1. Inject Death Cause
pcall(function()
    GameStats["Player_" .. Player.Name].Total.DeathCause.Value = deathEntity
end)

-- 2. Trigger Death Hint
task.spawn(function()
    firesignal(RemotesFolder.DeathHint.OnClientEvent, customLines, deathType)
end)

-- 3. Calculate wait timing based on message length (approx 3.5s per line)
local totalWaitTime = math.max(5, #customLines * 3.5)
task.wait(totalWaitTime)

-- 4. Reset Character
local character = Player.Character
if character and character:FindFirstChildOfClass("Humanoid") then
    character:FindFirstChildOfClass("Humanoid").Health = 0
else
    if character then character:BreakJoints() end
end
