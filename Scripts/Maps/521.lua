-- Ancient Library Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('55_1A')
	--bW:UseProp(781)
	--bW:UseProp(791)
	--bW:UseProp(615)
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:Teleport(-479, -312, 2288)
	bW:WalkTo(-499, -312, 2644)
	bW:Wait(10000)
	bW:UseProp(826)



	return bW
end
