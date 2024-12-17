--// Services
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

--// Libraries
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local EspLib = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/x114/RobloxScripts/main/OpenSourceEsp"))()

--// Window Configuration
local Window = Rayfield:CreateWindow({
   Name = "🔫 Rivals Script 🔫",
   Icon = 0,
   LoadingTitle = "👑 KJxHub 👑",
   LoadingSubtitle = "by KJ",
   Theme = "Green",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "KJx Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Rivals | Key",
      Subtitle = "Key System",
      Note = "Key: https://pastebin.com/raw/ZwcdizdA",
      FileName = "HubKey",
      SaveKey = false,
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/ZwcdizdA"}
   }
})

--// AimLock Configuration
local AimLock = {
    Enabled = false,
    Prediction = 0.1,
    Holding = false,
    AimPart = "Head"
}

--// SilentAim Configuration
local SilentAim = {
    Enabled = false,
    HitChance = 100,
    AimPart = {"HumanoidRootPart"},
    WallCheck = false,
    Keybind = "T",
    NotWorkIfFlashed = false
}

--// Drawing FOV
local SilentAimFov = Drawing.new("Circle")
SilentAimFov.Filled = false
SilentAimFov.Transparency = 1
SilentAimFov.Thickness = 1
SilentAimFov.Color = Color3.fromRGB(255, 0, 0)
SilentAimFov.NumSides = 1000
SilentAimFov.Radius = 60
SilentAimFov.Visible = false

--// Functions
function GetClosestPlayerToMouse(vis, radius)
    local closestPlayer = nil
    local shortestDistance = math.huge
    local mousePosition = UIS:GetMouseLocation()

    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game:GetService("Players").LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local hrpPosition, onScreen = workspace.CurrentCamera:WorldToViewportPoint(hrp.Position)
                if onScreen and player.Character.Humanoid.Health > 0 then
                    local distance = (Vector2.new(hrpPosition.X, hrpPosition.Y) - mousePosition).Magnitude
                    if vis and distance <= radius then
                        closestPlayer = player
                        shortestDistance = distance
                    elseif not vis and distance < shortestDistance then
                        closestPlayer = player
                        shortestDistance = distance
                    end
                end
            end
        end
    end

    return closestPlayer
end

function LookAt(target)
    if target then
        workspace.CurrentCamera.CFrame = CFrame.lookAt(
            workspace.CurrentCamera.CFrame.Position,
            target.Position
        )
    end
end

--// UI Elements
local MainTab = Window:CreateTab("🔫🔫 Aimbot", nil)
local MainSection = MainTab:CreateSection("Main")

MainTab:CreateToggle({
    Name = "Silent Aim",
    CurrentValue = false,
    Flag = "SilentAimToggle",
    Callback = function(Value)
        SilentAim.Enabled = Value
    end
})

MainTab:CreateSlider({
    Name = "FOV Radius",
    Range = {0, 1000},
    Increment = 10,
    CurrentValue = 60,
    Flag = "FovRadius",
    Callback = function(Value)
        SilentAimFov.Radius = Value
    end
})

MainTab:CreateColorPicker({
    Name = "FOV Color",
    Color = Color3.fromRGB(255, 0, 0),
    Flag = "FovColor",
    Callback = function(Value)
        SilentAimFov.Color = Value
    end
})

--// ESP Tab
local EspTab = Window:CreateTab("ESP", nil)
local EspSection = EspTab:CreateSection("ESP Settings")

EspTab:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Flag = "EspToggle",
    Callback = function(Value)
        EspLib.Box = Value
    end
})

EspTab:CreateColorPicker({
    Name = "ESP Box Color",
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "EspBoxColor",
    Callback = function(Value)
        EspLib.BoxColor = Value
    end
})

--// Notify on Execution
Rayfield:Notify({
    Title = "Script Loaded",
    Content = "Rivals Script Loaded Successfully!",
    Duration = 5
})
