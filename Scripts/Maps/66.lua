--Shadow Forest Core Map 1

require "botWorker"
function GetBotWorker()
  local bW = BotWorker('4-1A')

  --bW:WalkTo(299,-147,-1176)
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(645,-157,-1196)
	bW:KillMobs(1000)

	bW:WalkTo(1434, -137, -971)
	bW:KillMobs(1000)

	bW:WalkTo(1200,-119,241)
	bW:KillMobs(1000)

	bW:WalkTo(140,-174,672)
	bW:KillMobs(1000)
	
	bW:WalkTo(1715, -143, 2006)
  --bW:EnterGate('4-2A')
--[[
  bW:Teleport(1384, -118, -68) 
  bW:KillMobs(1000)
  
  bW:Teleport(78, -180, 768) 
  bW:KillMobs(1000)--]]
  

  return bW
end
