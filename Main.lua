
------------------------------------------------------------------------

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Winny x Hub", "BloodTheme")

------------------------------------------------------------------------

local Tab = Window:NewTab("credit")

local Section = Tab:NewSection("Project it Test")

Section:NewLabel("Script it Made By Winny Exe")

Section:NewLabel("FB : Winny Exe")

Section:NewLabel("Email : winny.th.ch@gmail.com")

local Section = Tab:NewSection("Script")

Section:NewButton("Dark Dex", "Click Me To Open Dark Dex", function()

    loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()

end)

Section:NewButton("Fly Mobile", "Click Me To Open Fly Mobile", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/ArceusX-V3-Scripts/main/ArceusX-Fly.lua"))()

end)

Section:NewButton("Aimbot", "Click Me To Oper Aimbot", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/ArceusX-V3-Scripts/main/ArceusX-Aimbot.lua"))()

end)

------------------------------------------------------------------------

local Tab = Window:NewTab("AutoFarm")

------------------------------------------------------------------------

local Section = Tab:NewSection("Auto Equip")

local Weaponlist = {}

local Weapon = nil

for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do

    table.insert(Weaponlist,v.Name)

end

Section:NewDropdown("select weapon", " ", Weaponlist, function(currentOption)

    Weapon = currentOption

end)

Section:NewToggle("Auto Equip", " ", function(a)

AutoEquiped = a

end)

spawn(function()

while wait() do

if AutoEquiped then

pcall(function()

game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Weapon))

end)

end

end

end)

------------------------------------------------------------------------

local Section = Tab:NewSection("AutoFarmlevel")

------------------------------------------------------------------------

local Section = Tab:NewSection("AutoFarmBoos")

------------------------------------------------------------------------

local Tab = Window:NewTab("main1")

------------------------------------------------------------------------

local Tab = Window:NewTab("main2")

------------------------------------------------------------------------

local Tab = Window:NewTab("teleport")

------------------------------------------------------------------------

local Section = Tab:NewSection("teleport to player")

players = {}

 

for i,v in pairs(game:GetService("Players"):GetChildren()) do

   table.insert(players,v.Name)

end

 

Section:NewDropdown("Select Player", " ", players, function(abc)

    Select = abc

end)

 

 

Section:NewButton("Refresh", " ", function()

    table.clear(players)

for i,v in pairs(game:GetService("Players"):GetChildren()) do

   table.insert(players,v.Name)

end

end)

 

Section:NewButton("Teleport", " ", function()

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Select].Character.HumanoidRootPart.CFrame

end)

------------------------------------------------------------------------

local Tab = Window:NewTab("setting")

------------------------------------------------------------------------

local Section = Tab:NewSection("Speed & Jump")

Section:NewTextBox("WalkSpeed", "Increases walk speed", function(value)

    local newWalkSpeed = tonumber(value)

    if newWalkSpeed then

        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = newWalkSpeed

    end

end)

Section:NewTextBox("JumpPower", "Increases jump power", function(value)

    local newJumpPower = tonumber(value)

    if newJumpPower then

        game.Players.LocalPlayer.Character.Humanoid.JumpPower = newJumpPower

    end

end)

Section:NewButton("Reset", "Resets walk speed and jump power", function()

    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16

    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50

end)

local Section = Tab:NewSection("Server")

Section:NewButton("Rejoin Server", "Click Me To Rejoin Server", function()

    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Rejoin-Game/main/Rejoin%20Game.lua"))()

end)

Section:NewButton("Hop Server", "Click Me To Hop Server", function()

    loadstring(game:HttpGet("https://pastebin.com/raw/VduBT2nt"))()

end)

------------------------------------------------------------------------

local Tab = Window:NewTab("combat")

------------------------------------------------------------------------

local Tab = Window:NewTab("ESP")

------------------------------------------------------------------------

local Section = Tab:NewSection("EspPlayer")

------------------------------------------------------------------------

local spToggle = Section:NewToggle("EspPlayer", "EspPlayer", function(state)

    if state then

        for _, v in pairs(game.Players:GetChildren()) do

            if v.Character and not v.Character.Head:FindFirstChild("ESP") then

                local BillboardGui = Instance.new("BillboardGui")

                local TextLabel = Instance.new("TextLabel")

                BillboardGui.Parent = v.Character.Head

                BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

                BillboardGui.Active = true

                BillboardGui.Name = "ESP"

                BillboardGui.AlwaysOnTop = true

                BillboardGui.LightInfluence = 1.000

                BillboardGui.Size = UDim2.new(0, 200, 0, 50)

                BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)

                TextLabel.Parent = BillboardGui

                TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

                TextLabel.BackgroundTransparency = 1.000

                TextLabel.Size = UDim2.new(0, 200, 0, 50)

                TextLabel.Font = Enum.Font.GothamBold

                TextLabel.Text = v.Name

                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

                TextLabel.TextScaled = true

                TextLabel.TextSize = 14.000

                TextLabel.TextStrokeTransparency = 0.000

                TextLabel.TextWrapped = true

            end

        end

    else

        for _, v in pairs(game.Players:GetChildren()) do

            if v.Character and v.Character.Head:FindFirstChild("ESP") then

                v.Character.Head.ESP:Destroy()

            end

        end

    end

end)

local UiToggle = Window:NewToggle("UI", "UI", function(state)

    for _, v in pairs(game.Players:GetChildren()) do

        if v.Character and v.Character.Head:FindFirstChild("ESP") then

            v.Character.Head.ESP.BillboardGui.Enabled = state

        end

    end

end)

local ToggleHotkey = "u"

local ToggleHotkeyEnabled = true

local InputConnection

InputConnection = game:GetService("UserInputService").InputBegan:Connect(function(input)

    if input.KeyCode == Enum.KeyCode[ToggleHotkey] and ToggleHotkeyEnabled then

        UiToggle:SetState(not UiToggle:GetState())

        EspToggle:SetState(not EspToggle:GetState())

    end

end)

function StopScript()

    InputConnection:Disconnect()

    UiToggle:SetState(false)

    EspToggle:SetState(false)

    for _, v in pairs(game.Players:GetChildren()) do

        if v.Character and v.Character.Head:FindFirstChild("ESP") then

            v.Character.Head.ESP:Destroy()

        end

    end

end
