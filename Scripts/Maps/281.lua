-- Dark Overlord Keep 1 (281.lua)

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('28_1A')
	if profileManager.bDungeonCompletionAB then
		bW:Wait(GetDungeonCompletionWait())
	end
	bW:WalkTo(147, 127,-1610)
	bW:KillMobs(1500)
	bW:Wait(1000)
	bW:KillMobs(1500)

	bW:WalkTo(-1237, 196, -1673)

	bW:WalkTo(-3115, 435, -1477)
	
	bW:AddMobToIgnoreList(1, 'Worshiper Armored Hound')
	bW:WalkTo(-3344, 718, -74)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:RemoveMobFromIgnoreList(1)

	bW:WalkTo(-1890, 1019, 197)
	--bW:KillMobs(800)

	bW:WalkTo(-1170, 1065, 214)
	bW:KillMobs(800)
	bW:Wait(2000)
	bW:KillMobs(800)

	bW:IgnoreMobs(true)
	bW:WalkTo(-1067, 1066, 725)
	bW:WalkTo(-1004, 1062, 1916)
	bW:WalkTo(-980, 1074, 2746) 
	bW:DestroyProp(551)
	bW:IgnoreMobs(false)
	bW:KillMobs(3000)
	bW:Wait(4000)
	bW:KillMobs(3000)
	bW:WalkTo(-1383, 1081, 3006) -- gate
	
	return bW
end