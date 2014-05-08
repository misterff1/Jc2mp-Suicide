-- Suicide version 1.0  |  by Misterff1

PlayerSuicide = function(args)
	local msg = args.text
	local player = args.player
 
	if ( msg:sub(1, 1) ~= "/" ) then
		return true
	end
 
	local cmdargs = args.text:split(" ")
 
	if (cmdargs[1] == "/suicide") then
		if args.player:GetWorld() ~= DefaultWorld then -- Remove this check if you want the command to work in all worlds
			Chat:Send(player, "You can only suicide in the defaultworld!", Color(255, 0, 0))
		else
		
		-- Spawning the explosion twice so the player and nearby players all see the explosion and are damaged by it
		Network:SendNearby(args.player, "SuicideStart", args.player:GetPosition())
		Network:Send(args.player, "SuicideStart", args.player:GetPosition())
		player:SetHealth(0) -- This will make sure you die even if you are set invulnerable. Recommended to keep enabled
		Chat:Send(player, "You blew up! Are you happy now?", Color(0, 255, 0)) -- Shows in chat everytime you suicide
		end
end
		return false

end
Events:Subscribe("PlayerChat", PlayerSuicide)
