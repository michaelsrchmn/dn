local bW
local scriptLoaded

function OnLoad()
	print("Basic Dungeon Bot Loaded - created by svinx")
	scriptLoaded = false
end

function OnUnload()
	if bW then
		bW = nil
	end
	scriptLoaded = nil
end

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function dofile (filename)
  local f = assert(loadfile(filename))
  return f()
end

function LoadMapScript()
	print("In LoadMapScript()")
	if bW then
		bW = nil
	end
	local mapID = GetMapID()
	local strPath = string.format("%s\\Scripts\\Maps\\%i.lua",mainDir,mapID)
	print(string.format("Loading Map Script: %i.lua", mapID))
	if strPath ~= nil and file_exists(strPath) then
		print("The map script exists")
		dofile(strPath)
		if not IsGoingToMap() then
			print("Starting Map Script")
			bW = GetBotWorker()
		end
	end
end

function OnChangeMap()
	--print("OnChangeMap")
	if botManager.isEnabled then
		if profileManager.botType ==  BOT_REPEAT_DUNGEON or profileManager.botType == BOT_AUTO_SELECT_DUNGEON then
			print("Basic Dungeon Bot OnChangeMap")
			LoadMapScript()
		end
	end
end

function OnStartBot()
	--if botManager.isEnabled then
		if profileManager.botType ==  BOT_REPEAT_DUNGEON or profileManager.botType == BOT_AUTO_SELECT_DUNGEON then
			print("Starting Basic Dungeon Bot")
			LoadMapScript()
		end
	--end
end

function OnStopBot()
	--if botManager.isEnabled == false then
		if profileManager.botType ==  BOT_REPEAT_DUNGEON or profileManager.botType == BOT_AUTO_SELECT_DUNGEON then
			print("Stopping Basic Dungeon Bot")
			if bW then
				bW = nil
			end
		end
	--end
end

function OnTick()
	if bW then
		bW:tick()
	end
end