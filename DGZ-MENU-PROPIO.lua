-- DGZ HUB - Menú Mejorado (Solo el menú)
local Players = game:GetService('Players')
local CoreGui = game:GetService('CoreGui')
local TweenService = game:GetService('TweenService')
local UserInputService = game:GetService('UserInputService')

local LocalPlayer = Players.LocalPlayer

-- Eliminar versiones anteriores
for _, v in pairs(CoreGui:GetChildren()) do
    if v.Name:find("DGZHub") or v.Name:find("AmbarHub") then
        v:Destroy()
    end
end

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DGZHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = CoreGui

-- === MAIN FRAME (Más cuadrado) ===
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 520)  -- Más cuadrado
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -260)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 14, 20)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 14)
Corner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 1.6
Stroke.Color = Color3.fromRGB(0, 170, 255)
Stroke.Transparency = 0.3
Stroke.Parent = MainFrame

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(8, 10, 15)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "DGZ HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Position = UDim2.new(0, 20, 0, 0)
Title.Parent = TopBar

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0.7, 0, 0.5, 0)
Subtitle.Position = UDim2.new(0, 20, 0.5, 0)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "VIP • Panel de Control"
Subtitle.TextColor3 = Color3.fromRGB(0, 200, 255)
Subtitle.TextSize = 13
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = TopBar

-- === MULTICOLOR & CAMBIAR COLOR ===
local ColorFrame = Instance.new("Frame")
ColorFrame.Name = "ColorPicker"
ColorFrame.Size = UDim2.new(0, 180, 0, 30)
ColorFrame.Position = UDim2.new(1, -190, 0, 10)
ColorFrame.BackgroundTransparency = 1
ColorFrame.Parent = TopBar

local ColorButton = Instance.new("TextButton")
ColorButton.Size = UDim2.new(1, 0, 1, 0)
ColorButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
ColorButton.Text = "🌈 Cambiar Color"
ColorButton.TextColor3 = Color3.new(1,1,1)
ColorButton.Font = Enum.Font.GothamBold
ColorButton.TextSize = 13
ColorButton.Parent = ColorFrame

local ColorCorner = Instance.new("UICorner")
ColorCorner.CornerRadius = UDim.new(0, 8)
ColorCorner.Parent = ColorButton

-- Variables de color
local CurrentHue = 0.58

-- Función para actualizar color
local function UpdateTheme(hue)
    local newColor = Color3.fromHSV(hue, 0.85, 1)
    Stroke.Color = newColor
    ColorButton.BackgroundColor3 = newColor
end

-- Rainbow Mode
local rainbowEnabled = false

ColorButton.MouseButton1Click:Connect(function()
    rainbowEnabled = not rainbowEnabled
    if rainbowEnabled then
        ColorButton.Text = "🌈 Detener Rainbow"
        spawn(function()
            while rainbowEnabled do
                CurrentHue = (CurrentHue + 0.007) % 1
                UpdateTheme(CurrentHue)
                task.wait(0.025)
            end
            ColorButton.Text = "🌈 Cambiar Color"
        end)
    else
        ColorButton.Text = "🌈 Cambiar Color"
    end
end)

-- Drag functionality
local dragging = false
local dragInput
local dragStart
local startPos

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input == dragInput) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Cerrar botón
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -38, 0, 10)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
CloseBtn.TextSize = 20
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TopBar

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("✅ DGZ HUB cargado correctamente")
