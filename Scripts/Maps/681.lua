-- Queen's Garden Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('68_1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-3518, 536, -4608)
	bW:Teleport(-4017, 554, -246)
	bW:WalkTo(-4113, 590, 371)
	bW:KillMobs(2500)
	bW:Wait(2000)

	bW:Teleport(221, 818, 5096)
	bW:WalkTo(2652, 816, 5450)
	bW:KillMobs(2500)
	bW:Wait(2000)

	bW:Teleport(5730, 1070, 3189)
	bW:WalkTo(5768, 1206, 1651)
	bW:KillMobs(2000)

	bW:WalkTo(5826, 1202, 882)
	bW:Wait(7000)
	bW:KillMobByName("Jamila Queen of Greed")
	bW:Finish()

	return bW
end
