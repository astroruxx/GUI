if game.PlaceId == 155615604 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Prison life", "DarkTheme")
    --MAIN
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Give")
    MainSection:NewDropdown("Give Gun", "Give localplayer a gun", {"M9", "Remington 870", "AK-47"}, function(v)
    local args = {[1] = workspace.Prison_ITEMS.giver:FindFirstChild(v).ITEMPICKUP}
    workspace.Remote.ItemHandler:InvokeServer(unpack(args))
end)
    MainSection:NewDropdown("Gun Mods", "Makes Gun op", {"M9", "Remington 870", "AK-47"}, function(v)
        local module = nil
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then 
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        end
           if module ~= nil then
               module["MaxAmmo"] = math.huge
               module["CurrentAmmo"] = math.huge
               module["StoredAmmo"] = math.huge
               module["AutoFire"] = true
               module["FireRate"] = 0.000001
               module["Spread"] = 0.000001
               module["Damage"] = math.huge
           end 
        end)
        MainSection:NewButton("Teleport Out", "Teleport localplayer out of prison", function() 
            for _,v in pairs(game:GetService("Workspace")["Town_ParkingLot"].Floor()) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                wait(0.2)
            end
        end)

    --PLAYER
    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Humanoid")
    --WalkSpeed
    PlayerSection:NewSlider("WalkSpeed", "Changes walkspeed of localplayer", 250, 5, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    --JumpPower
    PlayerSection:NewSlider("JumpPower", "Changes jumppower of localplayer", 250, 5, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    elseif game.PlaceId == 3956818381 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Ninja Legends", "DarkTheme")
    --MAIN
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Auto")
    MainSection:NewToggle("Auto Swing", "Make your life easier", function(v)
        getgenv().autoswing = v
        while true do
            if not getgenv().autoswing then return end
            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:FindFirstChild("ninjitsuGain") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                    break
                end
            end
            local args = {[1] = "swingKatana"}
            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))

                wait(0.1)
            end
    end)
    MainSection:NewToggle("Auto Sell", "Auto Sell at best island", function(v)
        getgenv().autosell = v
        while true do
            if getgenv().autoswing == false then return end
            game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(0.1)
            game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
            wait(0.1)
        end
    end)
    MainSection:NewToggle("Auto Buy Sword", "Auto Buy Sword", function(v)
        getgenv().autosword = v
        while true do
            if getgenv().autosword == false then return end
            local args = {
                [1] = "buyAllSwords",
                [2] = "Inner Peace Island"
            }
            
            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
    wait(0.1)            
        end
    end)
    MainSection:NewToggle("Auto Buy Belts", "Auto Buy Belts", function(v)
        getgenv().autobelt = v
        while true do
            if getgenv().autobelt == false then return end
            local args = {
                [1] = "buyAllBelts",
                [2] = "Inner Peace Island"
            }
            
            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
    wait(0.1)            
        end
    end)
MainSection:NewButton("Unlock all Islands", "Unlocks all the islands in game", function() 
    local oldcframe =  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for _,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        wait(0.2)
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
end)
MainSection:NewDropdown("Teleport To Island", "Teleport to a specific island", {"Inner Peace Island", "", "Option 3"}, function(currentOption)
    print(currentOption)
end)

    local Info = Window:NewTab("Misc")
    local Infosection = Info:NewSection("Misc")
    Infosection:NewKeybind("Choose Keybind", "Keybind to toggle ui", Enum.KeyCode.F, function()
        Library:ToggleUI()
    end)
    Infosection:NewSlider("WalkSpeed", "Changes Local Players walkspeed", 500, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    Infosection:NewSlider("JumpPower", "Changes Local Players Jumppower", 10000, 50, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
end

if game.PlaceId ~= 3956818381 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Not Supported Game", "DarkTheme")
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Not Supported")
    MainSection:NewButton("Not a Supported Game", "Check the docs for supported games", function() 
        print("Supported games at www.google.com")
    end)
end 

if game.PlaceId ~= 155615604 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Not Supported Game", "DarkTheme")
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Not Supported")
    MainSection:NewButton("Not a Supported Game", "Check the docs for supported games, In console.", function() 
        print("Supported games at www.google.com")
    end)
end 

