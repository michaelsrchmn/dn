-- Spirit Grave Tomb Map 1
require "botWorker"
function GetBotWorker()
	local bW = BotWorker('37_2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:Teleport(2520, 307, -707)
	bW:Wait(2000)
	--bW:KillMobByName('Ruin Guardian')
	--bW:KillMobByName('Looter Gargoyle Mage')
	bW:KillMobs(1500)
	bW:Wait(5000)

	bW:EnterGate('37_3A')

	return bW
end
