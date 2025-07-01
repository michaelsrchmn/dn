-- Death Basin Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('24-2A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(-2397, -649, 2183)
	--bW:Teleport(-2397, -649, 2183)
	bW:KillMobs(2000)
	bW:UseProp(613)

	bW:WalkTo(-56, -753, 727)
	--bW:Teleport(-56, -753, 727)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(1234, -855, -319)
	--bW:Teleport(1234, -855, -319)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(1738, -858, -767)
	--bW:Teleport(1738, -858, -767)
	bW:Wait(5000)
	bW:KillMobs(2000)

	bW:WalkTo(1672, -858, -648)

	bW:WalkTo(2012, -858, -976)

	bW:WalkTo(3088, -858, -2127)
	--bW:Teleport(3088, -858, -2127)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(4098, -858, -3420) -- gate
	--bW:EnterGate('24-3A')

	return bW
end
