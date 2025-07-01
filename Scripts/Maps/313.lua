-- Abandoned Welton Hollow Map 1

require "botWorker"
require "basic"
function GetBotWorker()
	local bW = BotWorker('31_3A')
	bW:DestroyProp(1211)
	bW:DestroyProp(1212)
	bW:DestroyProp(1213)
	bW:DestroyProp(279)
	bW:WalkTo(-3783, -1299, 3327)
	bW:KillMobs(1500)

	bW:WalkTo(-2826, -1285, 3369)

	bW:WalkTo(-1731, -1327, 3882)
	bW:KillMobs(1000)

	bW:WalkTo(-1657, -1276, 2880)

	bW:WalkTo(499, -1193, 1407)

	bW:WalkTo(531, -1156, -154)
	bW:KillMobs(1500)
	bW:UseProp(1200)

	bW:WalkTo(1211, -1179, -1380)

	bW:WalkTo(3621, -1928, -2786)
	bW:KillMobs(1000)

	bW:WalkTo(4447, -2123, -2129)

	bW:WalkTo(6189, -2353, -3293)
	bW:KillMobs(2000)
	
	bW:WalkTo(6733, -2364, -2226) --v
	bW:WalkTo(5707, -2091, -781)
	bW:WalkTo(6129, -2070, -166) -- gate
	--bW:EnterGate('31_BossA')
	return bW
end

