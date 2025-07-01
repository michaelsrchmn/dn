require "basic"
BA_WALK = 1
BA_KILL = 2
BA_GATE = 3
BA_INITNPC = 4
BA_FINISH = 5
BA_MOVEFORWARD = 6
BA_USEPROP = 7
BA_WAIT = 8
BA_DESTROYPROP = 9
BA_TELEPORT = 10
BA_KILLMOBBYNAME = 11
BA_ATTACKPROP = 12
BA_REPEATDUNGEON = 13
BA_GOTODUNGEON = 14
BA_ENTERGATEBYMAPID = 15
BA_LOOTITEMS = 16
BA_USE_LAST_SPAWNED_PROP = 17
BA_CLEAR_STAGE = 18
BA_GOTOMAP = 19
BA_GOTOMAPID = 20
BA_GOTODUNGEONID = 21
BA_RETURNTOTOWN = 22
BA_RETURNTOSTAGEENTRANCE = 23
BA_INITNPCBYXYZ = 24
BA_FORWARD = 25
BA_IGNOREMOBS = 26
BA_KILLMOBSY = 27
BA_FORWARDTIME = 28
BA_ATTACKPROPTIME = 29
BA_FORWARDPROPTIME = 30
BA_FORWARDOPT = 31
BA_KILLMOBNAMERANGE = 32
BA_ADDMOBTOIGNORELIST = 33
BA_REMOVEMOBFROMIGNORELIST = 34
BA_KILLMOBBYNAMEHP = 35
BA_USEFDRPROP = 36
BA_KILLINAREA = 39
BA_KILLINAREAFORWARD = 40
BA_KILLFORWARD = 41
BA_KILLINAREAFORWARDNAME = 42
class 'BotWorker'
function BotWorker:__init(_mapName)
    self.mapName = _mapName
    self.works = {}
    self.paused=false
    self.curWork = 1
    self.bError = false
	self.timer = 0
	self.counter = 0
	self.bMoveToMob = false
	self.printCommand = true
	self.ignoreMobs = false
	self.bMoveToItem = false
	self.savedHP = 0
	self.check = false
    self.hpCheck = 0
    self.done = false
    self.lootMode = false
end


function BotWorker:nextWork()
	--print("nextwork")
  self.curWork = self.curWork+1
end

function BotWorker:triggerError()
  self.bError = true
  print("BotWorker Error!")
end

function BotWorker:doWork(work,arg)
	--print("dowork")
	if botManager.isEnabled == false then
		return true
	end
	if work == BA_WALK then
		if self.printCommand then
			print(string.format("BotWorker::WalkTo(%i,%i,%i)",arg.x,arg.y,arg.z))
			self.printCommand = false
		end
		if self.bMoveToMob then
			ResetMoveTo()
			self.bMoveToMob = false
		end
		if not self.ignoreMobs and actorSelf.isRangedAttack and not IsInTown() then
			local target = GetNearestMobY(250, 100)
			if target then
				PointAndShoot(target.pos)
				--UseSkills()
				--PointAndShootActor(target)
				return false
			end
		elseif not self.ignoreMobs and actorSelf.isCloseAttack and not IsInTown() then
			local target = GetNearestMobY(250, 100)
			if target then
				PointAndShoot(target.pos)
				--UseSkills()
				return false
			end
		end
		if MoveSelf(arg) then
			ResetMoveTo()
			return true
		end
		return false
	elseif work == BA_KILL then
        if self.printCommand then
            print(string.format("BotWorker::KillMobs(%i)",arg))
            self.printCommand = false
            self.timer = GetTickCount()
            self.done = false
            self.hpCheck = 0
        end
        local target = GetNearestMob(arg)
        local drop = GetNearestItem(arg)
        if drop == nil and target == nil then
            --print("No Drop & Mob! Moving on...")
            return true
        else
            if self.hpCheck >= 5 then
                print("Mob glitch detected! Adding mob to ignore list...")
                AddMobUIDToIgnoreList(target.uid)
				self.hpCheck = 0
                return false
            end
            if self.done == true and GetTickCount() >= self.timer + 10000 and target ~= nil then
                if target.hp == self.savedHP then
                    print("hpCheck +1!")
                    self.hpCheck = self.hpCheck + 1
                    self.savedHP = target.hp
                    self.timer = GetTickCount()
                    self.done = false
                    return false
                end
                if target.hp ~= self.savedHP then
                    self.savedHP = target.hp
                    self.done = false
                    self.timer = self.timer + 15000
                    return false
                end
                return false
            end
            if drop ~= nil then
                if actorSelf:getDistance(drop.pos) > 500 then
                    self.lootMode = true
                end
            end
            if target == nil and drop ~= nil then
                self.lootMode = true
            end
            if self.lootMode == true then
                if drop == nil then
                    ResetMoveTo()
                    self.lootMode = false
                    return false
                end
                if actorSelf:getDistance(drop.pos) > 150 then
                    MoveSelfToDrop(drop.pos)
                    return false
                end
            end
            if target ~= nil then
                local distance = actorSelf:getDistance(target.pos)
                if target.isFlower and actorSelf.isRangedAttack then
                    if distance < 300 then
                        PointAndShoot(target.pos)
                    end
                    self.bMoveToMob = true
                    MoveSelf(target.pos)
                    return false
                elseif distance > 500 and actorSelf.isRangedAttack then
                    self.bMoveToMob = true
                    MoveSelf(target.pos)
                    return false
                elseif distance > 300 and actorSelf.isCloseAttack then
                    self.bMoveToMob = true
                    MoveSelf(target.pos)
                    return false
                else
                    PointAndShoot(target.pos)
                    self.done = true
                    return false
                end
                return false
            end
        end 
	elseif work == BA_FORWARDOPT then
		actorSelf:MoveForward(option)
		return true
	elseif work == BA_KILLMOBSY then
        if self.printCommand then
            print(string.format("BotWorker::KillMobsY(%i,%i)",arg.range,arg.maxY))
            self.printCommand = false
            self.timer = GetTickCount()
            self.done = false
            self.hpCheck = 0
        end
        local target = GetNearestMobY(arg.range, arg.maxY)
        local drop = GetNearestItem(arg.range)
        if drop == nil and target == nil then
            --print("No Drop & Mob! Moving on...")
            return true
        else
            if self.hpCheck >= 5 then
                print("Mob glitch detected! Adding mob to ignore list...")
                AddMobUIDToIgnoreList(target.uid)
				self.hpCheck = 0
                return false
            end
            if self.done == true and GetTickCount() >= self.timer + 10000 and target ~= nil then
                if target.hp == self.savedHP then
                    print("hpCheck +1!")
                    self.hpCheck = self.hpCheck + 1
                    self.savedHP = target.hp
                    self.timer = GetTickCount()
                    self.done = false
                    return false
                end
                if target.hp ~= self.savedHP then
                    self.savedHP = target.hp
                    self.done = false
                    self.timer = self.timer + 15000
                    return false
                end
                return false
            end
            if drop ~= nil then
                if actorSelf:getDistance(drop.pos) > 500 then
                    self.lootMode = true
                end
            end
            if target == nil and drop ~= nil then
                self.lootMode = true
            end
            if self.lootMode == true then
                if drop == nil then
                    ResetMoveTo()
                    self.lootMode = false
                    return false
                end
                if actorSelf:getDistance(drop.pos) > 150 then
                    MoveSelfToDrop(drop.pos)
                    return false
                end
            end
            if target ~= nil then
                local distance = actorSelf:getDistance(target.pos)
                if target.isFlower and actorSelf.isRangedAttack then
                    if distance < 300 then
                        PointAndShoot(target.pos)
                    end
                    self.bMoveToMob = true
                    MoveSelf(target.pos)
                    return false
                elseif distance > 500 and actorSelf.isRangedAttack then
                    self.bMoveToMob = true
                    MoveSelf(target.pos)
                    return false
                elseif distance > 300 and actorSelf.isCloseAttack then
                    self.bMoveToMob = true
                    MoveSelf(target.pos)
                    return false
                else
                    PointAndShoot(target.pos)
                    self.done = true
                    return false
                end
                return false
            end
        end 
	elseif work == BA_LOOTITEMS then
		if self.printCommand then
			print(string.format("BotWorker::LootItems(%i)",arg))
			self.printCommand = false
		end
		local drop = GetNearestItem(arg)
		if drop == nil then
			if self.bMoveToItem then
				ResetMoveTo()
				--actorSelf:MoveForward(false)
				self.bMoveToItem = false
			end
			return true
		else
			local dDistance = actorSelf:getDistance(drop.pos)
			if dDistance > 150 then
				MoveSelfToDrop(drop.pos)
				self.bMoveToItem = true
				return false
			--[[elseif dDistance > 75 then
				MoveForward(drop.pos)
				self.bMoveToItem = true
				return false--]]
			else
				self.bMoveToItem = false
				ResetMoveTo()
				--actorSelf:MoveForward(false)
			end
			return false
		end
		--LootItem(drop)
		return false
	elseif work == BA_KILLMOBBYNAME then
        if self.printCommand then
            print(string.format("BotWorker::KillMobByName(%s)",arg))
            self.printCommand = false
            self.timer = GetTickCount()
            self.done = false
            self.hpCheck = 0
        end
        local target = actorManager:getActor(arg)
        if target == nil or target.hp == 0 then
            return true
        else
            local distance = actorSelf:getDistance(target.pos)
            if self.hpCheck >= 5 then
                print("Mob glitch detected! Adding mob to ignore list...")
                AddMobUIDToIgnoreList(target.uid)
				self.hpCheck = 0
                return false
            end
            if self.done == true and GetTickCount() >= self.timer + 10000 and target ~= nil then
                if target.hp == self.savedHP then
                    print("hpCheck +1!")
                    self.hpCheck = self.hpCheck + 1
                    self.savedHP = target.hp
                    self.timer = GetTickCount()
                    self.done = false
                    return false
                end
                if target.hp ~= self.savedHP then
                    self.savedHP = target.hp
                    self.done = false
                    self.timer = self.timer + 15000
                    return false
                end
                return false
            end
            if distance > 500 and actorSelf.isRangedAttack then
                self.bMoveToMob = true
                MoveSelfToMob(target.pos)
                return false
            elseif distance > 300 and actorSelf.isCloseAttack then
                self.bMoveToMob = true
                MoveSelfToMob(target.pos)
                return false
            end
        end
        if self.bMoveToMob then
            ResetMoveTo()
            self.bMoveToMob = false
        end
        PointAndShoot(target.pos)
        self.done = true
        --UseSkills()
        return false 
	elseif work == BA_KILLMOBNAMERANGE then
		if self.printCommand then
			print(string.format("BotWorker::KillMobByNameR(%s, %i)",arg.name, arg.range))
			self.printCommand = false
		end
		local target = GetNearestMobByName(arg.name, arg.range)
		if target == nil or target.hp == 0 then
			return true
		else
			local distance = actorSelf:getDistance(target.pos)
			if distance > 500 and actorSelf.isRangedAttack then
				self.bMoveToMob = true
				MoveSelfToMob(target.pos)
				return false
			elseif distance > 300 and actorSelf.isCloseAttack then
				self.bMoveToMob = true
				MoveSelfToMob(target.pos)
				return false
			end
		end
		if self.bMoveToMob then
			ResetMoveTo()
			self.bMoveToMob = false
		end
		PointAndShoot(target.pos)
		return false
	elseif work == BA_GATE then
		if self.printCommand then
			print(string.format("BotWorker::EnterGate(%s)",arg))
			self.printCommand = false
		end
		local target = GetNearestMob(10000)
		if target == nil then
			if EnterGate(arg) then
				return true
			else
				--PrintToChat("Enter gate failed")
				return false
			end
		else
			--PrintToChat("More targets")
			self:KillMobs(10000)
			self:EnterGate(arg)
			return true
		end
	elseif work == BA_INITNPC then
		if self.printCommand then
			print(string.format("BotWorker::InitNPC(%s)",arg))
			self.printCommand = false
		end
		if IsTalkingToNpc() == false then
			--PrintToChat("Not talking to NPC")
			if InitNpcDlg(arg) then
				return true
			elseif InitNpcDlg(arg) == false then
				return false
			end
		elseif IsTalkingToNpc() == true then
			--PrintToChat("Already talking to NPC")
			return true
		end
	elseif work == BA_INITNPCBYXYZ then
		if self.printCommand then
			print(string.format("BotWorker::InitNPCXYZ(%i,%i,%i)",arg.x,arg.y,arg.z))
			self.printCommand = false
		end
		if not IsTalkingToNpc() then
			print("Not talking to NPC")
			local actor = actorManager:getActor(arg.x, arg.y, arg.z)
			if actor == nil then
				print("could not find actor at given coordinates")
				return false
			elseif InitNpcDlg(actor) then
				print("InitNpcDlg success")
				return true
			elseif not InitNpcDlg(actor) then
				print("InitNpcDlg fail")
				return false
			end
		elseif IsTalkingToNpc() then
			print("Already talking to NPC")
			return true
		end
	elseif work == BA_FINISH then
        local target = GetNearestMob(10000)
        if target then
            self:KillMobs(10000)
            return false
        else
            return true
        end
	elseif work == BA_USEPROP then
		if self.printCommand then
			print(string.format("BotWorker::UseProp(%i)",arg))
			self.printCommand = false
		end
		UseProp(arg)
		return true
	elseif work == BA_CLEAR_STAGE then
		if self.printCommand then
			print("BotWorker::ClearStage()")
			self.printCommand = false
		end
		ClearStage()
		return true
	elseif work == BA_ATTACKPROP then
		if self.printCommand then
			print(string.format("BotWorker::AttackProp(%i)",arg))
			self.printCommand = false
		end
		if self.counter == 50 then
			self.counter = 0
			return true
		else
			self.counter = self.counter + 1
			MoveSelf(GetPropPos(arg))
			PointAndShoot(GetPropPos(arg))
			return false
		end
	elseif work == BA_DESTROYPROP then
		if self.printCommand then
			print(string.format("BotWorker::DestroyProp(%i)",arg))
			self.printCommand = false
		end
		if IsProp(arg) then
			local distance = actorSelf:getDistance(GetPropPos(arg))
			if distance == 0 then
				return true
			else
				MoveSelf(GetPropPos(arg))
				PointAndShoot(GetPropPos(arg))
			return false
			end
		else
			return true
		end
	elseif work == BA_TELEPORT then
		if self.printCommand then
			print(string.format("BotWorker::Teleport(%i,%i,%i)",arg.x,arg.y,arg.z))
			self.printCommand = false
		end
		--print("BA_TELEPORT")
		actorSelf:Teleport(arg)
		return true
	elseif work == BA_REPEATDUNGEON then
		--RepeatDungeon()
		return true
	elseif work == BA_GOTODUNGEON then
		--print("BA_GOTODUNGEON")
		if GoToDungeon(arg) then
			print(string.format("Going to Dungeon: %s",arg))
		else
			print(string.format("GoToDungeon failed"))
		end
		return true
	elseif work == BA_GOTODUNGEONID then
		if GoToDungeon(arg) then
			print(string.format("Going to Dungeon: %i",arg))
		else
			print(string.format("GoToDungeon failed"))
		end
		return true
	elseif work == BA_GOTOMAP then
		if GoToMap(arg) then
			print(string.format("Going to Map: %s",arg))
		else
			print("GoToMap failed.")
		end
		return true
	elseif work == BA_GOTOMAPID then
		if GoToMap(arg) then
			print(string.format("Going to Map: %i",arg))
		else
			print("GoToMap failed.")
		end
		return true
	elseif work == BA_WAIT then
		if self.printCommand then
			print(string.format("BotWorker::Wait(%i)",arg))
			self.printCommand = false
		end
		if self.timer == 0 then
			self.timer = GetTickCount()
			botManager.bLuaWait = true
		end
		if GetTickCount() <= (self.timer + arg) then
			return false
		else
			print("Finished Waiting")
			botManager.bLuaWait = false
			self.timer = 0
			return true
		end
	elseif work == BA_USE_LAST_SPAWNED_PROP then
		if self.printCommand then
			print("BotWorker::UseLastProp()")
			self.printCommand = false
		end
		UseLastProp()
		return true
	elseif work == BA_RETURNTOTOWN then
		ReturnToTown()
		return true
	elseif work == BA_RETURNTOSTAGEENTRANCE then
		--print("work = return to stage")
		ReturnToStageEntrance()
		return true
	elseif work == BA_FORWARD then
		if self.printCommand then
			print(string.format("BotWorker::MoveForward(%i,%i,%i)",arg.x,arg.y,arg.z))
			self.printCommand = false
		end
		ResetMoveTo()
		return MoveForward(arg)
	elseif work == BA_FORWARDTIME then
		if self.printCommand then
			print(string.format("BotWorker::ForwardTime(%i)",arg))
			self.printCommand = false
			self.timer = GetTickCount()
		end
		actorSelf:MoveForward(true)
		if GetTickCount() <= (self.timer + arg) then
			return false
		else
			print(string.format("Finished Forward",arg))
			actorSelf:MoveForward(false)
			return true
		end
	elseif work == BA_ATTACKPROPTIME then
		if self.printCommand then
			print(string.format("BotWorker::AttackPropTime(%i, %i)", arg.propID, arg.t))
			self.printCommand = false
			self.timer = GetTickCount()
		end
		if GetTickCount() <= (self.timer + arg.t) then
			MoveSelf(GetPropPos(arg.propID))
			PointAndShoot(GetPropPos(arg.propID))
			return false
		else
			return true
		end
	elseif work == BA_FORWARDPROPTIME then
		if self.printCommand then
			print(string.format("BotWorker::ForwardPropTime(%i, %i)", arg.propID, arg.t))
			self.printCommand = false
			self.timer = GetTickCount()
		end
		Point(GetPropPos(arg.propID))
		actorSelf:MoveForward(true)
		if GetTickCount() <= (self.timer + arg.t) then
			return false
		else
			actorSelf:MoveForward(false)
			return true
		end
	elseif work == BA_ADDMOBTOIGNORELIST then
		AddMobToIgnoreList(arg.id, arg.name)		
		print(string.format("BotWorker::AddMobToIgnoreList(%s)", arg.name))		
		return true
	elseif work == BA_REMOVEMOBFROMIGNORELIST then
		RemoveMobFromIgnoreList(arg)
		print(string.format("BotWorker::RemoveMobFromIgnoreList(%i)", arg))				
		return true
	elseif work == BA_IGNOREMOBS then
		self.ignoreMobs = arg
		return true
	elseif work == BA_KILLMOBBYNAMEHP then
		local target = actorManager:getActor(arg)
		if self.printCommand and target ~= nil then
			print(string.format("BotWorker::KillMobByNameHP(%s)",arg))
			self.printCommand = false
			self.timer = GetTickCount()
			self.savedHP = target.hp
		end
		if target == nil or target.hp == 0 then
			self.savedHP = 0
			return true
		end
		if  GetTickCount() <= (self.timer + 5000) and target.hp ~= 0 then
			if target ~= nil or target.hp ~= 0 then
				local distance = actorSelf:getDistance(target.pos)
				if distance > 500 and actorSelf.isRangedAttack then
					self.bMoveToMob = true
					MoveSelfToMob(target.pos)
					return false
				elseif distance > 300 and actorSelf.isCloseAttack then
					self.bMoveToMob = true
					MoveSelfToMob(target.pos)
					return false
				end
				if target.hp < self.savedHP then
					self.timer = self.timer + 500
					print("Timer Added!")
				end
				if self.bMoveToMob then
					ResetMoveTo()
					self.bMoveToMob = false
				end
				PointAndShoot(target.pos)
				self.savedHP = target.hp
				--UseSkills()
				return false
			else
			--if self.savedHP ~= target.hp then
			--return false
				self.savedHP = 0
				print("time out")
				return true
			end
		else
			return true
		end
	elseif work == BA_KILLINAREA then
        if self.printCommand then
            print(string.format("BotWorker::KillInArea(%i,%i,%i,%i,%i)",arg.arange,arg.mrange,arg.x,arg.y,arg.z))
            self.printCommand = false
            self.timer = GetTickCount()
            self.done = false
            self.hpCheck = 0
        end
        local target = GetNearestMob(arg.mrange)
        local drop = GetNearestItem(arg.mrange)
        if drop == nil and target == nil then
            --print("No Drop & Mob! Moving on...")
            return true
        else
            if actorSelf:getDistance(D3DXVECTOR3(arg.x,arg.y,arg.z)) > arg.arange then
                MoveSelf(D3DXVECTOR3(arg.x, arg.y, arg.z))
                return false
            end
            if self.hpCheck >= 5 then
                print("Mob glitch detected! Adding mob to ignore list...")
                AddMobUIDToIgnoreList(target.uid)
				self.hpCheck = 0
                return false
            end
            if self.done == true and GetTickCount() >= self.timer + 10000 and target ~= nil then
                if target.hp == self.savedHP then
                    print("hpCheck +1!")
                    self.hpCheck = self.hpCheck + 1
                    self.savedHP = target.hp
                    self.timer = GetTickCount()
                    self.done = false
                    return false
                end
                if target.hp ~= self.savedHP then
                    self.savedHP = target.hp
                    self.done = false
                    self.timer = self.timer + 15000
                    return false
                end
                return false
            end
            if drop ~= nil then
                if actorSelf:getDistance(drop.pos) > 500 then
                    self.lootMode = true
                end
            end
            if target == nil and drop ~= nil then
                self.lootMode = true
            end
            if self.lootMode == true then
                if drop == nil then
                    ResetMoveTo()
                    self.lootMode = false
                    return false
                end
                if actorSelf:getDistance(drop.pos) > 150 then
                    MoveSelfToDrop(drop.pos)
                    return false
                end
            end
            if target ~= nil then
                local distance = actorSelf:getDistance(target.pos)
                if target.isFlower and actorSelf.isRangedAttack then
                    if distance < 300 then
                        PointAndShoot(target.pos)
                    end
                    self.bMoveToMob = true
                    MoveSelf(target.pos)
                    return false
                elseif distance > 500 and actorSelf.isRangedAttack then
                    self.bMoveToMob = true
                    MoveSelf(target.pos)
                    return false
                elseif distance > 300 and actorSelf.isCloseAttack then
                    self.bMoveToMob = true
                    MoveSelf(target.pos)
                    return false
                else
                    PointAndShoot(target.pos)
                    self.done = true
                    return false
                end
                return false
            end
        end
    elseif work == BA_KILLINAREAFORWARD then
        if self.printCommand then
            print(string.format("BotWorker::KillInAreaF(%i,%i,%i,%i,%i)",arg.arange,arg.mrange,arg.x,arg.y,arg.z))
            self.printCommand = false
            self.timer = GetTickCount()
            self.done = false
            self.hpCheck = 0
        end
        local target = GetNearestMob(arg.mrange)
        local drop = GetNearestItem(arg.mrange)
        if drop == nil and target == nil then
            --print("No Drop & Mob! Moving on...")
            return true
        else
            if actorSelf:getDistance(D3DXVECTOR3(arg.x,arg.y,arg.z)) > arg.arange then
                MoveForward(D3DXVECTOR3(arg.x, arg.y, arg.z))
                return false
            end
            if self.hpCheck >= 5 then
                print("Mob glitch detected! Adding mob to ignore list...")
                AddMobUIDToIgnoreList(target.uid)
				self.hpCheck = 0
                return false
            end
            if self.done == true and GetTickCount() >= self.timer + 10000 and target ~= nil then
                if target.hp == self.savedHP then
                    print("hpCheck +1!")
                    self.hpCheck = self.hpCheck + 1
                    self.savedHP = target.hp
                    self.timer = GetTickCount()
                    self.done = false
                    return false
                end
                if target.hp ~= self.savedHP then
                    self.savedHP = target.hp
                    self.done = false
                    self.timer = self.timer + 15000
                    return false
                end
                return false
            end
            if drop ~= nil then
                if actorSelf:getDistance(drop.pos) > 500 then
                    self.lootMode = true
                end
            end
            if target == nil and drop ~= nil then
                self.lootMode = true
            end
            if self.lootMode == true then
                if drop == nil then
                    ResetMoveTo()
                    self.lootMode = false
                    return false
                end
                if actorSelf:getDistance(drop.pos) > 150 then
                    MoveForward(drop.pos)
                    return false
                end
            end
            if target ~= nil then
                local distance = actorSelf:getDistance(target.pos)
                if target.isFlower and actorSelf.isRangedAttack then
                    if distance < 300 then
                        PointAndShoot(target.pos)
                    end
                    self.bMoveToMob = true
                    MoveForward(target.pos)
                    return false
                elseif distance > 500 and actorSelf.isRangedAttack then
                    self.bMoveToMob = true
                    MoveForward(target.pos)
                    return false
                elseif distance > 300 and actorSelf.isCloseAttack then
                    self.bMoveToMob = true
                    MoveForward(target.pos)
                    return false
                else
                    PointAndShoot(target.pos)
                    self.done = true
                    return false
                end
                return false
            end
        end
	elseif work == BA_KILLINAREAFORWARDNAME then
        if self.printCommand then
            print(string.format("BotWorker::KillInAreaFByName(%s,%i,%i,%i,%i,%i)",arg.name,arg.arange,arg.mrange,arg.x,arg.y,arg.z))
            self.printCommand = false
            self.timer = GetTickCount()
            self.done = false
            self.hpCheck = 0
        end
        local target = GetNearestMobByName(arg.name,arg.mrange)
        local drop = GetNearestItem(arg.mrange)
        if drop == nil and target == nil then
            --print("No Drop & Mob! Moving on...")
            return true
        else
            if actorSelf:getDistance(D3DXVECTOR3(arg.x,arg.y,arg.z)) > arg.arange then
                MoveForward(D3DXVECTOR3(arg.x, arg.y, arg.z))
                return false
            end
            if self.hpCheck >= 5 then
                print("Mob glitch detected! Adding mob to ignore list...")
                AddMobUIDToIgnoreList(target.uid)
				self.hpCheck = 0
                return false
            end
            if self.done == true and GetTickCount() >= self.timer + 10000 and target ~= nil then
                if target.hp == self.savedHP then
                    print("hpCheck +1!")
                    self.hpCheck = self.hpCheck + 1
                    self.savedHP = target.hp
                    self.timer = GetTickCount()
                    self.done = false
                    return false
                end
                if target.hp ~= self.savedHP then
                    self.savedHP = target.hp
                    self.done = false
                    self.timer = self.timer + 15000
                    return false
                end
                return false
            end
            if drop ~= nil then
                if actorSelf:getDistance(drop.pos) > 500 then
                    self.lootMode = true
                end
            end
            if target == nil and drop ~= nil then
                self.lootMode = true
            end
            if self.lootMode == true then
                if drop == nil then
                    ResetMoveTo()
                    self.lootMode = false
                    return false
                end
                if actorSelf:getDistance(drop.pos) > 150 then
                    MoveForward(drop.pos)
                    return false
                end
            end
            if target ~= nil then
                local distance = actorSelf:getDistance(target.pos)
                if target.isFlower and actorSelf.isRangedAttack then
                    if distance < 300 then
                        PointAndShoot(target.pos)
                    end
                    self.bMoveToMob = true
                    MoveForward(target.pos)
                    return false
                elseif distance > 500 and actorSelf.isRangedAttack then
                    self.bMoveToMob = true
                    MoveForward(target.pos)
                    return false
                elseif distance > 300 and actorSelf.isCloseAttack then
                    self.bMoveToMob = true
                    MoveForward(target.pos)
                    return false
                else
                    PointAndShoot(target.pos)
                    self.done = true
                    return false
                end
                return false
            end
        end
	elseif work == BA_KILLFORWARD then
        if self.printCommand then
            print(string.format("BotWorker::KillMobsF(%i)",arg))
            self.printCommand = false
            self.timer = GetTickCount()
            self.done = false
            self.hpCheck = 0
        end
        local target = GetNearestMob(arg)
        local drop = GetNearestItem(arg)
        if drop == nil and target == nil then
            --print("No Drop & Mob! Moving on...")
            return true
        else
            if self.hpCheck >= 5 then
                print("Mob glitch detected! Adding mob to ignore list...")
                AddMobUIDToIgnoreList(target.uid)
				self.hpCheck = 0
                return false
            end
            if self.done == true and GetTickCount() >= self.timer + 10000 and target ~= nil then
                if target.hp == self.savedHP then
                    print("hpCheck +1!")
                    self.hpCheck = self.hpCheck + 1
                    self.savedHP = target.hp
                    self.timer = GetTickCount()
                    self.done = false
                    return false
                end
                if target.hp ~= self.savedHP then
                    self.savedHP = target.hp
                    self.done = false
                    self.timer = self.timer + 15000
                    return false
                end
                return false
            end
            if drop ~= nil then
                if actorSelf:getDistance(drop.pos) > 500 then
                    self.lootMode = true
                end
            end
            if target == nil and drop ~= nil then
                self.lootMode = true
            end
            if self.lootMode == true then
                if drop == nil then
                    ResetMoveTo()
                    self.lootMode = false
                    return false
                end
                if actorSelf:getDistance(drop.pos) > 150 then
                    MoveForward(drop.pos)
                    return false
                end
            end
            if target ~= nil then
                local distance = actorSelf:getDistance(target.pos)
                if target.isFlower and actorSelf.isRangedAttack then
                    if distance < 300 then
                        PointAndShoot(target.pos)
                    end
                    self.bMoveToMob = true
                    MoveForward(target.pos)
                    return false
                elseif distance > 500 and actorSelf.isRangedAttack then
                    self.bMoveToMob = true
                    MoveForward(target.pos)
                    return false
                elseif distance > 300 and actorSelf.isCloseAttack then
                    self.bMoveToMob = true
                    MoveForward(target.pos)
                    return false
                else
                    PointAndShoot(target.pos)
                    self.done = true
                    return false
                end
                return false
            end
        end
	elseif work == BA_USEFDRPROP then
		local target = actorManager:getActor(arg)
		if self.printCommand then
			print(string.format("BotWorker::UseFDRProp(%s)",arg))
			self.printCommand = false
			self.optionone = 0
			self.optiontwo = 0
			self.optionthree = 0
			self.check = false
			end
		if self.check == false and target ~= nil then
			if self.optionone == 0 and IsPointInArea(target.pos, 800, 1200, 3900, 4200) then
				self.optionone = 1
				return false
			elseif self.optionone == 0 and IsPointInArea(target.pos, 1700, 2000, 4000, 4400) then
				self.optionone = 2
				return false
			elseif self.optionone == 0 and IsPointInArea(target.pos, 1900, 2300, 2900, 3300) then
				self.optionone = 3
				return false
			elseif self.optiontwo == 0 and self.optionone ~= 1 and IsPointInArea(target.pos, 800, 1200, 3900, 4200) then
				self.optiontwo = 1
				return false
			elseif self.optiontwo == 0 and self.optionone ~= 2 and IsPointInArea(target.pos, 1700, 2000, 4000, 4400) then
				self.optiontwo = 2
				return false
			elseif self.optiontwo == 0 and self.optionone ~= 3 and IsPointInArea(target.pos, 1900, 2300, 2900, 3300) then
				self.optiontwo = 3
				return false
			elseif self.optionthree == 0 and self.optionone ~= 1 and self.optiontwo ~= 1 and IsPointInArea(target.pos, 800, 1200, 3900, 4200) then
				self.optionthree = 1
				return false
			elseif self.optionthree == 0 and self.optionone ~= 2 and self.optiontwo ~= 2 and IsPointInArea(target.pos, 1700, 2000, 4000, 4400) then
				self.optionthree = 2
				return false
			elseif self.optionthree == 0 and self.optionone ~= 3 and self.optiontwo ~= 3 and IsPointInArea(target.pos, 1900, 2300, 2900, 3300) then
				self.optionthree = 3
				return false
			elseif self.optionone ~= 0 and self.optiontwo ~= 0 and self.optionthree ~= 0 and self.check == false then
			self.timer = GetTickCount() + 5000
			self.check = true
			print("Prop selection completed.")
			print("Using props....")
			print(string.format("(%i,%i,%i)",self.optionone,self.optiontwo,self.optionthree))
			end
		else
			if GetTickCount() >= self.timer and self.optionone == 1 and self.check == true then
				UseProp(277)
				print("Prop activated!")
				self.optionone = 0
				self.timer = self.timer + 1000
				return false
			elseif GetTickCount() >= self.timer and self.optionone == 2 and self.check == true then
				UseProp(278)
				print("Prop activated!")
				self.optionone = 0
				self.timer = self.timer + 1000
				return false
			elseif GetTickCount() >= self.timer and self.optionone == 3 and self.check == true then
				UseProp(280)
				print("Prop activated!")
				self.optionone = 0
				self.timer = self.timer + 1000
				return false
			elseif GetTickCount() >= self.timer and self.optiontwo == 1 and self.check == true then
				UseProp(277)
				print("Prop activated!")
				self.optiontwo = 0
				self.timer = self.timer + 1000
				return false
			elseif GetTickCount() >= self.timer and self.optiontwo == 2 and self.check == true then
				UseProp(278)
				print("Prop activated!")
				self.optiontwo = 0
				self.timer = self.timer + 1000
				return false
			elseif GetTickCount() >= self.timer and self.optiontwo == 3 and self.check == true then
				UseProp(280)
				print("Prop activated!")
				self.optiontwo = 0
				self.timer = self.timer + 1000
				return false
			elseif GetTickCount() >= self.timer and self.optionthree == 1 and self.check == true then
				UseProp(277)
				print("Prop activated!")
				self.optionthree = 0
				self.timer = self.timer + 1000
				return false
			elseif GetTickCount() >= self.timer and self.optionthree == 2 and self.check == true then
				UseProp(278)
				print("Prop activated!")
				self.optionthree = 0
				self.timer = self.timer + 1000
				return false
			elseif GetTickCount() >= self.timer and self.optionthree == 3 and self.check == true then
				UseProp(280)
				print("Prop activated!")
				self.optionthree = 0
				self.timer = self.timer + 1000
				return false
			elseif self.optionone ~= 0 or self.optiontwo ~= 0 or self.optionthree ~= 0 then
				return false
			elseif self.optionone == 0 and self.optiontwo == 0 and self.optionthree == 0 then
				print("All props are successfully activated!")
				return true
			end
		end
	end

	return false
end

function BotWorker:tick(time)
  if self.bError or self.paused or GetMapName() ~= self.mapName then return false end
  if self.curWork <= #self.works then
	--print(string.format("bw tick %i/%i", self.curWork, #self.works))
    --SetLuaBotState(true)
	if IsMouseCursor() then
		SetMouseCrosshair()
	end
    local work = self.works[self.curWork]
    if self:doWork(work.cmd,work.arg) then
		self.printCommand = true
		if self.bMoveToMob or self.bMoveToItem then
			ResetMoveTo()
			actorSelf:MoveForward(false)
		end
		self.bMoveToMob = false
		self.bMoveToItem = false
		self:nextWork()
    end
    return true
  else
    --SetLuaBotState(false)
  end
end

function BotWorker:WalkTo(vPos)
  local cmd = {}
  cmd.cmd = BA_WALK
  cmd.arg = vPos
  table.insert(self.works,cmd)
end

function BotWorker:WalkTo(x,y,z)
  local cmd = {}
  cmd.cmd = BA_WALK
  cmd.arg = D3DXVECTOR3(x,y,z)
  table.insert(self.works,cmd)
end

function BotWorker:KillMobs(range)
  local cmd = {}
  cmd.cmd = BA_KILL
  cmd.arg = range
  table.insert(self.works,cmd)
  --cmd.cmd = BA_LOOTITEMS
  --cmd.arg = range
  --table.insert(self.works,cmd)
end

function BotWorker:EnterGate(gateName)
  local cmd = {}
  cmd.cmd = BA_GATE
  cmd.arg = gateName
  table.insert(self.works,cmd)
end

function BotWorker:GoToMap(mapName)
	local cmd = {}
	cmd.cmd = BA_GOMAP
	cmd.arg = mapName
	table.insert(self.works,cmd)
end

function BotWorker:InitNPC(npcName)
	local cmd = {}
	cmd.cmd = BA_INITNPC
	cmd.arg = npcName
	table.insert(self.works, cmd)
end

function BotWorker:MoveForward()
	local cmd = {}
	cmd.cmd = BA_MOVEFORWARD
	cmd.arg = nil
	table.insert(self.works, cmd)
end
function BotWorker:pause()
    self.paused = true
end
function BotWorker:resume()
    self.paused = false
end

function BotWorker:Finish()
	local cmd = {}
	cmd.cmd = BA_FINISH
	cmd.arg = nil
	table.insert(self.works, cmd)
end

function BotWorker:UseProp(propID)
	local cmd = {}
	cmd.cmd = BA_USEPROP
	cmd.arg = propID
	table.insert(self.works,cmd)
end

function BotWorker:Wait(ms)
	local cmd = {}
	cmd.cmd = BA_WAIT
	cmd.arg = ms
	table.insert(self.works,cmd)
end

function BotWorker:DestroyProp(propID)
	local cmd = {}
	cmd.cmd = BA_DESTROYPROP
	cmd.arg = propID
	table.insert(self.works, cmd)
end

function BotWorker:AttackProp(propID)
	local cmd = {}
	cmd.cmd = BA_ATTACKPROP
	cmd.arg = propID
	table.insert(self.works, cmd)
end

function BotWorker:TeleportV(pos)
	local cmd = {}
	cmd.cmd = BA_TELEPORT
	cmd.arg = pos
	table.insert(self.works, cmd)
end

function BotWorker:Teleport(x, y, z)
	local cmd = {}
	cmd.cmd = BA_TELEPORT
	cmd.arg = D3DXVECTOR3(x, y, z)
	table.insert(self.works, cmd)
end

function BotWorker:KillMobByName(name)
	local cmd = {}
	cmd.cmd = BA_KILLMOBBYNAME
	cmd.arg = name
	table.insert(self.works, cmd)
end

function BotWorker:RepeatDungeon()
	local cmd = {}
	cmd.cmd = BA_REPEATDUNGEON
	cmd.arg = nil
	table.insert(self.works, cmd)
end

function BotWorker:GoToDungeon(dungeonName)
	local cmd = {}
	cmd.cmd = BA_GOTODUNGEON
	cmd.arg = dungeonName
	table.insert(self.works, cmd)
end

function BotWorker:EnterGateByMapID(mapID)
	local cmd = {}
	cmd.cmd = BA_ENTERGATEBYMAPID
	cmd.arg = mapID
	table.insert(self.works, cmd)
end

function BotWorker:LootItems(range)
	local cmd = {}
	cmd.cmd = BA_LOOTITEMS
	cmd.arg = range
	table.insert(self.works, cmd)
end

function BotWorker:UseLastSpawnedProp()
	local cmd = {}
	cmd.cmd = BA_USE_LAST_SPAWNED_PROP
	cmd.arg = nil
	table.insert(self.works, cmd)
end

function BotWorker:ClearStage()
	local cmd = {}
	cmd.cmd = BA_CLEAR_STAGE
	cmd.arg = nil
	table.insert(self.works, cmd)
end

function BotWorker:GoToMap(dungeonName)
	local cmd = {}
	cmd.cmd = BA_GOTOMAP
	cmd.arg = dungeonName
	table.insert(self.works, cmd)
end

function BotWorker:GoToMapID(mapID)
	local cmd = {}
	cmd.cmd = BA_GOTOMAPID
	cmd.arg = mapID
	table.insert(self.works, cmd)
end

function BotWorker:GoToDungeonID(dungeonID)
	local cmd = {}
	cmd.cmd = BA_GOTODUNGEONID
	cmd.arg = dungeonID
	table.insert(self.works, cmd)
end

function BotWorker:ReturnToTown()
	local cmd = {}
	cmd.cmd = BA_RETURNTOTOWN
	cmd.arg = nil
	table.insert(self.works, cmd)
end

function BotWorker:ReturnToStageEntrance()
	local cmd = {}
	cmd.cmd = BA_RETURNTOSTAGEENTRANCE
	cmd.arg = nil
	table.insert(self.works, cmd)
end

function BotWorker:InitNPCXYZ(x,y,z)
	local cmd = {}
	cmd.cmd = BA_INITNPCBYXYZ
	cmd.arg = D3DXVECTOR3(x,y,z)
	table.insert(self.works,cmd)
end

function BotWorker:MoveForward(x,y,z)
	local cmd = {}
	cmd.cmd = BA_FORWARD
	cmd.arg = D3DXVECTOR3(x,y,z)
	table.insert(self.works,cmd)
end

function BotWorker:IgnoreMobs(option)
	local cmd = {}
	cmd.cmd = BA_IGNOREMOBS
	cmd.arg = option
	table.insert(self.works,cmd)
end

function BotWorker:KillMobsY(range, maxY)
	local cmd = {}
	cmd.arg = {}
	cmd.cmd = BA_KILLMOBSY
	cmd.arg.range = range
	cmd.arg.maxY = maxY
	table.insert(self.works,cmd)
end

function BotWorker:AttackPropTime(propID, t)
	local cmd = {}
	cmd.arg = {}
	cmd.cmd = BA_ATTACKPROPTIME
	cmd.arg.propID = propID
	cmd.arg.t = t
	table.insert(self.works,cmd)
end

function BotWorker:ForwardTime(t)
	local cmd = {}
	cmd.cmd = BA_FORWARDTIME
	cmd.arg = t
	table.insert(self.works,cmd)
end

function BotWorker:ForwardPropTime(propID, t)
	local cmd = {}
	cmd.arg = {}
	cmd.cmd = BA_FORWARDPROPTIME
	cmd.arg.propID = propID
	cmd.arg.t = t
	table.insert(self.works,cmd)
end  

function BotWorker:ForwardOpt(option)
	local cmd = {}
	cmd.cmd = BA_FORWARDOPT
	cmd.arg = option
	table.insert(self.works,cmd)
end

function BotWorker:KillMobByNameR(name, range)
	local cmd = {}
	cmd.arg = {}
	cmd.cmd = BA_KILLMOBNAMERANGE
	cmd.arg.name = name
	cmd.arg.range = range
	table.insert(self.works,cmd)
end

function BotWorker:AddMobToIgnoreList(id, name)
	local cmd = {}
	cmd.arg = {}
	cmd.cmd = BA_ADDMOBTOIGNORELIST
	cmd.arg.id = id
	cmd.arg.name = name
	table.insert(self.works,cmd)
end

function BotWorker:RemoveMobFromIgnoreList(id)
	local cmd = {}
	cmd.cmd = BA_REMOVEMOBFROMIGNORELIST
	cmd.arg = id
	table.insert(self.works,cmd)
end

function BotWorker:KillMobByNameHP(name)
	local cmd = {}
	cmd.cmd = BA_KILLMOBBYNAMEHP
	cmd.arg = name
	table.insert(self.works,cmd)
end

function BotWorker:UseFDRProp(name)
	local cmd = {}
	cmd.cmd = BA_USEFDRPROP
	cmd.arg = name
	table.insert(self.works,cmd)
end

function BotWorker:KillInArea(arange,mrange,x,y,z)
    local cmd = {}
    cmd.cmd = BA_KILLINAREA
    cmd.arg = {}
    cmd.arg.arange = arange
    cmd.arg.mrange = mrange
    cmd.arg.x = x
    cmd.arg.y = y
    cmd.arg.z = z
    table.insert(self.works,cmd)
end

function BotWorker:KillInAreaF(arange,mrange,x,y,z)
    local cmd = {}
    cmd.cmd = BA_KILLINAREAFORWARD
    cmd.arg = {}
    cmd.arg.arange = arange
    cmd.arg.mrange = mrange
    cmd.arg.x = x
    cmd.arg.y = y
    cmd.arg.z = z
    table.insert(self.works,cmd)
end

function BotWorker:KillInAreaFByName(name,arange,mrange,x,y,z)
	local cmd = {}
    cmd.cmd = BA_KILLINAREAFORWARDNAME
    cmd.arg = {}
	cmd.arg.name = name
    cmd.arg.arange = arange
    cmd.arg.mrange = mrange
    cmd.arg.x = x
    cmd.arg.y = y
    cmd.arg.z = z
    table.insert(self.works,cmd)
end