-- Shadow Forest Core Map 2

require "botWorker"
function GetBotWorker()
  local bW = BotWorker('4-2A')
  bW:WalkTo(-164,-85,-1436)
  bW:KillMobs(1000)

  bW:WalkTo(1344, -114, -667)
  bW:KillMobs(1000)

  bW:WalkTo(2507, -27, -959)
  
  --bW:Teleport(323, -138, -1145) 
  --[[bW:WalkTo(-164,-85,-1436)
  bW:KillMobs(1000)
  
  bW:Teleport(1611, -92, -556) 
  bW:KillMobs(1000)--]]

  return bW
end
