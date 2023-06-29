local plr = game.Players.LocalPlayer

function NewGui()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent = plr.PlayerGui
	screenGui.ResetOnSpawn = false
	local frame = Instance.new("Frame")
	frame.Parent = screenGui
	frame.Size = UDim2.new(0, 400, 0, 400)
	frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	frame.Position = UDim2.new(0, 0, 0)
	frame.Visible = true
	local UICORNER = Instance.new("UICorner", frame)
	local Title = Instance.new("TextLabel", frame)
	Title.Text = "Interminable Rooms Hub"
	Title.TextColor3 = Color3.fromRGB(0,0,0) 
	Title.Size = UDim2.new(0, 100, 0, 100)
	Title.Position = UDim2.new(0, 0, 0)
	Title.BackgroundTransparency = 1
	Title.TextScaled = true
	Title.TextWrapped = true
	Title.Font = Enum.Font.Highway
	local CloseButton = Instance.new("TextButton", frame)
	CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.TextScaled = true
	CloseButton.TextWrapped = true
	CloseButton.Font=Enum.Font.Gotham
	CloseButton.BackgroundTransparency=1
	CloseButton.Size=UDim2.new(0, 50, 0, 50) 
	CloseButton.Position=UDim2.new(0.9, 0, 0.9, 0)
	CloseButton.TextColor3 = Color3.fromRGB(134, 0, 0)
	CloseButton.Text= "X" 
	local walkspeed = Instance.new("TextBox", frame)
	walkspeed.PlaceholderText = "Enter WalkSpeed Number"
	walkspeed.Text = ""
	walkspeed.TextScaled = true
	walkspeed.TextWrapped = true
	walkspeed.Position = UDim2.new(0, 0, 0.2,0)
	walkspeed.Size = UDim2.new(0, 100, 0, 50)
	walkspeed.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
	local walkspeedbutton = Instance.new("TextButton", frame)
	walkspeedbutton.Position = UDim2.new(0.3, 0, 0.2,0)
	walkspeedbutton.Size = UDim2.new(0, 50, 0, 50)
	walkspeedbutton.Text = "Set Walkspeed"
	walkspeedbutton.BackgroundColor3 = Color3.new(0.47451, 0.0156863, 0)
	walkspeedbutton.TextScaled = true
	walkspeedbutton.TextWrapped = true
	local walkspeedbutton2 = Instance.new("TextButton", frame)
	walkspeedbutton2.Position = UDim2.new(0, 0, 0.4,0)
	walkspeedbutton2.Size = UDim2.new(0, 50, 0, 50)
	walkspeedbutton2.Text = "Teleport To latest room"
	walkspeedbutton2.BackgroundColor3 = Color3.new(1, 0, 0)
	walkspeedbutton2.TextScaled = true
	walkspeedbutton2.TextWrapped = true
	local label = Instance.new("TextLabel", screenGui)
	label.Text = "Entity Notifier (Can't Notify A-150)"
	label.Size = UDim2.new(0.2, 0, 0.1, 0)
	label.Position = UDim2.new(0.8, 0, .8, 0)
	label.BackgroundColor3 = Color3.new(0.47451, 0.0156863, 0)
	label.TextScaled = true
	label.TextWrapped = true
	local UICorner = Instance.new("UICorner", walkspeed)
	local UICorner2 = Instance.new("UICorner", walkspeedbutton)
	local UICorner3 = Instance.new("UICorner", walkspeedbutton2)
	local UICorner4 = Instance.new("UICorner", label)
	local function setWalkSpeed()
		local num = tonumber(walkspeed.Text)
		local char = plr.Character
		
		local hum = char:FindFirstChildWhichIsA("Humanoid")
		if hum then
			hum.WalkSpeed = num
		end
	end
	
	local function teleportToLatestRoom()
		local RoomsFolder = workspace:FindFirstChild("Rooms")
		if RoomsFolder then
			for i, v in ipairs(RoomsFolder:GetChildren()) do
				local Door = v:FindFirstChild("Door")
				if Door then
					local Door2 = Door:FindFirstChild("Door")
					if Door2 then
						local char = plr.Character
						
						char:PivotTo(Door2.CFrame)
					end
					
				end
			end
		end
	end
	
	local function close()
		frame.Visible=false
	end
	
	local function OpenGui()
		frame.Visible=true
	end
	
	local entityFolder = workspace:FindFirstChild("Entities")
	entityFolder.ChildAdded:Connect(function(entity)
		label.Text = entity.Name.." has spawned!"
		task.wait(5)
		label.Text = "Entity Notifier (Can't Notify A-150)"
	end)
	
	
	CloseButton.MouseButton1Click:Connect(close)
	walkspeedbutton.MouseButton1Click:Connect(setWalkSpeed)
	walkspeedbutton2.MouseButton1Click:Connect(teleportToLatestRoom)
end

NewGui()
