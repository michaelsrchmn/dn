require 'rcBot'
require 'maps'
require 'props'

local rcB
function OnLoad()
	rcB = RCBot(CALDEROCK_VILLAGE, CATACOMBS_HALL_1, '20-2A', WIND_FOREST, 'WindForest', "Catacombs Hall", "Catacombs Hall RCBot - created by svinx")
	rcB:SetProp(PROP_RC_CATACOMBS_HALL, 3247, 0, 3679)
end

function OnUnload()
	if rcB then
		rcB = nil
	end
end

function OnChangeMap()
	rcB:OnChangeMap()
end

function OnStartBot()
	rcB:OnStartBot()
end

function OnStopBot()
	rcB:OnStopBot()
end

function OnTick()
	rcB:OnTick()
end

function OnSpawnProp()
	rcB:OnSpawnProp()
end