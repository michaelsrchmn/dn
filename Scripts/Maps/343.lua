-- Flooded Downstream Ruins Map 2 (343.lua)

require "botWorker"
function GetBotWorker()
	local bW = BotWorker('34_3A')
	bW:WalkTo(1153, -580, 1686) 
	bW:UseFDRProp("Looter Brother Ice Mage")
	bW:Wait(500)
	bW:WalkTo(1420, -270, 3455) 
	bW:KillMobs(2000)
	bW:WalkTo(770, -281, 3441) 
	bW:WalkTo(372, -230, 3455) 
	bW:ForwardTime(1000)
	bW:WalkTo(-277, -150, 3532) 
	bW:WalkTo(-4059, 433, 3681) 
	bW:KillMobByName("Looter Brother Ice Mage")
	bW:KillMobByName("Ruin Guardian")
	bW:KillMobs(10000)
	bW:WalkTo(-6599, 446, 3588) -- gate

	return bW
end 