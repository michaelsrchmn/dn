function OnMyActorDeath()
	if not botManager.isEnabled then
		return
	elseif not profileManager.bReviveOnDeath then
		--print("accepting death")
		ReturnToTown()
	elseif actorSelf.hp == 0 then
		if GetNumberOfFreeRevives() > 0 then
			ReviveCharacter()
		elseif profileManager.bUseCashRevives and GetNumberOfCashRevives() > 0 then
			ReviveCharacter()
		else
			--print("accepting death")
			ReturnToTown()
		end
	end
end

function OnLoad()
	print("Auto-Revive plugin loaded - created by svinx")
end