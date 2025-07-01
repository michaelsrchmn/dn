-- Meteor Crash Site Boundries

require "botWorker"

function GetBotWorker()
	local bW = BotWorker('60_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-4973, 736, -6601) 
	bW:WalkTo(-2362, 686, -7227) 
	bW:KillMobs(2000)
	bW:WalkTo(33, 659, -6300) 
	bW:KillMobs(2500)
	bW:WalkTo(1212, 605, -4168) 
	bW:Wait(5000)
	bW:KillMobs(1500)
	bW:WalkTo(-550, 420, -1994) 
	bW:KillMobs(2000)
	bW:WalkTo(-940, 321, -81) 
	bW:Wait(3000)
	bW:KillMobs(3000)
	bW:WalkTo(-279, -69, 6964) 
	bW:KillMobByName('Pixie Queen Permuda')
	
	return bW
end