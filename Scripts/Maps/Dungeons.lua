require 'botWorker'
worker = nil
scriptLoaded = false

function OnChangeMap()
	if botManager.isEnabled then
		GetBotWorker()
	end
end

function OnStartBot()
	if botManager.isEnabled then
		print("OnStartBot")
		GetBotWorker()
	end
end

function OnStopBot()
	if botManager.isEnabled == false then
		print("OnStopBot")
		worker = nil
	end
end

function OnTick()
	if worker then
		worker:tick()
	end
end

function GetBotWorker()
	local mapID = GetMapID()
	if mapID == 1 then
		worker = PrairieTown()
	elseif mapID == 5 then
		worker = ManaRidge()
	elseif mapID == 8 then
		worker = CalderockVillage()
	elseif mapID == 11 then
		worker = SaintHaven()
	elseif mapID == 15 then
		worker = LotusMarsh()
	elseif mapID == 51 then
		worker = ShadowForestTrail_1()
	elseif mapID == 52 then
		worker = ShadowForestTrail_2()
	elseif mapID == 53 then
		worker = ShadowForestTrail_3()
	elseif mapID == 56 then
		worker = AncientTempleRuins_1()
	elseif mapID == 57 then
		worker = AncientTempleRuins_2()
	elseif mapID == 58 then
		worker = AncientTempleRuins_3()
	elseif mapID == 61 then
		worker = Catacombs_1()
	elseif mapID == 62 then
		worker = Catacombs_2()
	elseif mapID == 64 then
		worker = Catacombs_3()
	elseif mapID == 66 then
		worker = ShadowForestCore_1()
	elseif mapID == 67 then
		worker = ShadowForestCore_2()
	elseif mapID == 68 then
		worker = ShadowForestCore_3()
	elseif mapID == 71 then
		worker = AncientTempleExcavationSite_1()
	elseif mapID == 72 then
		worker = AncientTempleExcavationSite_2()
	elseif mapID == 73 then
		worker = AncientTempleExcavationSite_3()
	elseif mapID == 81 then
		worker = FrostWindValley_1()
	elseif mapID == 82 then
		worker = FrostWindValley_2()
	elseif mapID == 83 then
		worker = FrostWindValley_3()
	elseif mapID == 86 then
		worker = ParelinasRestingPlace_1()
	elseif mapID == 87 then
		worker = ParelinasRestingPlace_2()
	elseif mapID == 88 then
		worker = ParelinasRestingPlace_3()
	elseif mapID == 91 then
		worker = SilentMonastery_1()
	elseif mapID == 92 then
		worker = SilentMonastery_2()
	elseif mapID == 93 then
		worker = SilentMonastery_3()
	elseif mapID == 96 then
		worker = FrostWindForest_1()
	elseif mapID == 97 then
		worker = FrostWindForest_2()
	elseif mapID == 98 then
		worker = FrostWindForest_3()
	elseif mapID == 101 then
		worker = MariansShrine_1()
	elseif mapID == 102 then
		worker = MariansShrine_2()
	elseif mapID == 103 then
		worker = MariansShrine_3()
	elseif mapID == 106 then
		worker = OrcBaseCamp_1()
	elseif mapID == 107 then
		worker = OrcBaseCamp_2()
	elseif mapID == 112 then
		worker = RaidersDen_1()
	elseif mapID == 113 then
		worker = RaidersDen_2()
	elseif mapID == 114 then
		worker = RaidersDen_3()
	elseif mapID == 117 then
		worker = SighCanyon_1()
	elseif mapID == 118 then
		worker = SighCanyon_2()
	elseif mapID == 119 then
		worker = SighCanyon_3()
	elseif mapID == 142 then
		worker = ChurchRuins_1()
	elseif mapID == 143 then
		worker = ChurchRuins_2()
	elseif mapID == 144 then
		worker = ChurchRuins_3()
	elseif mapID == 147 then
		worker = CatacombsHall_1()
	elseif mapID == 148 then
		worker = CatacombsHall_2()
	elseif mapID == 149 then
		worker = CatacombsHall_3()
	elseif mapID == 152 then
		worker = DarkTowerMagicInstitute_1()
	elseif mapID == 153 then
		worker = DarkTowerMagicInstitute_2()
	elseif mapID == 154 then
		worker = DarkTowerMagicInstitute_3()
	elseif mapID == 161 then
		worker = SilentMonasteryMainHall_1()
	elseif mapID == 163 then
		worker = SilentMonasteryMainHall_2()
	elseif mapID == 164 then
		worker = SilentMonasteryMainHall_3()
	elseif mapID == 172 then
		worker = RoadOfNoReturn_1()
	elseif mapID == 173 then
		worker = RoadOfNoReturn_2()
	elseif mapID == 174 then
		worker = RoadOfNoReturn_3()
	end
end

function PrairieTown()
	local bW = BotWorker('PrairieTown')
	if NeedsRepair() or botManager.bSellItems then
		bW:WalkTo(783, -1617, 1666)
		bW:Wait(5000)
		bW:InitNPC("Merchant Doris")
	else
		bW:GoToDungeon(botManager.dungeon)
	end

	return bW
end

function ManaRidge()
	local bW = BotWorker('ManaRidge')
	if NeedsRepair() or botManager.bSellItems then
		bW:WalkTo(-974, -375, 277)
		bW:Wait(5000)
		bW:InitNPC("Merchant Jenny")
	else
		bW:GoToDungeon(botManager.dungeon)
	end

	return bW
end

function CalderockVillage()
	local bW = BotWorker('CataractGateway')
	if NeedsRepair() or botManager.bSellItems then
		bW:WalkTo(-4039, -1909, 2175)
		bW:Wait(5000)
		bW:InitNPC("Merchant May")
	else
		bW:GoToDungeon(botManager.dungeon)
	end

	return bW
end

function SaintHaven()
	local bW = BotWorker('SaintHaven')
	HideCharacter(1700, 1181, 9200)
	if NeedsRepair() or botManager.bSellItems then
		bW:Teleport(864, 1181, 9219)
		bW:WalkTo(651, 1181, 9068)
		bW:Wait(10000)
		bW:InitNPC("Merchant Kelly")
	else
		bW:GoToDungeon(botManager.dungeon)
	end
	return bW
end

function LotusMarsh()
	local bW = BotWorker('LotusMarshTown')
	if NeedsRepair() or botManager.bSellItems then
		bW:WalkTo(4803, -30, 1572)
		bW:Wait(5000)
		bW:InitNPC("Merchant Lucita")
	else
		bW:GoToDungeon(botManager.dungeon)
	end

	return bW
end

function ShadowForestTrail_1()
	local bW = BotWorker('1-1A')

	bW:WalkTo(131,-169,-1854)
	bW:KillMobs(1000)

	bW:WalkTo(193,-152,-758)
	bW:KillMobs(1000)

	bW:WalkTo(6,-135,599)
	bW:KillMobs(1000)

	bW:EnterGate('1-2A')

	return bW
end

function ShadowForestTrail_2()
	local bW = BotWorker('1-2A')

	bW:WalkTo(279,-168,-955)
	bW:KillMobs(1000)

	bW:WalkTo(323,89,1412)
	bW:KillMobs(1000)

	bW:EnterGate('1-BossA')

	return bW
end

function ShadowForestTrail_3()
	local bW = BotWorker('1-BossA')
	bW:KillMobByName('Orc Baku')
	bW:KillMobs(10000)
	bW:Finish()
	return bW
end

function AncientTempleRuins_1()
	local bW = BotWorker('2-1A')
	bW:WalkTo(-1906,17,-1226)
	bW:KillMobs(3000)

	--bW:UseProp(187)

	bW:WalkTo(-1391,32,-812)
	bW:KillMobs(1000)
	bW:Finish()
	bW:EnterGate('2-2A')

	return bW
end

function AncientTempleRuins_2()
	local bW = BotWorker('2-2A')
	bW:WalkTo(-1364,94,-1580)
	bW:KillMobs(1000)

	bW:WalkTo(539, 84, -1008)
	bW:WalkTo(1609, -317, 55)

	bW:WalkTo(880, -322, 869)
	bW:KillMobs(1000)
	bW:Finish()

	bW:EnterGate('2-BossA')

	return bW
end

function AncientTempleRuins_3()
	local bW = BotWorker('2-BossA')
	bW:KillMobByName('Troll Jukanook')
	bW:KillMobs(10000)
	bW:Finish()

	return bW
end

function Catacombs_1()
	local bW = BotWorker('3-1A')
	bW:WalkTo(-3295, 0, 607)
	bW:KillMobs(1000)

	bW:WalkTo(-2125, 0, 662)

	bW:WalkTo(-2138, 0, 1678)
	bW:Wait(5000)
	bW:KillMobs(1000)

	bW:UseProp(328)

	bW:WalkTo(-2117, 0, 749)

	bW:WalkTo(-844, 0, 726)

	bW:WalkTo(-750, 0, -59)
	bW:KillMobs(1000)

	bW:WalkTo(-692, 0, -801)
	bW:KillMobs(1000)
	bW:EnterGate('3-2A')

	return bW
end

function Catacombs_2()
	local bW = BotWorker('3-2A')
	bW:UseProp(241)
	bW:WalkTo(16, 0, -1054)

	bW:WalkTo(993, 0, -1053)
	bW:KillMobs(1000)

	bW:WalkTo(2563, 0, -1064)
	bW:UseProp(368)
	bW:KillMobs(2000)
	bW:UseProp(350)

	bW:WalkTo(-1549, 0, -926)
	bW:UseProp(366)
	bW:KillMobs(1000)

	bW:WalkTo(-1763, 0, 886)

	bW:WalkTo(-3280, 0, 829)
	bW:KillMobs(1500)
	bW:UseProp(351)

	bW:EnterGate('3-BossA')

	return bW
end

function Catacombs_3()
	local bW = BotWorker('3-BossA')
	bW:KillMobByName('Minotaur Umrak')
	bW:KillMobs(10000)
	bW:Finish()

	return bW
end

function ShadowForestCore_1()
	local bW = BotWorker('4-1A')

	bW:WalkTo(299,-147,-1176)

	bW:WalkTo(645,-157,-1196)
	bW:KillMobs(1000)

	bW:WalkTo(1434, -137, -971)
	bW:KillMobs(1000)

	bW:WalkTo(1200,-119,241)
	bW:KillMobs(1000)

	bW:WalkTo(140,-174,672)
	bW:KillMobs(1000)

	bW:EnterGate('4-2A')

	return bW
end

function ShadowForestCore_2()
	local bW = BotWorker('4-2A')
	bW:WalkTo(-164,-85,-1436)
	bW:KillMobs(1000)

	bW:WalkTo(1344, -114, -667)
	bW:KillMobs(1000)

	bW:EnterGate('4-BossA')

	return bW
end

function ShadowForestCore_3()
	local bW = BotWorker('4-BossA')

	bW:KillMobByName('Goblin Boss Jyaja')
	bW:KillMobs(10000)
	bW:Finish()
	return bW
end

function AncientTempleExcavationSite_1()
	local bW = BotWorker('5-1A')
	bW:WalkTo(-2167,-408,-277)
	bW:KillMobs(1000)

	bW:WalkTo(-1178, -394, 145)
	bW:KillMobs(1000)

	bW:WalkTo(-414, -378, 160)

	bW:WalkTo(1324, -336, 1634)
	bW:KillMobs(1000)

	bW:EnterGate('5-2A')

  return bW
 end
 
function AncientTempleExcavationSite_2()
 	local bW = BotWorker('5-2A')
	bW:WalkTo(1216,-330,1624)
	bW:KillMobs(1000)

	bW:WalkTo(1587, -316, 60)

	bW:WalkTo(630, 73, -1009)

	bW:WalkTo(-1095, 60, -939)
	bW:KillMobs(1000)

	bW:EnterGate('5-BossA')

	return bW
end

function AncientTempleExcavationSite_3()
	local bW = BotWorker('5-BossA')
	bW:KillMobByName('Shaman Brethren Karapacio')
	bW:KillMobs(10000)
	bW:Finish()

	return bW
end

function FrostWindValley_1()
	local bW = BotWorker('7-1A')
	bW:WalkTo(184, -744, -1429)
	bW:KillMobs(1000)

	bW:WalkTo(-23, -724, 1088)
	bW:KillMobs(2000)

	bW:EnterGate('7-2A')

	return bW
end

function FrostWindValley_2()
	local bW = BotWorker('7-2A')
	bW:WalkTo(-754, -365, -2224)
	bW:KillMobs(2000)

	bW:WalkTo(409, -446, -1418)
	bW:KillMobs(2000)

	bW:EnterGate('7-BossA')

	return bW
end

function FrostWindValley_3()
	local bW = BotWorker('7-BossA')
	bW:UseProp(115)
	bW:KillMobByName('Orc Baku')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

function ParelinasRestingPlace_1()
	local bW = BotWorker('8-1A')
	bW:WalkTo(-2015,-311,-1360)

	bW:UseProp(200)

	bW:WalkTo(-1625, -309, 332)
	bW:KillMobs(2000)

	bW:WalkTo(-667, 307, 285)
	bW:KillMobs(2000)

	bW:EnterGate('8-2A')
	return bW
end

function ParelinasRestingPlace_2()
	local bW = BotWorker('8-2A')
	bW:WalkTo(-2202, 22, 1350)
	bW:KillMobs(1000)

	bW:WalkTo(-476, 22, 1514)
	bW:KillMobs(1000)

	bW:WalkTo(-389, 22, 381)
	bW:KillMobs(1000)

	bW:WalkTo(917, 22, 203)
	bW:KillMobs(2000)


	bW:EnterGate('8-BossA')
	return bW
end

function ParelinasRestingPlace_3()
	local bW = BotWorker('8-BossA')
	bW:KillMobByName('Troll Jukuruku')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

function SilentMonastery_1()
	local bW = BotWorker('9-1A')
	bW:WalkTo(-3303, 0, 531)
	bW:KillMobs(1000)

	bW:WalkTo(-2129, 0, 626)
	bW:KillMobs(1000)

	bW:WalkTo(-2134, 0, 1620)

	bW:Wait(5000)
	bW:KillMobs(1000)
	bW:UseProp(282)

	bW:WalkTo(-2129, 0, 626)

	bW:WalkTo(-981, 0, 561)

	bW:WalkTo(-684, 0, -389)
	bW:KillMobs(2000)


	bW:EnterGate('9-2A')
	return bW
end

function SilentMonastery_2()
	local bW = BotWorker('9-2A')
	bW:UseProp(241)
	bW:WalkTo(-36, 0, -1039)

	bW:WalkTo(1025, 0, -1023)
	bW:KillMobs(1000)

	bW:UseProp(394)
	bW:WalkTo(2474, 0, -1006)
	bW:KillMobs(1000)
	bW:UseProp(373)

	bW:WalkTo(-1432, -9, -1089)
	bW:UseProp(348)
	bW:KillMobs(1000)

	bW:WalkTo(-1816, -10, 784)

	bW:WalkTo(-3245, -10, 812)
	bW:KillMobs(1000)
	bW:UseProp(371)

	bW:EnterGate('9-BossA')
	return bW
end

function SilentMonastery_3()
	local bW = BotWorker('9-BossA')
	bW:KillMobsByName('Minotaur Umbaba')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

function FrostWindForest_1()
	local bW = BotWorker('10-1A')
	bW:WalkTo(1048, -622, -1523)

	bW:WalkTo(2034, -586, -632)
	bW:KillMobs(2000)

	bW:WalkTo(514, -651, 633)
	bW:KillMobs(2000)

	bW:EnterGate('10-2A')

	return bW
end

function FrostWindForest_2()
	local bW = BotWorker('10-2A')
	bW:WalkTo(-1171, -268, -1289)
	bW:KillMobs(2000)

	bW:WalkTo(1489, -497, -694)

	bW:WalkTo(1233, -659, 688)
	bW:KillMobs(2000)

	bW:EnterGate('10-BossA')

	return bW
end

function FrostWindForest_3()
	local bW = BotWorker('10-BossA')
	bW:KillMobByName('Goblin Boss Jyakuku')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

function MariansShrine_1()
	local bW = BotWorker('11-1A')
	bW:KillMobs(1000)
	bW:WalkTo(-658, 0, -666)
	bW:KillMobs(1000)

	bW:WalkTo(-758, 0, 712)

	bW:WalkTo(-2084, 0, 725)

	bW:WalkTo(-2146, 0, 1330)
	bW:KillMobs(1000)

	bW:WalkTo(-2084, 0, 725)

	bW:WalkTo(-3098, 0, 652)
	bW:KillMobs(2000)

	bW:EnterGate('11-2A')

	return bW
end

function MariansShrine_2()
	local bW = BotWorker('11-2A')
	bW:WalkTo(1255, -6, -813)
	bW:KillMobs(500)

	bW:WalkTo(1725, -9, -288)
	bW:KillMobs(1000)

	bW:WalkTo(1725, -9, -288)

	bW:WalkTo(1184, -10, 744)

	bW:WalkTo(-211, -11, 660)
	bW:KillMobs(2000)

	bW:EnterGate('11-BossA')

	return bW
end

function MariansShrine_3()
	local bW = BotWorker('11-BossA')
	bW:KillMobByName('Dragon Follower')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

function OrcBaseCamp_1()
	local bW = BotWorker('12-1A')
	bW:WalkTo(-130, -1453, -655)
	bW:Wait(5000)
	bW:KillMobs(2000)

	bW:WalkTo(-32, -1457, 127)
	bW:KillMobs(1000)

	bW:WalkTo(-141, -1455, 1550)
	bW:KillMobs(2000)

	bW:EnterGate('12-BossA')

	return bW
end

function OrcBaseCamp_2()
	local bW = BotWorker('12-BossA')
	bW:UseProp(118)
	bW:KillMobByName('Assault Captain Cleave Dregark')
	bW:KillMobs(10000)
	bW:Finish()

	return bW
end

function RaidersDen_1()
	local bW = BotWorker('13-2A')
	bW:WalkTo(-840, -1269, 545)

	bW:WalkTo(-873, -1193, -1002)
	bW:KillMobs(1000)

	bW:WalkTo(-216, -1185, -1581)
	bW:KillMobs(1000)

	bW:WalkTo(842, -1149, -1153)
	bW:KillMobs(1000)

	bW:WalkTo(1013, -1127, 1150)
	bW:KillMobs(2000)

	bW:EnterGate('13-3A')

	return bW
end

function RaidersDen_2()
	local bW = BotWorker('13-3A')
	bW:WalkTo(-1997, -1364, 1292)
	bW:DestroyProp(600)

	bW:WalkTo(-1447, -1371, 1712)
	bW:KillMobs(1000)

	bW:WalkTo(50, -1176, 2260)
	bW:KillMobs(1000)

	bW:WalkTo(-1407, -1361, 1838)

	bW:WalkTo(-2536, -1228, 348)
	bW:KillMobs(1000)

	bW:WalkTo(-1211, -887, -1796)
	bW:KillMobs(2000)

	bW:WalkTo(356, -1080, -2540)
	bW:KillMobs(2000)

	bW:WalkTo(-1095, -875, -2202)

	bW:WalkTo(-1960, -1013, -1163)
	bW:KillMobs(10000)

	bW:EnterGate('13-BossA')

	return bW
end

function RaidersDen_3()
	local bW = BotWorker('13-BossA')
	bW:KillMobByName('Dark Elf Assassin Lydia')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

function SighCanyon_1()
	local bW = BotWorker('14-2A')
	bW:WalkTo(517, 148, 1681)
	bW:DestroyProp(334)
	bW:DestroyProp(328)
	bW:KillMobs(1500)
	bW:DestroyProp(321)
	bW:KillMobs(1000)

	bW:WalkTo(981, -23, 925)

	bW:WalkTo(1561, 16, 1777)
	bW:DestroyProp(319)
	bW:KillMobs(1000)

	bW:WalkTo(2828, 118, 2249)

	bW:WalkTo(3211, 310, 1811)
	bW:KillMobs(1000)

	bW:WalkTo(2780, 368, 1052)
	bW:DestroyProp(335)

	bW:WalkTo(2371, 366, 870)
	bW:KillMobs(1000)
	bW:DestroyProp(320)
	bW:KillMobs(1000)

	bW:EnterGate('14-3A')

	return bW
end

function SighCanyon_2()
	local bW = BotWorker('14-3A')
	bW:KillMobs(1000)

	bW:WalkTo(-1788, 30, -2181)
	bW:KillMobs(1000)

	bW:WalkTo(-482, -12, -1688)
	bW:KillMobs(1000)

	bW:WalkTo(1474, 176, -1971)
	bW:KillMobs(1000)
	bW:UseProp(298)

	bW:WalkTo(869, 33, -414)
	bW:KillMobs(800)

	bW:WalkTo(797, 238, 626)
	bW:KillMobs(1000)

	bW:EnterGate('14-BossA')

	return bW
end

function SighCanyon_3()
	local bW = BotWorker('14-BossA')
	bW:KillMobsByName('Coldtime Harpy')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

function ChurchRuins_1()
	local bW = BotWorker('19-2A')
	bW:WalkTo(1795, -195, -1889)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(1457, -195, -1372)
	bW:DestroyProp(338)
	bW:KillMobs(2000)
	bW:Wait(2000)
	bW:KillMobs(2000)

	bW:WalkTo(-1815, -45, -1810)
	bW:KillMobs(2000)

	bW:WalkTo(-2189, -45, -400)
	bW:DestroyProp(339)
	bW:KillMobs(3000)

	bW:EnterGate('19-3A')

	return bW
end

function ChurchRuins_2()
	local bW = BotWorker('19-3A')
	bW:WalkTo(-1058, -712, 257)
	bW:KillMobs(1500)

	bW:WalkTo(-1592, -706, 568)

	bW:WalkTo(-3032, -701, 617)
	bW:KillMobs(2000)
	bW:DestroyProp(259)
	bW:KillMobs(2000)
	bW:DestroyProp(258)
	bW:Wait(2000)
	bW:KillMobs(2000)
	bW:UseProp(232)

	bW:WalkTo(-2400, -701, 549)

	bW:WalkTo(-16, -712, 564)
	bW:KillMobs(1000)
	bW:Wait(5000)
	bW:KillMobs(1000)

	bW:WalkTo(251, -712, 567)

	bW:WalkTo(-299, -712, 576)
	bW:KillMobs(1000)

	bW:WalkTo(1370, -704, 666)
	bW:KillMobs(2000)
	bW:DestroyProp(260)
	bW:KillMobs(2000)
	bW:DestroyProp(261)
	bW:KillMobs(2000)
	bW:Wait(3000)
	bW:KillMobs(2000)

	bW:EnterGate('19-BossA')

	return bW
end

function ChurchRuins_3()
	local bW = BotWorker('19-BossA')
	bW:KillMobByName('Hobfrey')
	bW:KillMobs(10000)
	bW:Finish()

	return bW
end

function CatacombsHall_1()
	local bW = BotWorker('20-2A')
	bW:Teleport(208, 0, 961)
	bW:KillMobs(800)
	bW:Wait(3000)
	bW:UseProp(442)

	bW:WalkTo(-1636, 0, 1059)
	bW:KillMobs(3000)
	bW:Wait(5000)
	bW:KillMobs(3000)

	bW:EnterGate('20-3A')

	return bW
end

function CatacombsHall_2()
	local bW = BotWorker('20-3A')
	bW:WalkTo(68, 0, -900)
	bW:KillMobs(1500)

	--bW:WalkTo(-2626, 0, -732)
	bW:Teleport(-2626, 0, -732)
	bW:KillMobs(2000)
	bW:UseProp(435)

	--bW:WalkTo(-662, 0, -513)

	--bW:WalkTo(33, 0, 2279)

	--bW:WalkTo(3336, 0, 2318)
	bW:Teleport(3336, 0, 2318)
	bW:KillMobs(2000)

	bW:EnterGate('20-BossA')

	return bW
end

function CatacombsHall_3()
	local bW = BotWorker('20-BossA')
	bW:KillMobByName('Minotaur Banruha')
	bW:KillMobs(10000)
	bW:Finish()

  return bW
end

function DarkTowerMagicInstitute_1()
	local bW = BotWorker('21-2A')
	bW:Teleport(44, 0, 49)
	bW:Wait(1000)
	bW:KillMobs(1000)

	bW:Teleport(-2062, 0, 1690)
	bW:Wait(1000)
	bW:KillMobs(1000)

	return bW
end

function DarkTowerMagicInstitute_2()
	local bW = BotWorker('21-3A')
	bW:Teleport(-2075, 0, -2190)
	bW:Wait(1000)
	bW:KillMobs(1000)
	bW:DestroyProp(414)

	bW:Teleport(1431, 0, -1331)
	bW:Wait(1000)
	bW:KillMobs(1000)

	bW:Teleport(1494, 0, 716)
	bW:Wait(1000)
	bW:KillMobs(1000)

	bW:EnterGate('21-BossA')

	return bW
end

function DarkTowerMagicInstitute_3()
	local bW = BotWorker('21-BossA')
	bW:KillMobByName('Spider Queen Raren')
	bW:KillMobs(10000)
	bW:Finish()

	return bW
end

function SilentMonasteryMainHall_1()
	local bW = BotWorker('22-1A')
	bW:WalkTo(-72, 0, -989)

	bW:Teleport(-42, 0, 1637)
	bW:KillMobs(2000)
	bW:DestroyProp(430)
	bW:Wait(3000)

	bW:KillMobs(2000)

	bW:EnterGate('22-3A')

	return bW
end

function SilentMonasteryMainHall_2()
	local bW = BotWorker('22-3A')
	bW:WalkTo(-96, 0, -441)

	bW:WalkTo(-582, 0, 199)

	bW:WalkTo(-131, 0, 2510)
	bW:DestroyProp(373)
	bW:Wait(3000)
	bW:KillMobs(1500)

	bW:WalkTo(-124, 0, 521)

	bW:WalkTo(1849, 0, 171)
	bW:DestroyProp(374)
	bW:Wait(3000)
	bW:KillMobs(1500)

	bW:WalkTo(-1865, 0, 162)
	bW:DestroyProp(375)
	bW:Wait(3000)
	bW:KillMobs(1500)
	bW:Wait(5000)

	bW:EnterGate('22-BossA')

	return bW
end

function SilentMonasteryMainHall_3()
	local bW = BotWorker('22-BossA')
	bW:KillMobByName('Blow Strange Mage Leila')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

function RoadOfNoReturn_1()
	local bW = BotWorker('23-2A')
	bW:WalkTo(-108, -1577, 3629)
	bW:DestroyProp(334)
	bW:Wait(1000)
	bW:KillMobs(1000)
	bW:DestroyProp(335)

	bW:WalkTo(940, -1594, 3728)

	bW:WalkTo(1839, -1543, 2514)

	bW:WalkTo(2635, -1379, 541)
	bW:UseProp(438)
	bW:DestroyProp(343)
	bW:KillMobs(2000)

	bW:EnterGate('23-3A')

	return bW
end

function RoadOfNoReturn_2()
	local bW = BotWorker('23-3A')
	bW:WalkTo(1171, -1158, 234)

	bW:WalkTo(-81, -1168, 149)

	bW:WalkTo(-16, -1154, -574)
	bW:DestroyProp(629)
	bW:WalkTo(-149, 1046, -1305)
	bW:KillMobs(1500)

	bW:WalkTo(-105, -1083, -1166)

	bW:WalkTo(9, -1114, 1273)
	bW:DestroyProp(630)

	bW:WalkTo(52, -1055, 1763)
	bW:KillMobs(1500)

	bW:WalkTo(52, -1055, 1763)

	bW:WalkTo(-85, -1167, 143)

	bW:UseProp(664)
	bW:WalkTo(-2297, -1150, 263)
	bW:KillMobs(3000)

	bW:EnterGate('23-BossA')

	return bW
end

function RoadOfNoReturn_3()
	local bW = BotWorker('23-BossA')
	bW:KillMobByName('Ogre Chubaka')
	bW:KillMobs(10000)

	bW:Finish()

	return bW
end

function OnNpcDialog()
	if botManager.isEnabled == false then
		return
	end
	if IsTalkingToNpc() == true then
		if IsTalkingToNpc("Merchant Doris") then
			if IsDlgOption("Purchase/Repair Items") == true then
				ChooseDlgOption(0)
			end
		elseif IsTalkingToNpc("Sene") then
			local nextID = GetNextMapID()
			if IsDlgOption("Purchase Ticket to Mana Ridge") then
				if nextID == 5 then
					ChooseDlgOption(0)
				elseif nextID == 8 then
					ChooseDlgOption(1)
				elseif nextID == 11 then
					ChooseDlgOption(2)
				elseif nextID == 15 then
					ChooseDlgOption(3)
				end
			elseif IsDlgOption("Board Airship") then
				ChooseDlgOption(1)
			end
		elseif IsTalkingToNpc("Merchant Jenny") then
			if IsDlgOption("Purchase/Repair Items") == true then
				ChooseDlgOption(0)
			end
		elseif IsTalkingToNpc("Ticket Agent Iris") then
			local nextID = GetNextMapID()
			if IsDlgOption("Purchase Ticket to Prairie Town") then
				if nextID == 1 then
					ChooseDlgOption(0)
				elseif nextID == 8 then
					ChooseDlgOption(1)
				elseif nextID == 11 then
					ChooseDlgOption(2)
				elseif nextID == 15 then
					ChooseDlgOption(3)
				end
			elseif IsDlgOption("Board Airship") then
				ChooseDlgOption(1)
			end
		elseif IsTalkingToNpc("Merchant May") then
			print("Talking to Merchant May")
			if IsDlgOption("Purchase/Repair Items") == true then
				ChooseDlgOption(0)
			end
		elseif IsTalkingToNpc("Lorraine") then
			local nextID = GetNextMapID()
			if IsDlgOption("Purchase Ticket to Prairie Town") then
				if nextID == 1 then
					ChooseDlgOption(0)
				elseif nextID == 5 then
					ChooseDlgOption(1)
				end
			elseif IsDlgOption("Board Airship") then
				ChooseDlgOption(1)
			end
		elseif IsTalkingToNpc("Ticket Agent Arnen") then
			local nextID = GetNextMapID()
			if IsDlgOption("Purchase Ticket to Saint Haven") then
				if nextID == 11 then
					ChooseDlgOption(0)
				elseif nextID == 15 then
					ChooseDlgOption(1)
				end
			elseif IsDlgOption("Board Airship") then
				ChooseDlgOption(0)
			end
		elseif IsTalkingToNpc("Merchant Kelly") then
			if IsDlgOption("Purchase Items/Repair Items") then
				ChooseDlgOption(0)
			end
		elseif IsTalkingToNpc("Ticket Agent Sorene") then
			local nextID = GetNextMapID()
			if IsDlgOption("Purchase Ticket to Prairie Town") then
				if nextID == 1 then
					ChooseDlgOption(0)
				elseif nextID == 5 then
					ChooseDlgOption(1)
				elseif nextID == 8 then
					ChooseDlgOption(2)
				elseif nextID == 15 then
					ChooseDlgOption(3)
				end
			elseif IsDlgOption("Board Airship") then
				ChooseDlgOption(1)
			elseif IsDlgOption("Buy A Boarding Ticket") then
				ChooseDlgOption(1)
			end
		elseif IsTalkingToNpc("Merchant Lucita") then
			if IsDlgOption("Shop Trade") == true then
				ChooseDlgOption(1)
			end
		elseif IsTalkingToNpc("Ticket Agent Karenne") then
			local nextID = GetNextMapID()
			if IsDlgOption("Purchase Ticket to Prairie Town") then
				if nextID == 1 then
					ChooseDlgOption(0)
				elseif nextID == 5 then
					ChooseDlgOption(1)
				elseif nextID == 8 then
					ChooseDlgOption(2)
				elseif nextID == 11 then
					ChooseDlgOption(3)
				end
			elseif IsDlgOption("Board Airship") then
				ChooseDlgOption(1)
			end
		end
	end
end

LogString("Dungeons Script")