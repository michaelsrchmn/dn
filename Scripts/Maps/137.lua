-- Raiders Ambush Point Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('18-2A')
	--bW:WalkTo(-317, -751, 1)
	--bW:KillMobs(1000)
	--bW:DestroyProp(507)

	--bW:WalkTo(-221, -761, 895)
	--bW:KillMobs(1000)
	bW:AddMobToIgnoreList(0, "Willful Kobold Archer")
	bW:AddMobToIgnoreList(1, "Raider Kobold Archer")
	bW:AddMobToIgnoreList(2, "Aggressive Kobold Archer")
	bW:AddMobToIgnoreList(3, "Regenerating Kobold Archer")
	bW:AddMobToIgnoreList(4, "Durable Kobold Archer")
	bW:AddMobToIgnoreList(5, "Speedy Kobold Archer")
	bW:AddMobToIgnoreList(6, "Destructive Kobold Archer")
	bW:WalkTo(-1283, -751, 73) 
	bW:KillMobs(2000)
	bW:WalkTo(-201, -751, 251) 
	bW:DestroyProp(507)
	bW:WalkTo(-381, -761, 923) 
	bW:RemoveMobFromIgnoreList(0)
	bW:RemoveMobFromIgnoreList(1)
	bW:RemoveMobFromIgnoreList(2)
	bW:RemoveMobFromIgnoreList(3)
	bW:RemoveMobFromIgnoreList(4)
	bW:RemoveMobFromIgnoreList(5)
	bW:RemoveMobFromIgnoreList(6)
	bW:KillMobs(2000)

	--bW:UseProp(499)

	bW:WalkTo(-198, -735, -1388)
	bW:DestroyProp(479)

	bW:WalkTo(681, -604, -2187)
	bW:KillMobs(1000)

	bW:WalkTo(1640, -475, -471)
	bW:KillMobs(3000)
	
	bW:WalkTo(2603, -475, 594) -- gate

	--bW:EnterGate('18-BossA')

	return bW
end