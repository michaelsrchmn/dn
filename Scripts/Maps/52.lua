-- Shadow Forest Trail Map 2

require "botWorker"
require "basic"
function GetBotWorker()
  local bW = BotWorker('1-2A')

  bW:WalkTo(377, -176, -983) 
  bW:KillMobs(1000)
  
  bW:WalkTo(-315, 16, 228) 

  bW:WalkTo(32, 43, 1529) 
  bW:KillMobs(1000)

  bW:WalkTo(1499, -69, 1894) 
  --bW:EnterGate('1-BossA')
  --[[bW:Teleport(279,-168,-955)
  bW:KillMobs(1000)
  
  bW:Teleport(323,89,1412)
  bW:KillMobs(1000)--]]

  return bW
end
