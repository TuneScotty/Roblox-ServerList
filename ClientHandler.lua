local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServersStack = ReplicatedStorage.ServersStack

  local function MSGServerList()

	local ServerButtons = {}

	for i, sv in pairs(ServersStack:GetChildren()) do
		local name = sv.Name
		local Stats = string.split(sv.Value, " ")
		local ServerID = Stats[1]
		local plramount = Stats[2]

		local ServerB = script.Server:Clone() -- ServerB type is a frame that contains a "JoinButton" type button.

		for i, ServerB in pairs(ServerButtons) do
			table.insert(ServerButtons, ServerB)
		end

		ServerB.JoinButton.MouseButton1Click:Connect(function()
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, ServerID)
		end)
	end
end

MSGServerList()

ServersStack.ChildAdded:Connect(MSGServerList)
ServersStack.ChildRemoved:Connect(MSGServerList)
