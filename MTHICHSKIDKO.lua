local Module = {
	V="Ganteng HUb",
	A=1,
	B=4,
	C=1,
	HOST="http"
}

local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local TextService = game:GetService('TextService')
local LocalPlayer = game:GetService('Players').LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function cretate_button(asd)
	local button=Instance.new('TextButton')
	button.Size=UDim2.new(1,0,1,0)
	button.BackgroundTransparency=1
	button.TextTransparency=1
	button.Text=""
	button.Parent=asd
	button.ZIndex=asd.ZIndex+1
	return button
end

local function ccp(ui:UIListLayout)
	if ui.Parent.ClassName=="ScrollingFrame" then
		local pp:ScrollingFrame=ui.Parent
		ui:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
			TweenService:Create(pp,TweenInfo.new(0.4),{CanvasSize=UDim2.new(0,0,0,ui.AbsoluteContentSize.Y+15)}):Play()
		end)

		TweenService:Create(pp,TweenInfo.new(0.4),{CanvasSize=UDim2.new(0,0,0,ui.AbsoluteContentSize.Y+15)}):Play()
	end
end

local function CalculateDistance<Info...>(pointA, pointB)
	return math.sqrt(((pointB.X - pointA.X) ^ 2) + ((pointB.Y - pointA.Y) ^ 2))
end

function Create_Ripple<Effect...>(Parent : Frame, ___)
	Parent.ClipsDescendants = true
	local ripple = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")

	ripple.Active = false
	ripple.Name = "ripple"
	ripple.Parent = Parent
	ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ripple.ZIndex = Parent.ZIndex or 7
	ripple.AnchorPoint = Vector2.new(0.5, 0.5)
	ripple.Size = UDim2.new(0,0,0,0)
	ripple.SizeConstraint = Enum.SizeConstraint.RelativeYY

	UICorner.CornerRadius = UDim.new(0.25, 0)
	UICorner.Parent = ripple

	local buttonAbsoluteSize = Parent.AbsoluteSize
	local buttonAbsolutePosition = Parent.AbsolutePosition

	local mouseAbsolutePosition = Vector2.new(Mouse.X, Mouse.Y)
	local mouseRelativePosition = (mouseAbsolutePosition - buttonAbsolutePosition)

	ripple.BackgroundTransparency = 0.84
	ripple.Position = UDim2.new(0, mouseRelativePosition.X, 0, mouseRelativePosition.Y)
	ripple.Parent = Parent

	local topLeft = CalculateDistance(mouseRelativePosition, Vector2.new(0, 0))
	local topRight = CalculateDistance(mouseRelativePosition, Vector2.new(buttonAbsoluteSize.X, 0))
	local bottomRight = CalculateDistance(mouseRelativePosition, buttonAbsoluteSize)
	local bottomLeft = CalculateDistance(mouseRelativePosition, Vector2.new(0, buttonAbsoluteSize.Y))

	local Size_UP = UDim2.new(50,0,50,0)

	if (___) ~= nil then
		Size_UP = Parent.Size
	end

	TweenService:Create(ripple,TweenInfo.new(2),{Size = Size_UP,BackgroundTransparency = 1}):Play()

	if (___) ~= nil then
		TweenService:Create(ripple,TweenInfo.new(0.2),{Position =UDim2.new(0.5,0,0.5,0)}):Play()
	end
	game:GetService('Debris'):AddItem(ripple,2.2)
end

local function GetImageData(name:string,image:ImageLabel)
	name = name or "ADS"
	name = name:lower()
	local NigImage = "rbxassetid://3926305904"
	if name == "ads" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(205,565)
		image.ImageRectSize = Vector2.new(35,35)
	end

	if name == "list" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(485,205)
		image.ImageRectSize = Vector2.new(35,35)
	end

	if name == "folder" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(805,45)
		image.ImageRectSize = Vector2.new(35,35)
	end

	if name == "earth" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(604,324)
		image.ImageRectSize = Vector2.new(35,35)
	end

	if name == "locked" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(524, 644)
		image.ImageRectSize = Vector2.new(35,35)
	end

	if name == "home" then
		image.Image = NigImage
		image.ImageRectOffset = Vector2.new(964, 205)
		image.ImageRectSize = Vector2.new(35,35)
	end

	if name == "mouse" then
		image.Image = "rbxassetid://3515393063"
	end

	if name == "user" then
		image.Image = "rbxassetid://10494577250"
	end
end

function Module:Create(WindowName:string,ScriptName:string,UserRoleName:string,CustomImage:string):{win}
	local Windows = { 
		TabFrames = { },
	}

	WindowName = WindowName or ''
	ScriptName = ScriptName or ""
	UserRoleName=UserRoleName or "Member"
	CustomImage=CustomImage or game:GetService('Players'):GetUserThumbnailAsync(LocalPlayer.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size352x352)

	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Header = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local MainTitle = Instance.new("TextLabel")
	local HidTitle = Instance.new("TextLabel")
	local UIStroke = Instance.new("UIStroke")
	local MoveIcon = Instance.new("ImageLabel")
	local DropShadow = Instance.new("ImageLabel")
	local Frame_2 = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local UIStroke_2 = Instance.new("UIStroke")
	local TabButtons = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local UICorner_4 = Instance.new("UICorner")
	local UIStroke_3 = Instance.new("UIStroke")
	local Icon = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local Gradient = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local TopBar = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")
	local UIStroke_4 = Instance.new("UIStroke")
	local TopBarButton = Instance.new("ImageButton")
	local TopBarMainFrame = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local TopbarFrame = Instance.new("Frame")
	local UICorner_7 = Instance.new("UICorner")
	local UserImage = Instance.new("ImageLabel")
	local UICorner_8 = Instance.new("UICorner")
	local UIStroke_5 = Instance.new("UIStroke")
	local UserName = Instance.new("TextLabel")
	local UserRole = Instance.new("TextLabel")
	local Frame_3 = Instance.new("Frame")
	local UIGradient_2 = Instance.new("UIGradient")

	ScreenGui.Parent = game:FindFirstChild('CoreGui') or game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ResetOnSpawn = false
	ScreenGui.IgnoreGuiInset=true
	ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Global

	Frame.Parent = ScreenGui
	Frame.Active = true
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(41, 43, 47)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.Size = UDim2.new(0,0,0,0)
	Frame.ZIndex = 3
	TweenService:Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{Size=UDim2.new(0.100000001, 350, 0.100000001, 250)}):Play()
	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Frame

	Header.Name = "Header"
	Header.Parent = Frame
	Header.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
	Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Header.BorderSizePixel = 0
	Header.Position = UDim2.new(0.0169122536, 0, 0.0244840626, 0)
	Header.Size = UDim2.new(0.305800885, 0, 0.203863204, 0)
	Header.ZIndex = 4

	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = Header

	MainTitle.Name = "MainTitle"
	MainTitle.Parent = Header
	MainTitle.AnchorPoint = Vector2.new(0.5, 0.5)
	MainTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainTitle.BackgroundTransparency = 1.000
	MainTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainTitle.BorderSizePixel = 0
	MainTitle.Position = UDim2.new(0.500000238, 0, 0.320754796, 0)
	MainTitle.Size = UDim2.new(0.800000072, 0, 0.404833019, 0)
	MainTitle.ZIndex = 5
	MainTitle.Font = Enum.Font.RobotoMono
	MainTitle.FontFace.Style=Enum.FontStyle.Normal
	MainTitle.FontFace.Bold=true
	MainTitle.RichText=true
	MainTitle.FontFace.Weight=Enum.FontWeight.Bold
	MainTitle.Text = "<b>"..WindowName.."</b>" or "SCRIPT"
	MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	MainTitle.TextScaled = true
	MainTitle.TextSize = 14.000
	MainTitle.TextWrapped = true

	HidTitle.Name = "HidTitle"
	HidTitle.Parent = Header
	HidTitle.AnchorPoint = Vector2.new(0.5, 0.5)
	HidTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HidTitle.BackgroundTransparency = 1.000
	HidTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HidTitle.BorderSizePixel = 0
	HidTitle.Position = UDim2.new(0.5, 0, 0.706791997, 0)
	HidTitle.Size = UDim2.new(0.800000072, 0, 0.168143764, 0)
	HidTitle.ZIndex = 5
	HidTitle.Font = Enum.Font.RobotoMono
	HidTitle.FontFace.Weight=Enum.FontWeight.Bold
	HidTitle.RichText=true
	HidTitle.Text = "<b>"..ScriptName.."</b>" or _G.gamename
	HidTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	HidTitle.TextScaled = true
	HidTitle.TextSize = 14.000
	HidTitle.TextTransparency = 0.500
	HidTitle.TextWrapped = true

	UIStroke.Thickness = 2.700
	UIStroke.Transparency = 0.250
	UIStroke.Color = Color3.fromRGB(22, 25, 27)
	UIStroke.Parent = Header

	MoveIcon.Name = "MoveIcon"
	MoveIcon.Parent = Header
	MoveIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MoveIcon.BackgroundTransparency = 1.000
	MoveIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MoveIcon.BorderSizePixel = 0
	MoveIcon.Position = UDim2.new(0.00999999978, 0, 0.00999999978, 0)
	MoveIcon.Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
	MoveIcon.SizeConstraint = Enum.SizeConstraint.RelativeYY
	MoveIcon.ZIndex = 5
	MoveIcon.Image = "rbxassetid://345081302"
	MoveIcon.ImageTransparency = 0.500

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = Frame
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 47, 1, 47)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6014261993"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	Frame_2.Parent = Frame
	Frame_2.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
	Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_2.BorderSizePixel = 0
	Frame_2.ClipsDescendants = true
	Frame_2.Position = UDim2.new(0.0155140487, 0, 0.268712759, 0)
	Frame_2.Size = UDim2.new(0.307198912, 0, 0.708987296, 0)
	Frame_2.ZIndex = 4

	UICorner_3.CornerRadius = UDim.new(0, 5)
	UICorner_3.Parent = Frame_2

	UIStroke_2.Thickness = 2.700
	UIStroke_2.Transparency = 0.250
	UIStroke_2.Color = Color3.fromRGB(22, 25, 27)
	UIStroke_2.Parent = Frame_2

	TabButtons.Name = "TabButtons"
	TabButtons.Parent = Frame_2
	TabButtons.Active = true
	TabButtons.AnchorPoint = Vector2.new(0.5, 0.5)
	TabButtons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabButtons.BackgroundTransparency = 1.000
	TabButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabButtons.BorderSizePixel = 0
	TabButtons.ClipsDescendants = false
	TabButtons.Position = UDim2.new(0.5, 0, 0.5, 0)
	TabButtons.Size = UDim2.new(0.980000019, 0, 0.949999988, 0)
	TabButtons.ZIndex = 5
	TabButtons.BottomImage = ""
	TabButtons.ScrollBarThickness = 1
	TabButtons.TopImage = ""

	UIListLayout.Parent = TabButtons
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)
	ccp(UIListLayout)
	Gradient.Name = "Gradient"
	Gradient.Parent = Frame_2
	Gradient.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
	Gradient.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Gradient.BorderSizePixel = 0
	Gradient.Size = UDim2.new(1, 0, 1, 0)
	Gradient.ZIndex = 6

	UIGradient.Rotation = 90
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.49), NumberSequenceKeypoint.new(0.04, 0.96), NumberSequenceKeypoint.new(0.50, 1.00), NumberSequenceKeypoint.new(0.98, 1.00), NumberSequenceKeypoint.new(1.00, 0.49)}
	UIGradient.Parent = Gradient

	TopBar.Name = "TopBar"
	TopBar.Parent = Frame
	TopBar.BackgroundColor3 = Color3.fromRGB(54, 57, 62)
	TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0.975000024, 0, 0.0149999997, 0)
	TopBar.Size = UDim2.new(0.100000001, 0, 0.100000001, 0)
	TopBar.SizeConstraint = Enum.SizeConstraint.RelativeYY

	UICorner_5.CornerRadius = UDim.new(0, 5)
	UICorner_5.Parent = TopBar

	UIStroke_4.Transparency = 0.250
	UIStroke_4.Color = Color3.fromRGB(22, 25, 27)
	UIStroke_4.Parent = TopBar

	TopBarButton.Name = "TopBarButton"
	TopBarButton.Parent = TopBar
	TopBarButton.AnchorPoint = Vector2.new(0.5, 0.5)
	TopBarButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TopBarButton.BackgroundTransparency = 1.000
	TopBarButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBarButton.BorderSizePixel = 0
	TopBarButton.Position = UDim2.new(0.5, 0, 0.5, 0)
	TopBarButton.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
	TopBarButton.Image = "rbxassetid://3926305904"
	TopBarButton.ImageRectOffset = Vector2.new(805, 45)
	TopBarButton.ImageRectSize = Vector2.new(35, 35)
	TopBarButton.ImageTransparency = 0.450

	TopBarMainFrame.Name = "TopBarMainFrame"
	TopBarMainFrame.Parent = Frame
	TopBarMainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TopBarMainFrame.BackgroundTransparency = 1.000
	TopBarMainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBarMainFrame.BorderSizePixel = 0
	TopBarMainFrame.ClipsDescendants = true
	TopBarMainFrame.Size = UDim2.new(1, 0, 1, 0)
	TopBarMainFrame.ZIndex = 15

	UICorner_6.CornerRadius = UDim.new(0, 5)
	UICorner_6.Parent = TopBarMainFrame

	TopbarFrame.Name = "TopbarFrame"
	TopbarFrame.Parent = TopBarMainFrame
	TopbarFrame.AnchorPoint = Vector2.new(0, 0.5)
	TopbarFrame.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
	TopbarFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopbarFrame.BorderSizePixel = 0
	TopbarFrame.Position = UDim2.new(-0.349999994, 0, 0.5, 0)
	TopbarFrame.Size = UDim2.new(0.3474859, 0, 0.980000079, 0)
	TopbarFrame.ZIndex = 16

	UICorner_7.CornerRadius = UDim.new(0, 5)
	UICorner_7.Parent = TopbarFrame

	UserImage.Name = "UserImage"
	UserImage.Parent = TopbarFrame
	UserImage.AnchorPoint = Vector2.new(0.5, 0.5)
	UserImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserImage.BackgroundTransparency = 1.000
	UserImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserImage.BorderSizePixel = 0
	UserImage.Position = UDim2.new(0.5, 0, 0.25, 0)
	UserImage.Size = UDim2.new(0.699999988, 0, 0.699999988, 0)
	UserImage.SizeConstraint = Enum.SizeConstraint.RelativeXX
	UserImage.ZIndex = 17
	UserImage.Image = CustomImage

	UICorner_8.CornerRadius = UDim.new(0, 5)
	UICorner_8.Parent = UserImage

	UIStroke_5.Thickness = 2.700
	UIStroke_5.Transparency = 0.250
	UIStroke_5.Color = Color3.fromRGB(22, 25, 27)
	UIStroke_5.Parent = UserImage

	UserName.Name = "UserName"
	UserName.Parent = TopbarFrame
	UserName.AnchorPoint = Vector2.new(0.5, 0.5)
	UserName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserName.BackgroundTransparency = 1.000
	UserName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserName.BorderSizePixel = 0
	UserName.Position = UDim2.new(0.5, 0, 0.498666793, 0)
	UserName.Size = UDim2.new(0.800000072, 0, 0.0624293722, 0)
	UserName.ZIndex = 17
	UserName.Font = Enum.Font.RobotoMono
	UserName.RichText =true
	UserName.Text = "<b>"..LocalPlayer.DisplayName.."</b>"
	UserName.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserName.TextScaled = true
	UserName.TextSize = 14.000
	UserName.TextWrapped = true

	UserRole.Name = "UserRole"
	UserRole.Parent = TopbarFrame
	UserRole.AnchorPoint = Vector2.new(0.5, 0.5)
	UserRole.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserRole.BackgroundTransparency = 1.000
	UserRole.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserRole.BorderSizePixel = 0
	UserRole.Position = UDim2.new(0.5, 0, 0.571345448, 0)
	UserRole.Size = UDim2.new(0.800000072, 0, 0.0426079258, 0)
	UserRole.ZIndex = 17
	UserRole.Font = Enum.Font.RobotoMono
	UserRole.RichText =true
	UserRole.Text = "<b>"..UserRoleName.."</b>"
	UserRole.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserRole.TextScaled = true
	UserRole.TextSize = 14.000
	UserRole.TextTransparency = 0.500
	UserRole.TextWrapped = true

	Frame_3.Parent = TopbarFrame
	Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_3.BackgroundTransparency = 0.500
	Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_3.BorderSizePixel = 0
	Frame_3.Position = UDim2.new(0.5, 0, 0.540000021, 0)
	Frame_3.Size = UDim2.new(0.899999976, 0, 0.00249999994, 0)
	Frame_3.ZIndex = 17

	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.08, 0.00), NumberSequenceKeypoint.new(0.91, 0.00), NumberSequenceKeypoint.new(1.00, 1.00)}
	UIGradient_2.Parent = Frame_3


	function Windows:MakeLogo(Id:string):nil
		Id = tostring(Id)

		local ScriptHubLogo = Instance.new("ImageLabel")
		local UICorner = Instance.new("UICorner")

		if not Id:find('http://www.roblox.com/asset/?id=') and not Id:find('rbxassetid://') and not Id:find('/')then
			Id = 'http://www.roblox.com/asset/?id='..Id
		end

		ScriptHubLogo.Name = "ScriptHubLogo"
		ScriptHubLogo.Parent = Header
		ScriptHubLogo.AnchorPoint = Vector2.new(0.5, 0.5)
		ScriptHubLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScriptHubLogo.BackgroundTransparency = 1.000
		ScriptHubLogo.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ScriptHubLogo.BorderSizePixel = 0
		ScriptHubLogo.Position = UDim2.new(0.5, 0, 0.5, 0)
		ScriptHubLogo.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		ScriptHubLogo.SizeConstraint = Enum.SizeConstraint.RelativeYY
		ScriptHubLogo.ZIndex = 4
		ScriptHubLogo.Image = Id
		ScriptHubLogo.ScaleType = Enum.ScaleType.Fit

		UICorner.CornerRadius = UDim.new(0.5, 0)
		UICorner.Parent = ScriptHubLogo

		return ScriptHubLogo
	end

	function Windows:CreateTab(TabName:string,IconName:string)
		local Tab = { }

		local TabButton = Instance.new("Frame")
		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local Icon = Instance.new("ImageLabel")
		local TextLabel = Instance.new("TextLabel")

		TabButton.Name = "TabButton"
		TabButton.Parent = TabButtons
		TabButton.BackgroundColor3 = Color3.fromRGB(46, 49, 54)
		TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.Size = UDim2.new(0.980000019, 0, 0.5, 0)
		TabButton.ZIndex = 5

		UIAspectRatioConstraint.Parent = TabButton
		UIAspectRatioConstraint.AspectRatio = 5.000
		UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = TabButton

		UIStroke.Transparency = 0.250
		UIStroke.Color = Color3.fromRGB(22, 25, 27)
		UIStroke.Parent = TabButton

		Icon.Name = "Icon"
		Icon.Parent = TabButton
		Icon.AnchorPoint = Vector2.new(0.5, 0.5)
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Icon.BackgroundTransparency = 1.000
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Icon.BorderSizePixel = 0
		Icon.Position = UDim2.new(0.100000001, 0, 0.5, 0)
		Icon.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
		Icon.SizeConstraint = Enum.SizeConstraint.RelativeYY
		Icon.ZIndex = 5
		Icon.ImageTransparency=0.5
		GetImageData(IconName,Icon)

		TextLabel.Parent = TabButton
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.933115065, 0, 0.499999583, 0)
		TextLabel.Size = UDim2.new(1.34086835, 0, 0.549999952, 0)
		TextLabel.ZIndex = 5
		TextLabel.Font = Enum.Font.RobotoMono
		TextLabel.RichText=true

		TextLabel.Text = "<b>"..tostring(TabName or nil).."</b>" or ''
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 14.000
		TextLabel.TextWrapped = true
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel.TextYAlignment = Enum.TextYAlignment.Top
		-----
		local TabFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local Items = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local UIStroke = Instance.new("UIStroke")

		TabFrame.Name = "TabFrame"
		TabFrame.Parent = Frame
		TabFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		TabFrame.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
		TabFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabFrame.BorderSizePixel = 0
		TabFrame.ClipsDescendants = true
		TabFrame.Position = UDim2.new(0.665320456, 0, 0.501092017, 0)
		TabFrame.Size = UDim2.new(0.637839735, 0, 0.953215957, 0)
		TabFrame.ZIndex = 4

		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = TabFrame

		Items.Name = "Items"
		Items.Parent = TabFrame
		Items.Active = true
		Items.AnchorPoint = Vector2.new(0.5, 0.5)
		Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Items.BackgroundTransparency = 1.000
		Items.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Items.BorderSizePixel = 0
		Items.ClipsDescendants = false
		Items.Position = UDim2.new(0.5, 0, 0.5, 0)
		Items.Size = UDim2.new(0.980000019, 0, 0.949999988, 0)
		Items.ZIndex = 5
		Items.BottomImage = ""
		Items.ScrollBarThickness = 1
		Items.TopImage = ""

		UIListLayout.Parent = Items
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)
		ccp(UIListLayout)
		UIStroke.Thickness = 2.700
		UIStroke.Transparency = 0.250
		UIStroke.Color = Color3.fromRGB(22, 25, 27)
		UIStroke.Parent = TabFrame

		local function call(val)
			if val then
				TweenService:Create(Icon,TweenInfo.new(0.1),{ImageTransparency=0}):Play()
				TabFrame.Visible=true
			else
				TweenService:Create(Icon,TweenInfo.new(0.1),{ImageTransparency=0.5}):Play()
				TabFrame.Visible=false
			end
		end

		if not Windows.TabFrames[1] then
			call(true)
		else
			call(false)
		end

		table.insert(Windows.TabFrames,{TabFrame,call})
		local t=cretate_button(TabButton)
		t.MouseButton1Click:Connect(function()
			Create_Ripple(t)
			for i,v in ipairs(Windows.TabFrames) do
				if v[1]==TabFrame then
					v[2](true)
				else
					v[2](false)
				end
			end
		end)

		function Tab:CreateButton(ButtonName:string,callback:func)callback=callback or function()end
			local Subway = {}
			local Button = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")

			Button.Name = "Button"
			Button.Parent = Items
			Button.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0.925000012, 0, 0.5, 0)
			Button.ZIndex = 7

			UIAspectRatioConstraint.Parent = Button
			UIAspectRatioConstraint.AspectRatio = 10.000
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 2)
			UICorner.Parent = Button

			TextLabel.Parent = Button
			TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextLabel.Size = UDim2.new(1, 0, 0.550000012, 0)
			TextLabel.ZIndex = 8
			TextLabel.Font = Enum.Font.RobotoMono
			TextLabel.RichText=true
			TextLabel.Text = "<b>"..tostring(ButtonName or "dex").."</b>"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
			TweenService:Create(TextLabel,TweenInfo.new(0.3),{TextTransparency=0.2}):Play()

			local b= cretate_button(Button)
			b.MouseButton1Click:Connect(function()
				Create_Ripple(b)
				callback()
			end)

			b.MouseEnter:Connect(function()
				TweenService:Create(TextLabel,TweenInfo.new(0.3),{TextTransparency=0}):Play()
			end)

			b.MouseLeave:Connect(function()
				TweenService:Create(TextLabel,TweenInfo.new(0.3),{TextTransparency=0.5}):Play()
			end)

			function Subway:Text(c)
				TextLabel.Text=c
			end

			function Subway:Fire(...)
				callback(...)
			end

			return Subway
		end

		function Tab:CreateLabel(Labela:string)
			local Label = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")

			Label.Name = "Label"
			Label.Parent = Items
			Label.BackgroundColor3 = Color3.fromRGB(25, 27, 29)
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(0.925000012, 0, 0.5, 0)
			Label.ZIndex = 7

			UIAspectRatioConstraint.Parent = Label
			UIAspectRatioConstraint.AspectRatio = 12.000
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 2)
			UICorner.Parent = Label

			TextLabel.Parent = Label
			TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextLabel.Size = UDim2.new(1, 0, 0.649999976, 0)
			TextLabel.ZIndex = 8
			TextLabel.Font = Enum.Font.RobotoMono
			TextLabel.RichText=true
			TextLabel.Text="<b>"..tostring(Labela or '').."</b>"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true

			local c = {} function c:Text(a)TextLabel.Text=a end return c
		end

		function Tab:CreateToggle(ToggleName:string,Default:boolean,callback:FunctionalTest)
			callback=callback or function()

			end

			local Toggle = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local ToggleOS = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local Smootv = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local UIGradient = Instance.new("UIGradient")

			Toggle.Name = "Toggle"
			Toggle.Parent = Items
			Toggle.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(0.925000012, 0, 0.5, 0)
			Toggle.ZIndex = 7

			UIAspectRatioConstraint.Parent = Toggle
			UIAspectRatioConstraint.AspectRatio = 10.000
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 2)
			UICorner.Parent = Toggle

			TextLabel.Parent = Toggle
			TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.457783341, 0, 0.500000238, 0)
			TextLabel.Size = UDim2.new(0.823457897, 0, 0.550000012, 0)
			TextLabel.ZIndex = 8
			TextLabel.Font = Enum.Font.RobotoMono
			TextLabel.RichText=true
			TextLabel.Text="<b>"..tostring(ToggleName or '').."</b>"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left


			ToggleOS.Name = "ToggleOS"
			ToggleOS.Parent = Toggle
			ToggleOS.AnchorPoint = Vector2.new(0.5, 0.5)
			ToggleOS.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			ToggleOS.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleOS.BorderSizePixel = 0
			ToggleOS.ClipsDescendants = true
			ToggleOS.Position = UDim2.new(0.949999988, 0, 0.5, 0)
			ToggleOS.Size = UDim2.new(0.600000024, 0, 0.600000024, 0)
			ToggleOS.SizeConstraint = Enum.SizeConstraint.RelativeYY
			ToggleOS.ZIndex = 8

			UICorner_2.CornerRadius = UDim.new(0, 2)
			UICorner_2.Parent = ToggleOS

			UIStroke.Thickness = 2.000
			UIStroke.Color = Color3.fromRGB(32, 34, 37)
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Parent = ToggleOS

			Smootv.Name = "Smootv"
			Smootv.Parent = ToggleOS
			Smootv.AnchorPoint = Vector2.new(0.5, 0.5)
			Smootv.BackgroundColor3 = Color3.fromRGB(143, 152, 167)
			Smootv.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Smootv.BorderSizePixel = 0
			Smootv.Position = UDim2.new(0.5, 0, 0.5, 0)
			Smootv.ZIndex = 9

			UICorner_3.CornerRadius = UDim.new(0, 2)
			UICorner_3.Parent = Smootv

			UIGradient.Rotation = 90
			UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(1.00, 0.46)}
			UIGradient.Parent = Smootv
			local function toggle(val)
				if val then -- {}
					TweenService:Create(Smootv,TweenInfo.new(0.1),{Size=UDim2.fromScale(1,1)}):Play()
					TweenService:Create(TextLabel,TweenInfo.new(0.3),{TextTransparency=0}):Play()
				else
					TweenService:Create(Smootv,TweenInfo.new(0.1),{Size=UDim2.fromScale(0,0)}):Play()
					TweenService:Create(TextLabel,TweenInfo.new(0.3),{TextTransparency=0.5}):Play()
				end

			end

			toggle(Default)

			local t=cretate_button(Toggle)
			t.MouseButton1Click:Connect(function()
				Default=not Default
				toggle(Default)
				Create_Ripple(t)
				callback(Default)
			end)

			local text={}

			function text:Value(c,...)
				Default=c
				toggle(c)
				callback(c,...)				
			end

			function text:Text(a)
				TextLabel.Text=tostring(a)
			end

			return text
		end

		function Tab:CreateKeybind(KeybindName:string,default:Enum.KeyCode,callback:FunctionalTest)
			callback=callback or function()

			end

			local Keybind = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local OS = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")
			local keyhold = Instance.new("TextLabel")

			local function totext(em:Enum.KeyCode)
				if not em or em==nil then
					return "None"
				end

				return em.Name
			end

			Keybind.Name = "Keybind"
			Keybind.Parent = Items
			Keybind.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
			Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Keybind.BorderSizePixel = 0
			Keybind.Position = UDim2.new(0.0161998514, 0, 0.328290939, 0)
			Keybind.Size = UDim2.new(0.925000012, 0, 0.5, 0)
			Keybind.ZIndex = 7

			UIAspectRatioConstraint.Parent = Keybind
			UIAspectRatioConstraint.AspectRatio = 10.000
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 2)
			UICorner.Parent = Keybind

			TextLabel.Parent = Keybind
			TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.457783252, 0, 0.500000238, 0)
			TextLabel.Size = UDim2.new(0.823457956, 0, 0.550000012, 0)
			TextLabel.ZIndex = 8
			TextLabel.Font = Enum.Font.RobotoMono
			TextLabel.RichText=true
			TextLabel.Text = "<b>"..tostring(KeybindName or '').."</b>"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			OS.Name = "OS"
			OS.Parent = Keybind
			OS.AnchorPoint = Vector2.new(1, 0.5)
			OS.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			OS.BorderColor3 = Color3.fromRGB(0, 0, 0)
			OS.BorderSizePixel = 0
			OS.ClipsDescendants = true
			OS.Position = UDim2.new(0.980000019, 0, 0.5, 0)
			OS.Size = UDim2.new(0, 25, 0.600000024, 0)
			OS.SizeConstraint = Enum.SizeConstraint.RelativeYY
			OS.ZIndex = 8

			UICorner_2.CornerRadius = UDim.new(0, 2)
			UICorner_2.Parent = OS

			UIStroke.Thickness = 2.000
			UIStroke.Color = Color3.fromRGB(32, 34, 37)
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			UIStroke.Parent = OS

			keyhold.Name = "keyhold"
			keyhold.Parent = OS
			keyhold.AnchorPoint = Vector2.new(0.5, 0.5)
			keyhold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			keyhold.BackgroundTransparency = 1.000
			keyhold.BorderColor3 = Color3.fromRGB(0, 0, 0)
			keyhold.BorderSizePixel = 0
			keyhold.Position = UDim2.new(0.5, 0, 0.5, 0)
			keyhold.Size = UDim2.new(1, 0, 0.75, 0)
			keyhold.ZIndex = 9
			keyhold.Font = Enum.Font.RobotoMono
			keyhold.RichText=true
			keyhold.Text = "<b>"..totext(default).."</b>"
			keyhold.TextColor3 = Color3.fromRGB(255, 255, 255)
			keyhold.TextScaled = true
			keyhold.TextSize = 14.000
			keyhold.TextWrapped = true
			local function UpdateSieze()
				local x=TextService:GetTextSize(keyhold.Text,keyhold.TextSize,keyhold.Font,Vector2.new(math.huge,math.huge))
				TweenService:Create(OS,TweenInfo.new(0.2),{Size=UDim2.new(0,x.X/1.5,0.6,0)}):Play()
			end

			UpdateSieze()
			TweenService:Create(TextLabel,TweenInfo.new(0.1),{TextTransparency=0.5}):Play()
			local IsHold=false
			local t =cretate_button(Keybind)
			t.MouseButton1Click:Connect(function()
				if IsHold then
					return
				end
				Create_Ripple(t)
				IsHold=true
				keyhold.Text="..."
				TweenService:Create(TextLabel,TweenInfo.new(0.3),{TextTransparency=0}):Play()
				local BIND_VAL
				UpdateSieze()
				local BIND = UserInputService.InputBegan:Connect(function(k)
					if k.KeyCode and k.KeyCode ~= Enum.KeyCode.Unknown then
						BIND_VAL=k.KeyCode
					end
				end)

				repeat task.wait() until BIND_VAL ~= nil
				pcall(function()
					BIND:Disconnect()
				end)
				TweenService:Create(TextLabel,TweenInfo.new(0.3),{TextTransparency=0.5}):Play()
				keyhold.Text = "<b>"..totext(BIND_VAL).."</b>"
				IsHold=false
				UpdateSieze()
				callback(BIND_VAL)
			end)

			local text={}

			function text:Value(c,...)
				default=c
				keyhold.Text = "<b>"..totext(c).."</b>"
				UpdateSieze()
				callback(c,...)				
			end

			function text:Text(a)
				TextLabel.Text=tostring(a)
			end

			return text
		end

		function Tab:CreateSlider(SliderName:string,Min:number,Max:number,Default:number,callback:FunctionalTest)
			Max=Max or 100
			Min =Min or 1
			Default=Default or Min

			local Slider = Instance.new("Frame")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local UICorner = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local ValueText = Instance.new("TextLabel")
			local OS = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local OS_UI = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")

			Slider.Name = "Slider"
			Slider.Parent = Items
			Slider.BackgroundColor3 = Color3.fromRGB(47, 49, 54)
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Position = UDim2.new(0.0161998514, 0, 0.328290939, 0)
			Slider.Size = UDim2.new(0.925000012, 0, 0.5, 0)
			Slider.ZIndex = 7

			UIAspectRatioConstraint.Parent = Slider
			UIAspectRatioConstraint.AspectRatio = 7.000
			UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize

			UICorner.CornerRadius = UDim.new(0, 2)
			UICorner.Parent = Slider

			TextLabel.Parent = Slider
			TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextLabel.BorderSizePixel = 0
			TextLabel.Position = UDim2.new(0.453999996, 0, 0.300000012, 0)
			TextLabel.Size = UDim2.new(0.823000014, 0, 0.349999994, 0)
			TextLabel.ZIndex = 8
			TextLabel.Font = Enum.Font.RobotoMono
			TextLabel.RichText=true
			TextLabel.Text = "<b>"..tostring(SliderName or '').."</b>"
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14.000
			TextLabel.TextWrapped = true
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			ValueText.Name = "ValueText"
			ValueText.Parent = Slider
			ValueText.AnchorPoint = Vector2.new(0.5, 0.5)
			ValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ValueText.BackgroundTransparency = 1.000
			ValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ValueText.BorderSizePixel = 0
			ValueText.Position = UDim2.new(0.507, 0, 0.300000578, 0)
			ValueText.Size = UDim2.new(0.946, 0, 0.349999994, 0)
			ValueText.ZIndex = 8
			ValueText.Font = Enum.Font.RobotoMono
			ValueText.RichText=true
			ValueText.Text = "<b>"..tostring(Default).."/"..tostring(Max).."</b>"
			ValueText.TextColor3 = Color3.fromRGB(255, 255, 255)
			ValueText.TextScaled = true
			ValueText.TextSize = 14.000
			ValueText.TextTransparency = 0.500
			ValueText.TextWrapped = true
			ValueText.TextXAlignment = Enum.TextXAlignment.Right

			OS.Name = "OS"
			OS.Parent = Slider
			OS.AnchorPoint = Vector2.new(0.5, 0.5)
			OS.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
			OS.BorderColor3 = Color3.fromRGB(0, 0, 0)
			OS.BorderSizePixel = 0
			OS.ClipsDescendants = true
			OS.Position = UDim2.new(0.5, 0, 0.75, 0)
			OS.Size = UDim2.new(0.949999988, 0, 0.25, 0)
			OS.ZIndex = 8

			UICorner_2.CornerRadius = UDim.new(0, 2)
			UICorner_2.Parent = OS

			OS_UI.Name = "OS_UI"
			OS_UI.Parent = OS
			OS_UI.BackgroundColor3 = Color3.fromRGB(74, 76, 81)
			OS_UI.BorderColor3 = Color3.fromRGB(0, 0, 0)
			OS_UI.BorderSizePixel = 0
			OS_UI.Size = UDim2.new(0.5, 0, 1, 0)
			OS_UI.ZIndex = 9

			UICorner_3.CornerRadius = UDim.new(0, 2)
			UICorner_3.Parent = OS_UI
			TweenService:Create(TextLabel,TweenInfo.new(0.1),{TextTransparency=0.5}):Play()

			local danger = false

			local function update(Input)
				local SizeScale = math.clamp((((Input.Position.X) - OS.AbsolutePosition.X) / OS.AbsoluteSize.X), 0, 1)
				local Valuea = math.floor(((Max - Min) * SizeScale) + Min)
				local Size = UDim2.fromScale(math.clamp(SizeScale,0,1), 1)
				ValueText.Text = "<b>"..tostring(Valuea).."/"..tostring(Max).."</b>"
				TweenService:Create(OS_UI,TweenInfo.new(0.1),{Size = Size}):Play()
				callback(Valuea)
			end

			OS.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					danger = true
					update(Input)
					TweenService:Create(TextLabel,TweenInfo.new(0.1),{TextTransparency=0}):Play()
				end
			end)

			OS.InputEnded:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					danger = false
					TweenService:Create(TextLabel,TweenInfo.new(0.1),{TextTransparency=0.5}):Play()
				end
			end)

			UserInputService.InputChanged:Connect(function(Input)
				if danger then
					if (Input.UserInputType==Enum.UserInputType.MouseMovement or Input.UserInputType==Enum.UserInputType.Touch)  then
						update(Input)
					end
				end
			end)

			local text={}

			function text:Value(c,...)
				Default=c
				ValueText.Text = "<b>"..tostring(Default).."/"..tostring(Max).."</b>"
				OS_UI.Size=UDim2.fromScale((c/Max),1)
				callback(c,...)				
			end

			function text:Text(a)
				TextLabel.Text=tostring(a)
			end

			return text
		end

		return Tab
	end

	local IconButtons = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	IconButtons.Name = "IconButtons"
	IconButtons.Parent = Frame
	IconButtons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	IconButtons.BackgroundTransparency = 1.000
	IconButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
	IconButtons.BorderSizePixel = 0
	IconButtons.Position = UDim2.new(0.975000024, 0, 0.140000001, 0)
	IconButtons.Size = UDim2.new(0.100000001, 0, 0.850000024, 0)
	IconButtons.SizeConstraint = Enum.SizeConstraint.RelativeYY

	UIListLayout.Parent = IconButtons
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 9)

	local Notify = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIListLayout = Instance.new("UIListLayout")

	Notify.Name = "Notify"
	Notify.Parent = ScreenGui
	Notify.BackgroundColor3 = Color3.fromRGB(41, 43, 47)
	Notify.BackgroundTransparency = 1.000
	Notify.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Notify.BorderSizePixel = 0
	Notify.Position = UDim2.new(0.767708361, 0, 0.585135102, 0)
	Notify.Size = UDim2.new(0.226892084, 0, 0.403192937, 0)
	Notify.ZIndex = 45

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Notify

	UIListLayout.Parent = Notify
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout.Padding = UDim.new(0, 6)

	function Windows:Notify(HeadTit,BodyTit,Time)
		Time = Time or 1.5

		local FrameNotify = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local Header = Instance.new("TextLabel")
		local Body = Instance.new("TextLabel")

		FrameNotify.Name = "FrameNotify"
		FrameNotify.Parent = Notify
		FrameNotify.BackgroundColor3 = Color3.fromRGB(41, 43, 47)
		FrameNotify.BorderColor3 = Color3.fromRGB(0, 0, 0)
		FrameNotify.BorderSizePixel = 0
		FrameNotify.Position = UDim2.new(0.767708361, 0, 0.585135102, 0)
		FrameNotify.Size = UDim2.new(0, 0, 0, 0)
		TweenService:Create(FrameNotify,TweenInfo.new(0.3),{Size = UDim2.new(1, 0, 0.449999988, 0)}):Play()
		FrameNotify.ZIndex = 45

		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = FrameNotify

		UIStroke.Transparency = 0.250
		UIStroke.Color = Color3.fromRGB(22, 25, 27)
		UIStroke.Parent = FrameNotify

		Header.Name = "Header"
		Header.Parent = FrameNotify
		Header.AnchorPoint = Vector2.new(0.5, 0.5)
		Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Header.BackgroundTransparency = 1.000
		Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Header.BorderSizePixel = 0
		Header.Position = UDim2.new(0.5, 0, 0.125, 0)
		Header.Size = UDim2.new()
		Header.TextTransparency=0
		TweenService:Create(Header,TweenInfo.new(0.5),{Size = UDim2.new(0.899999976, 0, 0.174999997, 0),TextTransparency=0}):Play()
		Header.ZIndex = 55
		Header.Font = Enum.Font.RobotoMono
		Header.RichText = true
		Header.Text = "<b>"..tostring(HeadTit).."</b>"
		Header.TextColor3 = Color3.fromRGB(255, 255, 255)
		Header.TextScaled = true
		Header.TextSize = 14.000
		Header.TextWrapped = true
		Header.TextXAlignment = Enum.TextXAlignment.Left

		Body.Name = "Body"
		Body.Parent = FrameNotify
		Body.AnchorPoint = Vector2.new(0.5, 0.5)
		Body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Body.BackgroundTransparency = 1.000
		Body.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Body.BorderSizePixel = 0
		Body.Position = UDim2.new(0.49999994, 0, 0.602393389, 0)
		Body.Size = UDim2.new()
		Body.TextTransparency = 1
		TweenService:Create(Body,TweenInfo.new(0.5),{Size = UDim2.new(0.899999976, 0, 0.661755502, 0),TextTransparency=0.2}):Play()
		Body.ZIndex = 55
		Body.Font = Enum.Font.RobotoMono
		Body.RichText = true
		Body.Text = "<b>"..tostring(BodyTit).."</b>"
		Body.TextColor3 = Color3.fromRGB(255, 255, 255)
		Body.TextSize = 14.000
		Body.TextWrapped = true
		Body.TextXAlignment = Enum.TextXAlignment.Left
		Body.TextYAlignment = Enum.TextYAlignment.Top

		task.spawn(function()
			task.wait(0.4)
			task.wait(Time or 1.5)
			TweenService:Create(Body,TweenInfo.new(0.2),{TextTransparency=1}):Play()
			TweenService:Create(Header,TweenInfo.new(0.2),{TextTransparency=1}):Play()
			ili=TweenService:Create(FrameNotify,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{Size = UDim2.new(0, 0, 0, 0)})
			ili:Play()
			ili.Completed:Connect(function()
				FrameNotify:Destroy()
			end)
		end)
	end

	function Windows:CreateButton(IconId:string,Default:boolean,Callback)
		if not Callback then
			return
		end

		Callback = Callback or function()

		end

		local UserInfoToggle=Default or false
		local Frame = Instance.new("Frame")
		local TopBar = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local TopBarButton = Instance.new("ImageButton")

		Frame.Parent = IconButtons
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Size = UDim2.new(0.115000002, 0, 0.115000002, 0)
		Frame.SizeConstraint = Enum.SizeConstraint.RelativeYY

		TopBar.Name = "TopBar"
		TopBar.Parent = Frame
		TopBar.AnchorPoint = Vector2.new(0.5, 0.5)
		TopBar.BackgroundColor3 = Color3.fromRGB(54, 57, 62)
		TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TopBar.BorderSizePixel = 0
		TopBar.Position = UDim2.new(0.5, 0, 0.5, 0)
		TopBar.Size = UDim2.new(1, 0, 1, 0)
		TopBar.SizeConstraint = Enum.SizeConstraint.RelativeYY

		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = TopBar

		UIStroke.Transparency = 0.250
		UIStroke.Color = Color3.fromRGB(22, 25, 27)
		UIStroke.Parent = TopBar

		TopBarButton.Name = "TopBarButton"
		TopBarButton.Parent = TopBar
		TopBarButton.AnchorPoint = Vector2.new(0.5, 0.5)
		TopBarButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TopBarButton.BackgroundTransparency = 1.000
		TopBarButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TopBarButton.BorderSizePixel = 0
		TopBarButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		TopBarButton.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		GetImageData(IconId,TopBarButton)
		TopBarButton.ImageTransparency = 0.450

		TopBar.MouseEnter:Connect(function()
			TweenService:Create(TopBar,TweenInfo.new(0.15),{Position=UDim2.new(0.95,0,0.5,0)}):Play()
		end)

		TopBar.MouseLeave:Connect(function()
			if not UserInfoToggle then
				TweenService:Create(TopBar,TweenInfo.new(0.15),{Position=UDim2.new(0.5,0,0.5,0)}):Play()
			end
		end)

		if UserInfoToggle then
			TweenService:Create(TopBar,TweenInfo.new(0.15),{Position=UDim2.new(0.95,0,0.5,0)}):Play()
			TweenService:Create(TopBarButton,TweenInfo.new(0.15),{ImageTransparency=0}):Play()
		else
			TweenService:Create(TopBar,TweenInfo.new(0.15),{Position=UDim2.new(0.5,0,0.5,0)}):Play()
			TweenService:Create(TopBarButton,TweenInfo.new(0.15),{ImageTransparency=0.45}):Play()
		end
		TopBarButton.MouseButton1Click:Connect(function()
			UserInfoToggle=not UserInfoToggle
			if UserInfoToggle then
				TweenService:Create(TopBarButton,TweenInfo.new(0.15),{ImageTransparency=0}):Play()
			else
				TweenService:Create(TopBarButton,TweenInfo.new(0.15),{ImageTransparency=0.45}):Play()
			end

			Callback(UserInfoToggle)
		end)
	end

	local UserInfoToggle=false
	local dragToggle = nil
	local dragSpeed = 0.1
	local dragStart = nil
	local startPos = nil

	TopBar.MouseEnter:Connect(function()
		TweenService:Create(TopBar,TweenInfo.new(0.15),{Position=UDim2.new(1.005, 0,0.015, 0)}):Play()
	end)

	TopBar.MouseLeave:Connect(function()
		if not UserInfoToggle then
			TweenService:Create(TopBar,TweenInfo.new(0.15),{Position=UDim2.new(0.975, 0,0.015, 0)}):Play()
		end
	end)

	TopBarButton.MouseButton1Click:Connect(function()
		UserInfoToggle=not UserInfoToggle
		if UserInfoToggle then
			TweenService:Create(TopBarMainFrame,TweenInfo.new(0.4),{BackgroundTransparency=0.6}):Play()
			TweenService:Create(TopbarFrame,TweenInfo.new(0.4),{Position=UDim2.new(0.01, 0,0.5, 0)}):Play()

			TweenService:Create(TopBarButton,TweenInfo.new(0.15),{ImageTransparency=0}):Play()
		else
			TweenService:Create(TopBarMainFrame,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
			TweenService:Create(TopbarFrame,TweenInfo.new(0.4),{Position=UDim2.new(-0.35, 0,0.5, 0)}):Play()
			TweenService:Create(TopBarButton,TweenInfo.new(0.15),{ImageTransparency=0.45}):Play()
		end
	end)

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(Frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	Header.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)

	local Framefae = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local DropShadow = Instance.new("ImageLabel")
	local TextButton = Instance.new("TextButton")

	Framefae.Parent = ScreenGui
	Framefae.BackgroundColor3 = Color3.fromRGB(41, 43, 47)
	Framefae.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Framefae.BorderSizePixel = 0
	Framefae.Position = UDim2.new(0.657291651, 0, -1.5, 0)
	TweenService:Create(Framefae,TweenInfo.new(0.5),{Position = UDim2.new(0.657291651, 0, 0.0101902178, 0)}):Play()
	Framefae.Size = UDim2.new(0, 111, 0, 28)
	Framefae.ZIndex = 66

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Framefae

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = Framefae
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 27, 1, 27)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6014261993"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	TextButton.Parent = Framefae
	TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
	TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.BackgroundTransparency = 1.000
	TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.BorderSizePixel = 0
	TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextButton.Size = UDim2.new(0.899999976, 0, 0.754000008, 0)
	TextButton.ZIndex = 77
	TextButton.Font = Enum.Font.RobotoMono
	TextButton.RichText = true
	TextButton.Text = "<b>"..tostring(WindowName).."</b>"
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextScaled = true
	TextButton.TextSize = 14.000
	TextButton.TextWrapped = true
	TextButton.TextTransparency = 0

	local tog = true
	TextButton.MouseEnter:Connect(function()
		TweenService:Create(DropShadow,TweenInfo.new(0.5),{ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)

	TextButton.MouseLeave:Connect(function()
		TweenService:Create(DropShadow,TweenInfo.new(0.5),{ImageColor3 = Color3.fromRGB(0, 0, 0)}):Play()
	end)

	TextButton.MouseButton1Click:Connect(function()
		tog = not tog
		if tog then
			TweenService:Create(TextButton,TweenInfo.new(0.5),{TextTransparency = 0}):Play()
			TweenService:Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{Size=UDim2.new(0.100000001, 350, 0.100000001, 250),Position = UDim2.new(0.5,0,0.5,0)}):Play()
		else
			TweenService:Create(TextButton,TweenInfo.new(0.5),{TextTransparency = 0.2}):Play()
			TweenService:Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{Size=UDim2.new(0,0,0,0)}):Play()
			TweenService:Create(Frame,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{Position = UDim2.new(0.5,0,1,0)}):Play()
		end
	end)

	Frame:GetPropertyChangedSignal('Size'):Connect(function()
		if Frame.Size.X.Scale <= 0.01 then
			Frame.Visible = false
		else
			Frame.Visible = true
		end
	end)


	return Windows
end

function Module:MakeLoad(TITLE:string,TITLE_TWO:string)
	local ScreenGui = Instance.new("ScreenGui")
	local Loader = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Top = Instance.new("Frame")
	local Bottom = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local UnderTitle = Instance.new("TextLabel")
	local UnderTitle_2 = Instance.new("TextLabel")
	ScreenGui.Parent = game:FindFirstChild('CoreGui') or game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ResetOnSpawn = false
	ScreenGui.IgnoreGuiInset=true
	ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Global

	Loader.Name = "Loader"
	Loader.Parent = ScreenGui
	Loader.AnchorPoint = Vector2.new(0.5, 0.5)
	Loader.BackgroundColor3 = Color3.fromRGB(41, 43, 47)
	Loader.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Loader.BorderSizePixel = 0
	Loader.ClipsDescendants = true
	Loader.Position = UDim2.new(0.5, 0, 0.5, 0)
	Loader.Size = UDim2.new(0.100000001, 150, 0.100000001, 100)
	Loader.ZIndex = 17
	Loader.BackgroundTransparency=1

	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = Loader

	Top.Name = "Top"
	Top.Parent = Loader
	Top.AnchorPoint = Vector2.new(0.5, 0.5)
	Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Top.BorderSizePixel = 0
	Top.Position = UDim2.new(-0.5, 0, 0.25, 0)
	Top.Size = UDim2.new(1, 0, 0.5, 0)
	Top.BackgroundColor3 = Color3.fromRGB(41, 43, 47)
	Bottom.Name = "Bottom"
	Bottom.Parent = Loader
	Bottom.AnchorPoint = Vector2.new(0.5, 0.5)
	Bottom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Bottom.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Bottom.BorderSizePixel = 0
	Bottom.Position = UDim2.new(1.5, 0, 0.75, 0)
	Bottom.Size = UDim2.new(1, 0, 0.5, 0)
	Bottom.BackgroundColor3 = Color3.fromRGB(41, 43, 47)
	Title.Name = "Title"
	Title.Parent = Loader
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.ClipsDescendants = true
	Title.Position = UDim2.new(0, 0, 0.0944108739, 0)
	Title.Size = UDim2.new(1, 0, 0.199647531, 0)
	Title.ZIndex = 19
	Title.Font = Enum.Font.RobotoMono
	Title.RichText=true
	Title.Text = "<b>"..tostring(TITLE).."</b>"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true
	Title.TextTransparency=1--0

	UnderTitle.Name = "UnderTitle"
	UnderTitle.Parent = Loader
	UnderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UnderTitle.BackgroundTransparency = 1.000
	UnderTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UnderTitle.BorderSizePixel = 0
	UnderTitle.ClipsDescendants = true
	UnderTitle.Position = UDim2.new(0, 0, 0.295820922, 0)
	UnderTitle.Size = UDim2.new(1, 0, 0.117824778, 0)
	UnderTitle.ZIndex = 19
	UnderTitle.Font = Enum.Font.RobotoMono
	UnderTitle.RichText=true
	UnderTitle.Text = "<b>"..tostring(TITLE_TWO).."</b>"
	UnderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	UnderTitle.TextScaled = true
	UnderTitle.TextSize = 14.000
	UnderTitle.TextTransparency = 1--0.5
	UnderTitle.TextWrapped = true

	UnderTitle_2.Name = "UnderTitle"
	UnderTitle_2.Parent = Loader
	UnderTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UnderTitle_2.BackgroundTransparency = 1.000
	UnderTitle_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UnderTitle_2.BorderSizePixel = 0
	UnderTitle_2.ClipsDescendants = true
	UnderTitle_2.Position = UDim2.new(0, 0, 0.61052382, 0)
	UnderTitle_2.Size = UDim2.new(1, 0, 0.117824778, 0)
	UnderTitle_2.ZIndex = 19
	UnderTitle_2.Font = Enum.Font.RobotoMono
	UnderTitle_2.RichText=true
	UnderTitle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	UnderTitle_2.TextScaled = true
	UnderTitle_2.TextSize = 14.000
	UnderTitle_2.TextTransparency = 1--0.250
	UnderTitle_2.TextWrapped = true

	TweenService:Create(Top,TweenInfo.new(0.4),{Position=UDim2.new(0.5,0,0.25,0)}):Play()
	TweenService:Create(Bottom,TweenInfo.new(0.4),{Position=UDim2.new(0.5,0,0.75,0)}):Play()
	TweenService:Create(Loader,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundTransparency=0}):Play()
	task.wait(0.55)
	TweenService:Create(Title,TweenInfo.new(0.2),{TextTransparency=0}):Play()
	TweenService:Create(UnderTitle,TweenInfo.new(0.35),{TextTransparency=0.5}):Play()
	TweenService:Create(UnderTitle_2,TweenInfo.new(0.45),{TextTransparency=0.250}):Play()
	UnderTitle_2.Text="<b>...</b>"
	task.wait(0.45)
	for i=0,100 do game:GetService('RunService').Heartbeat:Wait()
		UnderTitle_2.Text="<b>"..tostring(i).."%</b>"
	end
	task.wait(0.5)
	TweenService:Create(Top,TweenInfo.new(0.2),{Position=UDim2.new(0.5,0,-1.5,0)}):Play()
	TweenService:Create(Bottom,TweenInfo.new(0.2),{Position=UDim2.new(0.5,0,1.5,0)}):Play()
	task.wait(0.22)
	TweenService:Create(Title,TweenInfo.new(0.2),{TextTransparency=1}):Play()
	TweenService:Create(UnderTitle,TweenInfo.new(0.35),{TextTransparency=1}):Play()
	TweenService:Create(UnderTitle_2,TweenInfo.new(0.45),{TextTransparency=1}):Play()
	TweenService:Create(Loader,TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundTransparency=1}):Play()
	task.wait(2)
	ScreenGui:Destroy()
end

return Module
