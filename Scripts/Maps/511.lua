-- Riverwort Village Ruins

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('51-1A')
	if profileManager.bDungeonCompletionAB then
		actorSelf:MoveForward(false)
		bW:Wait(GetDungeonCompletionWait())
	end
	--[[---------Teleport-----------
	bW:WalkTo(-3345, 851, -2926)
	bW:WalkTo(-4904, 912, -1111)
	--bW:WalkTo(-5041, 917, -859)
	bW:Wait(3000)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(-5179, 969, 2186)
	--Teleport(-5179, 969, 2186)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:Teleport(-6129, 1189, 4041)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(-6022, 1289, 5816)
	bW:Teleport(-3047, 1558, 6515)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:Teleport(8446, 1643, -8230)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(8408, 1261, -5829)
	bW:WalkTo(8089, 1261, -4584)
	bW:KillMobs(2000)
	bW:Wait(3000)

	--bW:Teleport(2478, 2469, 1581)
	--bW:Teleport(10049, 1261, -6374)
	bW:Teleport(9408, 1261, -6358)
	bW:WalkTo(10049, 1261, -6357)
	bW:Wait(10000)
	bW:WalkTo(2579, 2469, 3044)
	bW:KillMobByName('Bishop Hermaton')
	bW:Finish()--]]
	--------NON-Teleport--------
	bW:WalkTo(-4217, 899, -1955)
	bW:WalkTo(-5159, 941, 1981) 
	bW:KillMobs(10000)
	--bW:WalkTo(-6305, 1268, 5149) 
	--bW:KillMobs(2000)
	bW:WalkTo(-4137, 1550, 6107)
	bW:KillMobs(2000)
	bW:WalkTo(-2501, 1557, 6712) 
	bW:ForwardPropTime(393, 2000)
	bW:ForwardPropTime(1099, 3500)
	bW:KillMobs(2000)
	bW:WalkTo(8362, 1261, -5922) 
	bW:Wait(2000)
	bW:ForwardPropTime(698, 5000)
	--bW:WalkTo(8308, 1267, -3760) 
	--bW:Wait(2000)
	bW:Wait(2000)
    --bW:WalkTo (8187, 1267, -2920)
    bW:MoveForward(8160, 1267, -3006)
    bW:Wait(1000)
    --bW:KillInAreaF(1000, 10000, 8160, 1267, -3006)
	bW:KillInAreaFByName('Jungle Assay Lich', 1000, 10000, 8160, 1267, -3006)
	bW:KillInAreaF(1000, 10000, 8160, 1267, -3006)
    bW:MoveForward(8062, 1262, -4839)
    bW:MoveForward(8543, 1270, -6413)
    bW:MoveForward(9730, 1263, -6355)
    bW:ForwardPropTime(395, 2000)
    bW:Wait(1000)
    bW:KillMobByName("Bishop Hermaton")
	bW:Wait(1000)
	bW:KillMobByName("Bishop Hermaton")
	bW:KillMobs(2000)
	return bW
end

function OnSpawnProp()
	if GetLastPropSpawn() == 698 then
		UseProp(698)
	elseif GetLastPropSpawn() == 734 then
		UseProp(734)
	end
end