require "botWorker"
require "basic"
local worker = nil
function GetBunnyWorker()
	local bunnyWorker = BotWorker(GetMapName())

	bunnyWorker:Wait(10000)
	bunnyWorker:UseLastSpawnedProp()
	bunnyWorker:Wait(5000)
	bunnyWorker:LootItems(10000)
	bunnyWorker:ClearStage()

	return bunnyWorker
end

function OnTick()
	if worker and botManager.isEnabled then
		worker:tick()
	end
end

function OnBunny()
	worker = nil
	if botManager.isEnabled then
		worker = GetBunnyWorker()
	end
end

function OnStopBot()
	if worker then
		worker = nil
	end
end