local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🔫 Rivals Script 🔫",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "👑 KJxHub 👑",
   LoadingSubtitle = "by KJ",
   Theme = "Viow Arabian Mix", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   local EspLib = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/x114/RobloxScripts/main/OpenSourceEsp"))()

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "KJx Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Rivals | Key",
      Subtitle = "Key System",
      Note = "Key:https://pastebin.com/raw/ZwcdizdA", -- Use this to tell the user how to get a key
      FileName = "HubKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/ZwcdizdA"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🔫🔫 Aimbot", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

local Esp = {
    ESP = false,
}

Rayfield:Notify({
   Title = "Excuted Successfully",
   Content = "Very cool gui",
   Duration = 5,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Aimbot",
   Callback = function()      
          
   end,
})

local EspTab = Window:CreateTab("Esp", nil) -- Title, Image


--// Esp Setup
EspLib.Box = false
EspLib.BoxColor = Color3.fromRGB(255,255,255)
EspLib.BoxOutline = false
EspLib.BoxOutlineColor = Color3.fromRGB(0,0,0)
EspLib.HealthBar = false
EspLib.HealthBarSide = "Left"
EspLib.Names = false
EspLib.NamesColor = Color3.fromRGB(255,255,255)
EspLib.NamesOutline = true
EspLib.NamesFont = 2
EspLib.NamesSize = 17

--// Esp
local EspSection = EspTab:CreateSection("Esp")
local Toggle = EspTab:CreateToggle({
    Name = "Enabled",
    CurrentValue = false,
    Flag = "EspToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        EspLib.Box = value
    end,
 })
 local ColorPicker = EspTab:CreateColorPicker({
    Name = "Color",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ColorToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        EspLib.BoxColor = value
        EspLib.NameColor = value
    end
})

local Toggle = EspTab:CreateToggle({
    Name = "Health Bar",
    CurrentValue = false,
    Flag = "HealthBarToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    EspLib.HealthBar = value
    end,
 })

    local Dropdown = EspTab:CreateDropdown({
        Name = "Health Bar Position",
        Options = {"Left","Bottom", "Right"},
        CurrentOption = {"Left"},
        MultipleOptions = false,
        Flag = "HealthBarPostition", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Options)
            HealthBarPosDropdown:OnChanged(function(value)
                EspLib.HealthBarSide = value
        end,
     })

local Toggle = EspTab:CreateToggle({
    Name = "Names",
    CurrentValue = false,
    Flag = "NamesToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    EspLib.Names = value
    end,
 })
