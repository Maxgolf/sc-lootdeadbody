ESX                           = nil

local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterCommand("loot", function(source, args, raw)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if IsPlayerDead(closestPlayer) then 
		if closestPlayer ~= -1 and closestDistance <= 3.0 then
			OpenBodySearchMenu(closestPlayer)
		end
	end
end, false)






function OpenBodySearchMenu(player)
    TriggerEvent("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(player), GetPlayerName(player))
end
