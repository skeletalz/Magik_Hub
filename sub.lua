-- UI Elements
    local library = loadstring(game:HttpGet("https://oneshot.wtf/ApexHub/Scripts/Universal/NewUiLib.lua"))("Timber!")
    local Automatic     = library:Row("Automatic")
        local Autofarm  =    Automatic:Category("Autofarm")
        local Autobuy   =    Automatic:Category("Autobuy")
    local Character     = library:Row("Character")
        local Humanoid  =    Character:Category("Humanoid")
    local Credits       = library:Row("Credits")
        local UICredits =    Credits:Category("UI Credits")
        local CodeCreds =    Credits:Category("Code Credits")
-- UI Table
    getgenv().Apex = {
        Automatic = {
            Tree = "Any",
            AutoTree = false,
            AutoSell = false,
            SellAtNum = 250,
            AutoBigTree=false,
            BigTree  = "1",
            Missions = false,
            AutoExpd = false,
            Upgrades = {
                ['AxeStrength'] = false,
                ['Speed'] = false,
                ['TreeGrowth'] = false,
                ['GoldenChance'] = false, 
                ['WCount'] = false,
                ['WStrength'] = false,
                ['WSpeed'] = false,
                ['WLogs'] = false,
                ['RSpeed'] = false
            }
        },
        Character = {
            TpSpeed = 360,
        },
    }
    if not isfolder("ApexHub") then
        makefolder("ApexHub")
    end
    if not isfile("ApexHub/Timber.json") then
        writefile("ApexHub/Timber.json",game:GetService("HttpService"):JSONEncode(getgenv().Apex))
    end
    if isfile("ApexHub/Timber.json") then
        local file = readfile("ApexHub/Timber.json")
        local decrypt = game:GetService("HttpService"):JSONDecode(file)
        getgenv().Apex = decrypt
    end
    function savesettings()
        local encrypt = game:GetService("HttpService"):JSONEncode(getgenv().Apex)
        writefile("ApexHub/Timber.json",encrypt)
    end
-- Variables
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    game.Players.LocalPlayer.CharacterAdded:Connect(function()
        char = game.Players.LocalPlayer.Character
        hrp = char:WaitForChild("HumanoidRootPart")
    end)
    function tp(l)
        --char.Humanoid:ChangeState(11)
        workspace.CurrentCamera.CameraType = "Fixed"
        hrp.Velocity = Vector3.new(450,450,450)
        hrp.RotVelocity = Vector3.new(450,450,450)
        wait(0.02)
        hrp.RotVelocity=Vector3.new(0,0,0)
        hrp.Velocity=Vector3.new(0,0,0) 
        hrp.CFrame=l
        workspace.CurrentCamera.CameraType = "Custom"
        --char.Humanoid:ChangeState(18)
        spawn(function() repeat hrp.Anchored=false hrp.RotVelocity=Vector3.new(0,0,0)
        hrp.Velocity=Vector3.new(0,0,0) until wait(0.5) end)
        wait(0.25) -- server replication
    end
-- CAT Elements
    -- Autofarm
        Autofarm:Label("Auto Chop Trees")
        --Autofarm:Dropdown("Tree Target",getgenv().Apex.Automatic.Tree,{"Tree_1","Tree_2","Tree_3","Any"},function(e)getgenv().Apex.Automatic.Tree=e;savesettings();end)
        Autofarm:Toggle("Auto Tree",getgenv().Apex.Automatic.AutoTree,function(e)getgenv().Apex.Automatic.AutoTree=e;savesettings();end)
        --Autofarm:Label("Auto Sell")
        --Autofarm:Slider("Sell At",10,getgenv().Apex.Automatic.SellAtNum,2500,false," Logs",function(e)getgenv().Apex.Automatic.SellAtNum=e;savesettings();end)
        Autofarm:Toggle("Auto Sell",getgenv().Apex.Automatic.AutoSell,function(e)getgenv().Apex.Automatic.AutoSell=e;savesettings();end)
        Autofarm:Label("Big Tree")
        Autofarm:Slider("Tree Target",1,tonumber(getgenv().Apex.Automatic.BigTree),3,false,"",function(e)getgenv().Apex.Automatic.BigTree = tostring(e);savesettings();end)
        Autofarm:Toggle("Farm Big Tree",getgenv().Apex.Automatic.AutoBigTree,function(e)getgenv().Apex.Automatic.AutoBigTree=e;savesettings();end)
    -- Autobuy
        Autobuy:Label("Auto Buy Upgrades")
        Autobuy:Toggle("Axe Strength",getgenv().Apex.Automatic.Upgrades.AxeStrength,function(e)getgenv().Apex.Automatic.Upgrades.AxeStrength=e;savesettings();end)
        Autobuy:Toggle("Plr Speed",getgenv().Apex.Automatic.Upgrades.Speed,function(e)getgenv().Apex.Automatic.Upgrades.Speed=e;savesettings();end)
        Autobuy:Toggle("Tree Growth",getgenv().Apex.Automatic.Upgrades.TreeGrowth,function(e)getgenv().Apex.Automatic.Upgrades.TreeGrowth=e;end)
        Autobuy:Toggle("Gold Tree Chance",getgenv().Apex.Automatic.Upgrades.GoldenChance,function(e)getgenv().Apex.Automatic.Upgrades.GoldenChance=e;savesettings();end)
        Autobuy:Toggle("More Workers",getgenv().Apex.Automatic.Upgrades.WCount,function(e)getgenv().Apex.Automatic.Upgrades.WCount=e;savesettings();end)
        Autobuy:Toggle("Worker Strength",getgenv().Apex.Automatic.Upgrades.WStrength,function(e)getgenv().Apex.Automatic.Upgrades.WStrength=e;savesettings();end)
        Autobuy:Toggle("Worker Speed",getgenv().Apex.Automatic.Upgrades.WSpeed,function(e)getgenv().Apex.Automatic.Upgrades.WSpeed=e;savesettings();end)
        Autobuy:Toggle("Worker Backpack",getgenv().Apex.Automatic.Upgrades.WLogs,function(e)getgenv().Apex.Automatic.Upgrades.WLogs=e;savesettings();end)
        Autobuy:Toggle("Raft Speed",getgenv().Apex.Automatic.Upgrades.RSpeed,function(e)getgenv().Apex.Automatic.Upgrades.RSpeed=e;savesettings();end)
        Autobuy:Label("Auto Buy Expansion")
        Autobuy:Toggle("Auto Expand",getgenv().Apex.Automatic.AutoExpd,function(e)getgenv().Apex.Automatic.AutoExpd=e;savesettings();end)
    -- Character
        Humanoid:Button("Tp to Main Island",function()tp(game:GetService("Workspace").TreeIslands['1'].MegaTree.Base.CFrame+Vector3.new(0,0,3))end)
        Humanoid:Button("Tp to Volcano Island",function()tp(game:GetService("Workspace").TreeIslands['2'].MegaTree.Base.CFrame)end)
        Humanoid:Button("Tp to Skull Island",function()tp(game:GetService("Workspace").TreeIslands['3'].MegaTree.Base.CFrame)end)
    -- Credits
        UICredits:Label("UI: Hexagon Remake (By Bird)")
        CodeCreds:Label("Script By: Bird")
        CodeCreds:Button("Copy Apex Hub Invite",function()
            setclipboard("https://discord.gg/dAkNaPXK")
        end)
-- Functions


local runServ = game:GetService("RunService")
local player = game:GetService("Players").LocalPlayer
local remStorage = game:GetService("ReplicatedStorage").Communication.Remotes 
local HitTree = remStorage.HitTree 
local containsTrees = {}
local searched = {}
local notselling = true
local notbigtree = true
local plotspaces = {
    "-4_-4", "-3_-4", "-2_-4", "-1_-4", "0_-4",
    "-4_-3", "-3_-3", "-2_-3", "-1_-3", "0_-3",
    "-4_-2", "-3_-2", "-2_-2", "-1_-2", "0_-2",
    "-4_-1", "-3_-1", "-2_-1", "-1_-1", "0_-1",
    "-4_0", "-3_0", "-2_0", "-1_0", "0_0",
    "-4_1", "-3_1", "-2_1", "-1_1", "0_1",
    "-4_2", "-3_2", "-2_2", "-1_2", "0_2",
    "-4_3", "-3_3", "-2_3", "-1_3", "0_3",
    "-4_4", "-3_4", "-2_4", "-1_4", "0_4",
     "4_-4", "3_-4", "2_-4", "1_-4", 
    "4_-3", "3_-3", "2_-3", "1_-3", 
    "4_-2", "3_-2", "2_-2", "1_-2", 
    "4_-1", "3_-1", "2_-1", "1_-1", 
    "4_0", "3_0", "2_0", "1_0", 
    "4_1", "3_1", "2_1", "1_1", 
    "4_2", "3_2", "2_2", "1_2", 
    "4_3", "3_3", "2_3", "1_3", 
    "4_4", "3_4", "2_4", "1_4", 
}
function getPlot()
    for i , v in pairs(workspace.Plots:GetChildren()) do 
        if v:FindFirstChild("Owner") and v.Owner.Value == player then 
            return v 
        end 
    end
end
local plot = getPlot()

-- check if already searched for trees
function hasSearched(v) 
    for i2,v2 in pairs(containsTrees) do 
        if v2.Name == v.Name then 
            return true 
        end 
    end    
    return false
end

function getnearest(tbl)
    local nearest = nil
    local dist = 1000000
    for i,tbl in pairs(plot:GetChildren()) do
    for i,v in pairs(tbl:GetChildren()) do
        if string.match(v.Name,"Tree") then
        if (hrp.CFrame.p-v.Base.CFrame.p).Magnitude < dist then
            dist = (hrp.CFrame.p-v.Base.CFrame.p).Magnitude
            nearest = v
        end
        end
    end
    end
    return nearest;
end

-- grab trees with timber
local counter = 15
-- main loop
spawn(function()
    while true do 
        runServ.Heartbeat:wait()
            local upgrades = getgenv().Apex.Automatic.Upgrades
            for i , v in pairs(upgrades) do 
                if v then 
                    remStorage.Upgrade:FireServer(i)
                end
            end
        
    end
end)
spawn(function()
    while wait(0.5) do
        counter = counter -1
        if counter <= -5 then
            counter=15
        end
    end
end)
spawn(function() while wait() do
            if getgenv().Apex.Automatic.AutoExpd then 
                for i,v in pairs(plotspaces) do if getgenv().Apex.Automatic.AutoExpd and plot:FindFirstChild(v) == nil then 
                    runServ.Heartbeat:wait()
                    game.ReplicatedStorage.Communication.Remotes['ExpandIsland']:FireServer(v)
                end end
            end end
        end)
spawn(function()
    while wait() do pcall(function()
        if getgenv().Apex.Automatic.AutoTree  then
                
                    local near = getnearest()
                        if near then
                        local treeNum = tonumber(string.split(near.Name,"_")[2])
                        if near.Name == getgenv().Apex.Automatic.Tree or (getgenv().Apex.Automatic.Tree == "Any" and  string.find(near.Name,"Tree_")) then
                            
                                repeat 
                                    runServ.Heartbeat:wait()
                                    if notselling and notbigtree and (near.Name == getgenv().Apex.Automatic.Tree or getgenv().Apex.Automatic.Tree == "Any") then
                                        runServ.Heartbeat:wait()   
                                        if near.Parent == nil or getgenv().Apex.Automatic.AutoTree==false then 
                                            break
                                        else
                                            runServ.Heartbeat:wait()
                                            
                                            repeat
                                                
                                                if near.Parent ~= nil and treeNum ~= nil and near.Base ~= nil then
                                                    
                                                    
                                                    repeat
                                                        if near.Parent.Name and treeNum then
                                                            tp(near.Base.CFrame) 
                                                            if counter <= 0 then wait(2.5) end
                                                            HitTree:FireServer(tonumber(plot.Name),near.Parent.Name,treeNum)
                                                            
                                                        else
                                                            break
                                                        end
                                                    until near.Parent == nil or treeNum == nil
                                                else
                                                    break
                                                end
                                            until near.Parent == nil or treeNum == nil 
                                        end
                                    end
                                until near.Parent == nil or getgenv().Apex.Automatic.AutoTree==false 
                        end
                    end
                
            end end)
    end
end)
spawn(function()
while wait() do
 pcall(function()
            if getgenv().Apex.Automatic.AutoSell then 
                if player.leaderstats.Logs.Value >= 250 and notbigtree then 
                    repeat 
                        runServ.Heartbeat:wait()
                        notselling = false
                        tp(plot['0_0']['Sell'].CFrame + Vector3.new(0,2.5,0))
                        wait(0.3)
                        tp(plot['0_0']['Sell'].CFrame + Vector3.new(0,2.5,3))
                        wait(0.3)
                    until player.leaderstats.Logs.Value == 0 
                    notselling=true
                end
            end
        end) 
end
end)
spawn(function()
    while wait() do
        if getgenv().Apex.Automatic.AutoBigTree then
            if workspace.TreeIslands[getgenv().Apex.Automatic.BigTree].MegaTree.Base.Transparency == 0 then
                repeat
                    notbigtree = false
                        tp(game:GetService("Workspace").TreeIslands[getgenv().Apex.Automatic.BigTree].MegaTree.Base.CFrame-Vector3.new(3,3,3))
                    game.ReplicatedStorage.Communication.Remotes['HitMegaTree']:FireServer(tonumber(getgenv().Apex.Automatic.BigTree))
                until workspace.TreeIslands[getgenv().Apex.Automatic.BigTree].MegaTree.Base.Transparency == 1 or getgenv().Apex.Automatic.AutoBigTree == false
                notbigtree = true
            end
        end
    end
end)
