-- 🍉 BLACK WATERMELON NPC TELEPORT MENU (UPGRADED)
-- Đặt LocalScript này vào StarterGui

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "BlackWatermelonNPCMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- =========================
-- MENU CHÍNH
-- =========================
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 340, 0, 480)
frame.Position = UDim2.new(0.5, -170, 0.5, -240)
frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(70, 70, 70)
stroke.Thickness = 1.5
stroke.Parent = frame

-- =========================
-- TITLE BAR
-- =========================
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 48)
titleBar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
titleBar.BorderSizePixel = 0
titleBar.Parent = frame

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 16)
titleBarCorner.Parent = titleBar

-- Fix corner dưới của titleBar
local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 16)
titleFix.Position = UDim2.new(0, 0, 1, -16)
titleFix.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🍉 BLACK WATERMELON"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- Nút Minimize
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 32, 0, 32)
minimizeBtn.Position = UDim2.new(1, -75, 0.5, -16)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
minimizeBtn.Text = "–"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.TextSize = 20
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Parent = titleBar

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 8)
minCorner.Parent = minimizeBtn

-- Nút Close
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -38, 0.5, -16)
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 22
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 0
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

-- =========================
-- SEARCH BOX
-- =========================
local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -30, 0, 36)
searchBox.Position = UDim2.new(0, 15, 0, 60)
searchBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
searchBox.Text = ""
searchBox.PlaceholderText = "🔍  Tìm NPC..."
searchBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.TextSize = 14
searchBox.Font = Enum.Font.Gotham
searchBox.ClearTextOnFocus = false
searchBox.BorderSizePixel = 0
searchBox.Parent = frame

local searchCorner = Instance.new("UICorner")
searchCorner.CornerRadius = UDim.new(0, 10)
searchCorner.Parent = searchBox

local searchPadding = Instance.new("UIPadding")
searchPadding.PaddingLeft = UDim.new(0, 12)
searchPadding.Parent = searchBox

-- =========================
-- DANH SÁCH
-- =========================
local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, -30, 0, 280)
list.Position = UDim2.new(0, 15, 0, 110)
list.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
list.BorderSizePixel = 0
list.ScrollBarThickness = 4
list.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
list.CanvasSize = UDim2.new(0, 0, 0, 0)
list.Parent = frame

local listCorner = Instance.new("UICorner")
listCorner.CornerRadius = UDim.new(0, 12)
listCorner.Parent = list

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 6)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = list

-- =========================
-- BOTTOM
-- =========================
local refresh = Instance.new("TextButton")
refresh.Size = UDim2.new(1, -30, 0, 40)
refresh.Position = UDim2.new(0, 15, 0, 405)
refresh.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
refresh.Text = "🔄  QUÉT LẠI NPC"
refresh.TextColor3 = Color3.fromRGB(255, 255, 255)
refresh.TextSize = 15
refresh.Font = Enum.Font.GothamBold
refresh.BorderSizePixel = 0
refresh.Parent = frame

local refreshCorner = Instance.new("UICorner")
refreshCorner.CornerRadius = UDim.new(0, 10)
refreshCorner.Parent = refresh

local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, -30, 0, 22)
infoLabel.Position = UDim2.new(0, 15, 0, 450)
infoLabel.BackgroundTransparency = 1
infoLabel.Text = "Nhấn K để ẩn/hiện menu"
infoLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
infoLabel.TextSize = 12
infoLabel.Font = Enum.Font.Gotham
infoLabel.Parent = frame

-- =========================
-- BIẾN
-- =========================
local selectedNPC = nil
local isMinimized = false
local originalSize = frame.Size
local npcButtons = {} -- lưu button để filter

-- =========================
-- HÀM
-- =========================
local function isNPC(model)
	if not model:IsA("Model") then return false end

	local humanoid = model:FindFirstChildOfClass("Humanoid")
	local root = model:FindFirstChild("HumanoidRootPart")
	if not humanoid or not root then return false end
	if Players:GetPlayerFromCharacter(model) then return false end
	if humanoid.Health <= 0 then return false end

	return true
end

local function getDistance(npc)
	local character = player.Character
	if not character then return 99999 end

	local playerRoot = character:FindFirstChild("HumanoidRootPart")
	local npcRoot = npc:FindFirstChild("HumanoidRootPart")

	if playerRoot and npcRoot then
		return math.floor((playerRoot.Position - npcRoot.Position).Magnitude)
	end
	return 99999
end

local function clearList()
	for _, child in ipairs(list:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end
	npcButtons = {}
end

local function teleportToNPC(npc)
	if not npc or not npc.Parent then return end

	local character = player.Character
	if not character then return end

	local playerRoot = character:FindFirstChild("HumanoidRootPart")
	local npcRoot = npc:FindFirstChild("HumanoidRootPart")

	if playerRoot and npcRoot then
		playerRoot.CFrame = npcRoot.CFrame * CFrame.new(0, 0, 4)
		infoLabel.Text = "✅ Đã dịch chuyển đến: " .. npc.Name
		task.delay(2, function()
			if infoLabel then
				infoLabel.Text = "Nhấn K để ẩn/hiện menu"
			end
		end)
	end
end

local function createNPCButton(npc, distance)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, -12, 0, 42)
	button.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	button.BorderSizePixel = 0
	button.Text = ""
	button.AutoButtonColor = true
	button.Parent = list

	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 9)
	btnCorner.Parent = button

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Size = UDim2.new(1, -80, 1, 0)
	nameLabel.Position = UDim2.new(0, 12, 0, 0)
	nameLabel.BackgroundTransparency = 1
	nameLabel.Text = "📍 " .. npc.Name
	nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	nameLabel.TextSize = 14
	nameLabel.Font = Enum.Font.GothamSemibold
	nameLabel.TextXAlignment = Enum.TextXAlignment.Left
	nameLabel.Parent = button

	local distLabel = Instance.new("TextLabel")
	distLabel.Size = UDim2.new(0, 70, 1, 0)
	distLabel.Position = UDim2.new(1, -75, 0, 0)
	distLabel.BackgroundTransparency = 1
	distLabel.Text = distance .. "m"
	distLabel.TextColor3 = Color3.fromRGB(130, 200, 130)
	distLabel.TextSize = 13
	distLabel.Font = Enum.Font.Gotham
	distLabel.TextXAlignment = Enum.TextXAlignment.Right
	distLabel.Parent = button

	button.MouseButton1Click:Connect(function()
		selectedNPC = npc
		teleportToNPC(npc)
	end)

	table.insert(npcButtons, {
		button = button,
		npc = npc,
		name = string.lower(npc.Name),
		distance = distance
	})

	return button
end

local function filterList(searchText)
	searchText = string.lower(searchText or "")
	local visibleCount = 0

	for _, data in ipairs(npcButtons) do
		if searchText == "" or string.find(data.name, searchText, 1, true) then
			data.button.Visible = true
			visibleCount += 1
		else
			data.button.Visible = false
		end
	end

	list.CanvasSize = UDim2.new(0, 0, 0, visibleCount * 48)
end

local function scanNPCs()
	clearList()

	local npcList = {}

	for _, object in ipairs(workspace:GetDescendants()) do
		if isNPC(object) then
			local dist = getDistance(object)
			table.insert(npcList, {
				npc = object,
				distance = dist
			})
		end
	end

	-- Sắp xếp gần → xa
	table.sort(npcList, function(a, b)
		return a.distance < b.distance
	end)

	for _, data in ipairs(npcList) do
		createNPCButton(data.npc, data.distance)
	end

	list.CanvasSize = UDim2.new(0, 0, 0, #npcList * 48)
	infoLabel.Text = "Tìm thấy " .. #npcList .. " NPC  |  Nhấn K để ẩn/hiện"
end

-- =========================
-- SỰ KIỆN
-- =========================
refresh.MouseButton1Click:Connect(scanNPCs)

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	filterList(searchBox.Text)
end)

closeBtn.MouseButton1Click:Connect(function()
	gui.Enabled = false
end)

minimizeBtn.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	if isMinimized then
		frame.Size = UDim2.new(0, 340, 0, 48)
		list.Visible = false
		searchBox.Visible = false
		refresh.Visible = false
		infoLabel.Visible = false
		minimizeBtn.Text = "+"
	else
		frame.Size = originalSize
		list.Visible = true
		searchBox.Visible = true
		refresh.Visible = true
		infoLabel.Visible = true
		minimizeBtn.Text = "–"
	end
end)

-- Phím tắt K
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.K then
		gui.Enabled = not gui.Enabled
	end
end)

-- =========================
-- KÉO MENU
-- =========================
local dragging = false
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

-- Chạy lần đầu
scanNPCs()
