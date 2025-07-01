-- Saint Haven Monastery Treasure Warehouse
 
require "botWorker"
 
function GetBotWorker()
	local bW = BotWorker('Event_4Room_W')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:KillMobs(10000)
	bW:WalkTo(-89, 0, 314) 

	bW:UseProp(791)
	 
	bW:UseProp(228)

	 
	bW:Wait(5000)
	 
	return bW
end