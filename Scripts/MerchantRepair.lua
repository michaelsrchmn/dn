local bWaitToSellItem = false
local nextSellItemTime = 0
local cSlot = 0

function OnLoad()
	botManager.bMerchanting = false
	print("AutoMerchant / Repair Plugin Loaded - created by svinx")
end

function OnStartBot()

end

function OnStopBot()
	nextSellItemTime = 0
	cSlot = 0
	botManager.bMerchanting = false
	bWaitToSellItem = false
end

function OnMerchantFinished()
	LogString("Finished Selling Items!")
	if profileManager.bRepairItemAtNpcOption and NeedsRepair() then
		LogString("Needs repair...")
		RepairEquipment()
	else
		LogString("No repair needed...Closing shop!")
		CloseShopDlg()
	end
end

function OnRepairEquipment()
	if botManager.isEnabled == false or not IsInTown() then
		return
	end
	LogString("Repair success...Closing shop!")
	CloseShopDlg()
end

function OnRepairEquipmentFail()
	if botManager.isEnabled == false or not IsInTown() then
		return
	end
	LogString("Repair failed? Closing shop...")
	CloseShopDlg()
end

function OnShopOpened()
	if botManager.isEnabled == false then
		return
	end
	LogString("Shop Opened")
	if profileManager.bAutoSell then
		botManager.bMerchanting = true
		LogString("Begin selling items...")
	else
		if profileManager.bRepairItemAtNpcOption and NeedsRepair() then
			RepairEquipment()
		else
			CloseShopDlg()
		end
	end
end

function OnShopClosed()
	if botManager.isEnabled then
		if profileManager.botType ~= BOT_MB then
			GoToDungeon(botManager.dungeon)
		else
			if botManager.nextMapID ~= 0 and MapIsDungeon(botManager.nextMapID) then
				GoToDungeon(botManager.nextMapID)
			else
				GoToMap(botManager.nextMapID)
			end
		end
	end
end

function OnTick()
	if not botManager.isEnabled then
		return
	end
	if not profileManager.bAutoSell then
		if botManager.bMerchanting then
			botManager.bMerchanting = false
			print("Fixing botManager.bMerchanting")
		end
		return
	elseif botManager.bMerchanting then
		if cSlot >= inventoryManager.inventorySize then
			LogString("cSlot >= inventory space")
			botManager.bMerchanting = false
			cSlot = 0
			bWaitToSellItem = false
			nextSellItemTime = 0
			OnMerchantFinished()
			return
		end
		local item = inventoryManager:getItem(cSlot)
		if item ~= nil then
			if botManager:IsItemSellFiltered(item) then
				print(string.format("Item in slot %i is filtered, moving to next slot...", cSlot))
				cSlot = cSlot + 1
			elseif item.canBeSold then
				if bWaitToSellItem == false and nextSellItemTime < GetTickCount() then
					SellItem(item)
					bWaitToSellItem = true
					print(string.format("Selling Item: %s, Quantity: %i", item.name, item.quantity))
				end
			else
				print(string.format("Item in slot %i cannot be sold , moving to next slot...", cSlot))
				cSlot = cSlot + 1
			end
		elseif item == nil then
			if bWaitToSellItem then
				bWaitToSellItem = false
				nextSellItemTime = GetTickCount() + 1000
				print("Item Sold")
			end
			print(string.format("No item found in slot %i, moving to next slot...", cSlot))
			cSlot = cSlot + 1
		end
	end
end

function OnNpcDialog()
	if not botManager.isEnabled then
		return
	end
	if IsTalkingToNpc() then
		if IsTalkingToNpc("Merchant Doris") then
			if IsDlgOption("Purchase/Repair Items") == true then
				ChooseDlgOption(0)
			end
		elseif IsTalkingToNpc("Merchant Jenny") then
			if IsDlgOption("Purchase/Repair Items") == true then
				ChooseDlgOption(0)
			end
		elseif IsTalkingToNpc("Merchant May") then
			if IsDlgOption("Purchase/Repair Items") == true then
				ChooseDlgOption(0)
			end
		elseif IsTalkingToNpc("Merchant Kelly") then
			if IsDlgOption("Purchase Items/Repair Items") then
				ChooseDlgOption(0)
			end
		elseif IsTalkingToNpc("Merchant Lucita") then
			if IsDlgOption("Shop Trade") then
				ChooseDlgOption(1)
			end
		elseif IsTalkingToNpc("Blacksmith Corin") then
			if IsDlgOption("Blacksmith Store/Item Repair") then
				ChooseDlgOption(0)
			end
		elseif IsTalkingToNpc('Blacksmith Berlin') then
			if IsDlgOption("Store") then
				ChooseDlgOption(0)
			end
		elseif IsTalkingToNpc('Blacksmith Molin') then
			if IsDlgOption("Store") then
				ChooseDlgOption(0)
			end
		end
	end
end