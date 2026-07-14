local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local ValidKey = "cristhianv1"
local KeyLink = "https://discord.gg/8SavMc3xy"
local KeyFileName = "DGZKey.txt"

local function LoadMainMenu()
	print("Valid Key! Loading main script...")

	-- OPCION A: si tenes tu script "DGZHUB_Misc.lua" hosteado en algun lado (GitHub raw, pastefy, etc.)
	-- descomenta esta linea y ponÃ© el link:
	-- loadstring(game:HttpGet("PON_AQUI_EL_LINK_RAW_DE_TU_SCRIPT"))()

	-- OPCION B: pegÃ¡ directamente todo el contenido de tu DGZHUB_Misc.lua
	-- aca abajo, reemplazando esta linea.
end

if CoreGui:FindFirstChild("NexaKeySystem") then
	CoreGui.NexaKeySystem:Destroy()
end

local NexaKeySystem = Instance.new("ScreenGui")
NexaKeySystem.Name = "NexaKeySystem"
NexaKeySystem.Parent = CoreGui
NexaKeySystem.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 200)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Parent = NexaKeySystem

local UICorner_Main = Instance.new("UICorner")
UICorner_Main.CornerRadius = UDim.new(0, 12)
UICorner_Main.Parent = MainFrame

local UIStroke_Main = Instance.new("UIStroke")
UIStroke_Main.Transparency = 0.2
UIStroke_Main.Thickness = 2
UIStroke_Main.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_Main.Parent = MainFrame

local TitleLine = Instance.new("Frame")
TitleLine.Size = UDim2.new(0, 180, 0, 2)
TitleLine.Position = UDim2.new(0.5, -90, 0, 45)
TitleLine.BorderSizePixel = 0
TitleLine.Parent = MainFrame

task.spawn(function()
	while task.wait() do
		local hue = (tick() * 0.2) % 1
		local rainbowColor = Color3.fromHSV(hue, 1, 1)
		UIStroke_Main.Color = rainbowColor
		TitleLine.BackgroundColor3 = rainbowColor
	end
end)

local Title = Instance.new("TextLabel")
Title.Text = "DGZ HUB"
Title.Font = Enum.Font.GothamMedium
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.Parent = MainFrame

local KeyInput = Instance.new("TextBox")
KeyInput.PlaceholderText = "Enter Activation Key..."
KeyInput.Text = ""
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
KeyInput.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
KeyInput.BackgroundTransparency = 0.2
KeyInput.BorderSizePixel = 0
KeyInput.Size = UDim2.new(0, 280, 0, 40)
KeyInput.Position = UDim2.new(0.5, -140, 0, 65)
KeyInput.Parent = MainFrame
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 6)

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Text = "GET KEY"
GetKeyBtn.Font = Enum.Font.GothamMedium
GetKeyBtn.TextSize = 12
GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
GetKeyBtn.BorderSizePixel = 0
GetKeyBtn.Size = UDim2.new(0, 135, 0, 35)
GetKeyBtn.Position = UDim2.new(0.5, -140, 0, 120)
GetKeyBtn.Parent = MainFrame
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 6)

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Text = "VERIFY"
VerifyBtn.Font = Enum.Font.GothamMedium
VerifyBtn.TextSize = 12
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(220, 30, 50)
VerifyBtn.BorderSizePixel = 0
VerifyBtn.Size = UDim2.new(0, 135, 0, 35)
VerifyBtn.Position = UDim2.new(0.5, 5, 0, 120)
VerifyBtn.Parent = MainFrame
Instance.new("UICorner", VerifyBtn).CornerRadius = UDim.new(0, 6)

local StatusText = Instance.new("TextLabel")
StatusText.Text = "System: Awaiting Input"
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 12
StatusText.TextColor3 = Color3.fromRGB(160, 160, 160)
StatusText.BackgroundTransparency = 1
StatusText.Size = UDim2.new(1, 0, 0, 20)
StatusText.Position = UDim2.new(0, 0, 1, -30)
StatusText.Parent = MainFrame

VerifyBtn.MouseButton1Click:Connect(function()
	local btnTween = TweenService:Create(VerifyBtn, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(150, 20, 35)})
	btnTween:Play()
	btnTween.Completed:Wait()
	TweenService:Create(VerifyBtn, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(220, 30, 50)}):Play()

	if KeyInput.Text == ValidKey then
		StatusText.Text = "System: Key Verified! Saving Key..."
		StatusText.TextColor3 = Color3.fromRGB(50, 255, 50)

		pcall(function()
			if writefile then
				writefile(KeyFileName, ValidKey)
			end
		end)

		task.wait(1)
		MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quart, 0.4, true)
		task.wait(0.5)
		NexaKeySystem:Destroy()
		LoadMainMenu()
	else
		StatusText.Text = "System: Invalid Key!"
		StatusText.TextColor3 = Color3.fromRGB(255, 50, 50)
		KeyInput.Text = ""

		local originalPos = MainFrame.Position
		for i = 1, 6 do
			MainFrame.Position = originalPos + UDim2.new(0, math.random(-5, 5), 0, math.random(-5, 5))
			task.wait(0.05)
		end
		MainFrame.Position = originalPos

		task.wait(1.5)
		StatusText.Text = "System: Awaiting Input"
		StatusText.TextColor3 = Color3.fromRGB(160, 160, 160)
	end
end)

GetKeyBtn.MouseButton1Click:Connect(function()
	TweenService:Create(GetKeyBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(50, 50, 55)}):Play()
	task.wait(0.1)
	TweenService:Create(GetKeyBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(30, 30, 35)}):Play()

	local success = pcall(function()
		setclipboard(KeyLink)
	end)

	if success then
		StatusText.Text = "System: Discord Link copied to clipboard!"
	else
		print("Join our Discord for the Key: " .. KeyLink)
	end

	StatusText.TextColor3 = Color3.fromRGB(100, 200, 255)
	task.wait(2)
	StatusText.Text = "System: Awaiting Input"
	StatusText.TextColor3 = Color3.fromRGB(160, 160, 160)
end)
