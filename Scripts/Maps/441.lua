--Nameless Tyrant Tomb (441.lua)

require "botWorker"

function GetBotWorker()
	local bW = BotWorker('44-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	bW:Teleport(626, 261, 4255) 
	bW:ForwardTime(500)--]]
	--------NON-Teleport--------
	bW:WalkTo(-2199, 2410, 218) 
	bW:KillMobs(2000)
	bW:WalkTo(-163, 1656, -297) 
	bW:KillMobs(2000)
	bW:WalkTo(2018, 1536, 1189) 
	bW:KillMobs(2000)
	bW:IgnoreMobs(true)
	bW:WalkTo(-36, 809, 2295)
	bW:IgnoreMobs(false)
	bW:KillMobs(2000)
	bW:WalkTo(-217, 781, 3351) 
	bW:WalkTo(83, 780, 3647) 
	bW:ForwardTime(4000)
	return bW
end