--Tel Rosa City Map 1
--Map ID 731, 73_1A

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('73_1A')

	--bW:Teleport(313, -827, 3149) 
	bW:WalkTo(313, -827, 3149)
	bW:KillMobs(5000)
	bW:Wait(1000)

	--bW:Teleport(732, -1205, -410) 
	bW:WalkTo(732,-1205,-410)
	bW:WalkTo(863, -1219, -737) 
	bW:KillMobs(5000)
	bW:Wait(1000)
	bW:KillMobs(5000)
	bW:Wait(1000)

	--bW:Teleport(-1288, -1309, -1115) 
	bW:WalkTo(-1288,-1309,-1115)
	bW:WalkTo(-1457, -1309, -1115) 
	bW:KillMobs(2500)
	bW:Wait(5000)
	bW:KillMobs(2500)
	bW:Wait(2000)
	bW:KillMobs(2500)

	--bW:Teleport(-2006, -1307, 954) 
	bW:WalkTo(-2006, -1307, 954)
	bW:WalkTo(-2197, -1310, 1034)  --stuck
	bW:KillMobs(5000)
	bW:Wait(3000)
	bW:KillMobs(5000)
	bW:Wait(3000)
	bW:KillMobs(5000)
	bW:Wait(1000)

	--bW:Teleport(-3664, -1309, -826) 
	bW:WalkTo(-3664, -1309, -826)
	bW:WalkTo(-4401, -1303, -1225) 
	bW:KillMobs(2500)
	bW:Wait(1000)

	--bW:Teleport(-3391, -1942, -2924) 
	bW:WalkTo(-3391, -1942, -2924)
	bW:WalkTo(-3095, -2000, -3350) 
	bW:KillMobs(2500)
	bW:Wait(1000)
	bW:KillMobs(2000)
	bW:Wait(1000)

	bW:WalkTo(-2036, -1997, -3522) 
	bW:KillMobs(2500)
	bW:Wait(1000)

	--bW:Teleport(-1623, -2836, -5110) 
	bW:WalkTo(-1623, -2836, -5110)
	bW:WalkTo(-2007, -2925, -5286) 
	--bW:KillMobByName('Commander Warlord Borin')
	bW:KillMobByName('Strider Coupe')
	--bW:Finish()

	return bW
end