-- Catacombs Hall Map 2

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('20-3A')
	bW:WalkTo(68, 0, -900)
	bW:KillMobs(1500)

	bW:WalkTo(-2626, 0, -732)
	--bW:Teleport(-2626, 0, -732)
	bW:KillMobs(2000)
	bW:UseProp(435)

	bW:WalkTo(-662, 0, -513)

	bW:WalkTo(33, 0, 2279)

	bW:WalkTo(3336, 0, 2318)
	--bW:Teleport(3336, 0, 2318)
	bW:KillMobs(2000)
	
	bW:WalkTo(3287, 0, 830)
	bW:WalkTo(2656, 0, 828) 

	--bW:EnterGate('20-BossA')

	return bW
end
