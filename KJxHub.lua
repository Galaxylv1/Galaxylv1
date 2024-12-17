local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local EspLib = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/x114/RobloxScripts/main/OpenSourceEsp"))()
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local Window = Rayfield:CreateWindow({
   Name = "🔫 Rivals Script 🔫",
   Icon = 0,
   LoadingTitle = "👑 KJxHub 👑",
   LoadingSubtitle = "by KJ",
   Theme = "Viow Arabian Mix",

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

local AimLock = {
    Enabled = false,
    Prediction = 0.1,
    Holding = false,
    AimPart = "Head"
}

local SilentAim = {
    Enabled = false,
    HitChance = 100,
    AimPart = {"HumanoidRootPart"},
    WallCheck = false,
    Keybind = "T",
    NotWorkIfFlashed = false
}

-- Drawing FOV
local AimLockFov = Drawing.new("Circle")
AimLockFov.Filled = false
AimLockFov.Transparency = 1
AimLockFov.Thickness = 1
AimLockFov.Color = Color3.fromRGB(0, 0, 255)
AimLockFov.NumSides = 1000
AimLockFov.Radius = 70
AimLockFov.Visible = false

local SilentAimFov = Drawing.new("Circle")
SilentAimFov.Filled = false
SilentAimFov.Transparency = 1
SilentAimFov.Thickness = 1
SilentAimFov.Color = Color3.fromRGB(255, 0, 0)
SilentAimFov.NumSides = 1000
SilentAimFov.Radius = 60
SilentAimFov.Visible = false

-- MainTab
local MainTab = Window:CreateTab("🔫🔫 Aimbot", nil)
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Executed Successfully",
   Content = "Very cool GUI",
   Duration = 5,
   Image = nil,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function()
            print("The user tapped Okay!")
         end
      }
   }
})

local Toggle = MainTab:CreateToggle({
    Name = "Silent Aim",
    CurrentValue = false,
    Flag = "SilentAimToggle",
    Callback = function(Value)
        SilentAim.Enabled = Value
    end
})

local Keybind = MainTab:CreateKeybind({
    Name = "Silent Aim Keybind",
    CurrentKeybind = "X",
    HoldToInteract = false,
    Flag = "SilentAimKeybind",
    Callback = function(Keybind)
        SilentAim.Enabled = not SilentAim.Enabled
        print("Silent Aim Enabled:", SilentAim.Enabled)
    end
})

local ToggleFov = MainTab:CreateToggle({
    Name = "FOV Enabled",
    CurrentValue = false,
    Flag = "SilentAimFovToggle",
    Callback = function(Value)
        SilentAimFov.Visible = Value
        while Value do
            SilentAimFov.Position = UIS:GetMouseLocation()
            task.wait()
        end
    end
})

local FovSlider = MainTab:CreateSlider({
    Name = "FOV Radius",
    Range = {0, 1000},
    Increment = 10,
    Suffix = "px",
    CurrentValue = 60,
    Flag = "FovRadius",
    Callback = function(Value)
        SilentAimFov.Radius = Value
    end
})

local ColorPicker = MainTab:CreateColorPicker({
    Name = "FOV Color",
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "FovColor",
    Callback = function(Value)
        SilentAimFov.Color = Value
    end
})

local HitChanceSlider = MainTab:CreateSlider({
    Name = "Hit Chance",
    Range = {0, 100},
    Increment = 10,
    Suffix = "%",
    CurrentValue = 100,
    Flag = "HitChance",
    Callback = function(Value)
        SilentAim.HitChance = Value
    end
})

local AimPartsDropdown = MainTab:CreateDropdown({
    Name = "Aim Parts",
    Options = {"HumanoidRootPart", "Head", "RightUpperArm", "LeftUpperArm", "RightLowerLeg", "LeftLowerLeg"},
    CurrentOption = {"HumanoidRootPart"},
    MultipleOptions = true,
    Flag = "AimParts",
    Callback = function(Options)
        SilentAim.AimPart = Options
    end
})

-- EspTab
local EspTab = Window:CreateTab("Esp", nil)
local EspSection = EspTab:CreateSection("Esp")

local EspToggle = EspTab:CreateToggle({
    Name = "Enabled",
    CurrentValue = false,
    Flag = "EspToggle",
    Callback = function(Value)
        EspLib.Box = Value
    end
})

local ColorPickerEsp = EspTab:CreateColorPicker({
    Name = "ESP Color",
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "EspColor",
    Callback = function(Value)
        EspLib.BoxColor = Value
        EspLib.NamesColor = Value
    end
})

local HealthBarToggle = EspTab:CreateToggle({
    Name = "Health Bar",
    CurrentValue = false,
    Flag = "HealthBarToggle",
    Callback = function(Value)
        EspLib.HealthBar = Value
    end
})

local HealthBarDropdown = EspTab:CreateDropdown({
    Name = "Health Bar Position",
    Options = {"Left", "Bottom", "Right"},
    CurrentOption = {"Left"},
    MultipleOptions = false,
    Flag = "HealthBarPosition",
    Callback = function(Option)
        EspLib.HealthBarSide = Option[1]
    end
})

local NamesToggle = EspTab:CreateToggle({
    Name = "Names",
    CurrentValue = false,
    Flag = "NamesToggle",
    Callback = function(Value)
        EspLib.Names = Value
    end
})
