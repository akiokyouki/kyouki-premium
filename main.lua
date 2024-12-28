local gameId = game.PlaceId

local games = {
    [11158043705] = "https://raw.githubusercontent.com/akiokyouki/kyouki-premium/refs/heads/main/Baddies.lua", -- Baddies
    [112564920810158] = "https://raw.githubusercontent.com/akiokyouki/kyouki-premium/refs/heads/main/Baddies.lua", -- Baddies
    [4864117649] = "", -- Untitled Tag Game
    [66654135] = "https://raw.githubusercontent.com/akiokyouki/kyouki-premium/refs/heads/main/mm2.lua" -- Murder Mystery 2
}

local function createNotification(text, notifType)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.CoreGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 60)
    frame.Position = UDim2.new(1, -320, 0.8, 0)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local iconMap = {
        success = "✅",
        error = "❌",
        warning = "⚠️",
        info = "ℹ️"
    }
    
    local icon = Instance.new("TextLabel")
    icon.Size = UDim2.new(0, 40, 1, 0)
    icon.Position = UDim2.new(0, 10, 0, 0)
    icon.BackgroundTransparency = 1
    icon.Text = iconMap[notifType] or "ℹ️"
    icon.TextSize = 25
    icon.TextXAlignment = Enum.TextXAlignment.Left
    icon.TextYAlignment = Enum.TextYAlignment.Center
    icon.Font = Enum.Font.GothamBold
    icon.TextColor3 = Color3.fromRGB(255, 255, 255)
    icon.Parent = frame
    
    local message = Instance.new("TextLabel")
    message.Size = UDim2.new(1, -60, 1, 0)
    message.Position = UDim2.new(0, 50, 0, 0)
    message.BackgroundTransparency = 1
    message.Text = text
    message.TextSize = 14
    message.TextXAlignment = Enum.TextXAlignment.Left
    message.TextYAlignment = Enum.TextYAlignment.Center
    message.Font = Enum.Font.GothamSemibold
    message.TextColor3 = Color3.fromRGB(255, 255, 255)
    message.TextWrapped = true
    message.Parent = frame
    
    frame.Position = UDim2.new(1, 0, 0.8, 0)
    local tween = game:GetService("TweenService"):Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -320, 0.8, 0)})
    tween:Play()
    
    task.delay(5, function()
        local fadeOut = game:GetService("TweenService"):Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, 0, 0.8, 0)})
        fadeOut:Play()
        fadeOut.Completed:Wait()
        screenGui:Destroy()
    end)
end

local function loadScript(url)
    local success, script = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success then
        local status, err = pcall(function() 
            loadstring(script)()
        end)
        if not status then
            createNotification("Failed to load script: " .. err, "error")
        else
            createNotification("Script loaded successfully!", "success")
        end
    else
        createNotification("Failed to fetch script from URL", "error")
    end
end

if games[gameId] then
    createNotification("Loading script for Game ID: " .. gameId, "info")
    loadScript(games[gameId])
else
    createNotification("No script available for Game ID: " .. gameId, "warning")
end


