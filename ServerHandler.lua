-- Insert as a script child a string value 'ServerName' with two attributes; Id,Players.
-- Create inside ReplicatedStorage an empty folder named 'ServerStack'.

local ms = game:GetService("MessagingService")
local ServerStack = game.ReplicatedStorage:WaitForChild("ServerStack")

ms:SubscribeAsync("ServerList", function(datastack)

	datastack = datastack.Data	
	
	if datastack.serverId ~= game.JobId then
		local svalues = script.ServerName:Clone()
		svalues.Name = "Server" .. #ServerStack:GetChildren() + 1
		svalues.Value = datastack.serverId 
		svalues.Parent = ServerStack
		wait(5)
		svalues:Destroy()
	end
end)

while game.VIPServerId == "" do
  
	local data = {
		ServerId = game.JobId,
		players = #game.Players:GetPlayers()
	}
  
	ms:PublishAsync("ServerList", data)
	wait(5)
end
