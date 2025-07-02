using System.Xml.Serialization;
using NLua;
using DragonNestAutomationApp.XmlModels;
using System.IO;
using System.Linq;

namespace DragonNestAutomationApp
{
    public class Program
    {
        // Simulated game environment classes
        public class ActorSelf
        {
            public float x, y, z;
            public float hp;
            public bool isRangedAttack;
            public bool isCloseAttack;
            public string name;
            public float uid;
            public bool isFlower;
            public bool isMob; // Added missing property

            public void MoveTo(D3DXVECTOR3 pos)
            {
                Console.WriteLine($"Simulated: Moving to {pos.x}, {pos.y}, {pos.z}");
                // In a real scenario, this would update the actor's position
                x = pos.x;
                y = pos.y;
                z = pos.z;
            }

            public void MoveForward(bool forward)
            {
                Console.WriteLine($"Simulated: Moving forward: {forward}");
            }

            public void Teleport(D3DXVECTOR3 pos)
            {
                Console.WriteLine($"Simulated: Teleporting to {pos.x}, {pos.y}, {pos.z}");
                x = pos.x;
                y = pos.y;
                z = pos.z;
            }

            public void UseSkill(int skillId)
            {
                Console.WriteLine($"Simulated: Using skill {skillId}");
            }

            public float getDistance(D3DXVECTOR3 targetPos)
            {
                // Simple Euclidean distance for simulation
                return (float)Math.Sqrt(Math.Pow(targetPos.x - x, 2) + Math.Pow(targetPos.y - y, 2) + Math.Pow(targetPos.z - z, 2));
            }

            public float getDistance(ActorSelf targetActor)
            {
                return getDistance(new D3DXVECTOR3 { x = targetActor.x, y = targetActor.y, z = targetActor.z });
            }
        }

        public class ActorManager
        {
            public int iCount = 0;
            private List<ActorSelf> _actors = new List<ActorSelf>();

            public ActorManager()
            {
                // Add some dummy actors for testing
                _actors.Add(new ActorSelf { x = 100, y = 0, z = 100, hp = 100, isMob = true, name = "DummyMob1", uid = 1.0f, isRangedAttack = false, isCloseAttack = true });
                _actors.Add(new ActorSelf { x = 200, y = 0, z = 200, hp = 50, isMob = true, name = "DummyMob2", uid = 2.0f, isRangedAttack = true, isCloseAttack = false });
                _actors.Add(new ActorSelf { x = 300, y = 0, z = 300, hp = 0, isMob = true, name = "DeadMob", uid = 3.0f, isRangedAttack = false, isCloseAttack = true });
                _actors.Add(new ActorSelf { x = 50, y = 0, z = 50, hp = 100, isMob = false, name = "NPC1", uid = 4.0f });
                _actors.Add(new ActorSelf { x = 150, y = 0, z = 150, hp = 100, isMob = true, name = "FlowerMob", uid = 5.0f, isFlower = true });
                iCount = _actors.Count;
            }

            public ActorSelf getActor(int index)
            {
                if (index >= 0 && index < _actors.Count)
                {
                    return _actors[index];
                }
                return null;
            }

            public ActorSelf getActor(float x, float y, float z)
            {
                // In a real scenario, this would search for an actor at specific coordinates
                Console.WriteLine($"Simulated: Searching for actor at {x}, {y}, {z}");
                return _actors.FirstOrDefault(a => a.x == x && a.y == y && a.z == z);
            }
        }

        public class Drop
        {
            public float id;
            public float x, y, z;
            public string name;
            public D3DXVECTOR3 pos => new D3DXVECTOR3 { x = x, y = y, z = z };
        }

        public class DropManager
        {
            public int iCount = 0;
            private List<Drop> _drops = new List<Drop>();

            public DropManager()
            {
                _drops.Add(new Drop { id = 0, x = 10, y = 0, z = 10, name = "Gold" });
                _drops.Add(new Drop { id = 1001, x = 20, y = 0, z = 20, name = "Item1" });
                _drops.Add(new Drop { id = 1002, x = 30, y = 0, z = 30, name = "Item2" });
                iCount = _drops.Count;
            }

            public Drop getDrop(int index)
            {
                if (index >= 0 && index < _drops.Count)
                {
                    return _drops[index];
                }
                return null;
            }
        }

        public class InventoryManager
        {
            public int slotsAvailable = 10; // Simulated
            public int inventorySize = 20;

            public Item getItem(int slot)
            {
                // Simulated item for testing selling logic
                if (slot == 0) return new Item { name = "TestItem", quantity = 1, canBeSold = true };
                return null;
            }
        }

        public class Item
        {
            public string name;
            public int quantity;
            public bool canBeSold;
        }

        public class SkillManager
        {
            public int iCount = 1;
            public Skill GetSkill(int index)
            {
                // Simulated skill
                if (index == 0) return new Skill { id = 1, cooldownTime = 1000, cooldownTimeLeft = 0 };
                return null;
            }
        }

        public class Skill
        {
            public int id;
            public int cooldownTime;
            public int cooldownTimeLeft;
        }

        public class QuestManager
        {
            public bool hasQuest(int questId)
            {
                Console.WriteLine($"Simulated: Checking if quest {questId} exists.");
                return true; // Always true for simulation
            }

            public int getQuestPart(int questId)
            {
                Console.WriteLine($"Simulated: Getting part for quest {questId}.");
                return 1; // Always part 1 for simulation
            }
        }

        public class ProfileManager
        {
            public bool bReviveOnDeath = true;
            public bool bUseCashRevives = false;
            public bool bItemPickup = true;
            public bool bOnlyPickupGold = false;
            public bool bUseSkills = true;
            public int botType = 0; // BOT_REPEAT_DUNGEON or BOT_AUTO_SELECT_DUNGEON
            public bool bAutoSell = true;
            public bool bRepairItemAtNpcOption = true;
            public bool bTownTimerAB = true;
            public bool bDungeonCompletionAB = true;
            public int rcDungeonID = 0;
            public int mbDungeonID = 0;
        }

        public class BotManager
        {
            public bool isEnabled = true;
            public bool bMerchanting = false;
            public bool bLuaWait = false;
            public bool bSellItems = false;
            public int nextMapID = 0;
            public int dungeon = 0;

            public bool IsItemLootFiltered(Drop drop)
            {
                Console.WriteLine($"Simulated: Checking if item {drop.name} is filtered for loot.");
                return false;
            }

            public bool IsItemSellFiltered(Item item)
            {
                Console.WriteLine($"Simulated: Checking if item {item.name} is filtered for selling.");
                return false;
            }
        }

        // Lua-callable functions (mimicking the global functions in Lua scripts)
        public static class LuaFunctions
        {
            public static ActorSelf actorSelf;
            public static ActorManager actorManager;
            public static DropManager dropManager;
            public static InventoryManager inventoryManager;
            public static SkillManager skillManager;
            public static QuestManager questManager;
            public static ProfileManager profileManager;
            public static BotManager botManager;

            public static string mainDir = "C:\\devapps\\dnbot\\dn"; // Simulated main directory

            public static void print(string message)
            {
                Console.WriteLine($"LUA: {message}");
            }

            public static int GetTickCount()
            {
                return Environment.TickCount;
            }

            public static void ReturnToTown()
            {
                Console.WriteLine("Simulated: Returning to town.");
            }

            public static int GetNumberOfFreeRevives()
            {
                Console.WriteLine("Simulated: Getting number of free revives.");
                return 1; // Always 1 for simulation
            }

            public static int GetNumberOfCashRevives()
            {
                Console.WriteLine("Simulated: Getting number of cash revives.");
                return 0; // Always 0 for simulation
            }

            public static void ReviveCharacter()
            {
                Console.WriteLine("Simulated: Reviving character.");
            }

            public static string GetMapName()
            {
                Console.WriteLine("Simulated: Getting map name.");
                return "PrairieTown"; // Default for simulation
            }

            public static int GetMapID()
            {
                Console.WriteLine("Simulated: Getting map ID.");
                return 1; // Default for simulation
            }

            public static bool IsGoingToMap()
            {
                Console.WriteLine("Simulated: Checking if going to map.");
                return false;
            }

            public static void ResetMoveTo()
            {
                Console.WriteLine("Simulated: Resetting movement.");
            }

            public static void AimAt(D3DXVECTOR3 pos)
            {
                Console.WriteLine($"Simulated: Aiming at {pos.x}, {pos.y}, {pos.z}");
            }

            public static void AimAt(ActorSelf actor)
            {
                Console.WriteLine($"Simulated: Aiming at actor {actor.name} ({actor.x}, {actor.y}, {actor.z})");
            }

            public static void Attack()
            {
                Console.WriteLine("Simulated: Attacking.");
            }

            public static bool IsMobIgnored(string mobName)
            {
                Console.WriteLine($"Simulated: Checking if mob {mobName} is ignored.");
                return false;
            }

            public static void AddMobUIDToIgnoreList(float uid)
            {
                Console.WriteLine($"Simulated: Adding mob UID {uid} to ignore list.");
            }

            public static void AddMobToIgnoreList(int id, string name)
            {
                Console.WriteLine($"Simulated: Adding mob {name} (ID: {id}) to ignore list.");
            }

            public static void RemoveMobFromIgnoreList(int id)
            {
                Console.WriteLine($"Simulated: Removing mob ID {id} from ignore list.");
            }

            public static bool IsProp(int propId)
            {
                Console.WriteLine($"Simulated: Checking if prop {propId} exists.");
                return true;
            }

            public static D3DXVECTOR3 GetPropPos(int propId)
            {
                Console.WriteLine($"Simulated: Getting position of prop {propId}.");
                return new D3DXVECTOR3 { x = 100, y = 0, z = 100 }; // Dummy position
            }

            public static void UseProp(int propId)
            {
                Console.WriteLine($"Simulated: Using prop {propId}.");
            }

            public static void UseLastProp()
            {
                Console.WriteLine("Simulated: Using last spawned prop.");
            }

            public static void ClearStage()
            {
                Console.WriteLine("Simulated: Clearing stage.");
            }

            public static bool GoToDungeon(object dungeon)
            {
                Console.WriteLine($"Simulated: Going to dungeon: {dungeon}");
                return true;
            }

            public static bool GoToMap(object map)
            {
                Console.WriteLine($"Simulated: Going to map: {map}");
                return true;
            }

            public static bool IsTalkingToNpc()
            {
                Console.WriteLine("Simulated: Checking if talking to NPC.");
                return false;
            }

            public static bool IsTalkingToNpc(string npcName)
            {
                Console.WriteLine($"Simulated: Checking if talking to NPC {npcName}.");
                return false;
            }

            public static bool InitNpcDlg(object npc)
            {
                Console.WriteLine($"Simulated: Initializing NPC dialog with {npc}.");
                return true;
            }

            public static bool IsDlgOption(string option)
            {
                Console.WriteLine($"Simulated: Checking dialog option: {option}");
                return false;
            }

            public static void ChooseDlgOption(int optionIndex)
            {
                Console.WriteLine($"Simulated: Choosing dialog option {optionIndex}.");
            }

            public static void CloseNpcDlg()
            {
                Console.WriteLine("Simulated: Closing NPC dialog.");
            }

            public static bool NeedsRepair()
            {
                Console.WriteLine("Simulated: Checking if repair is needed.");
                return false;
            }

            public static void RepairEquipment()
            {
                Console.WriteLine("Simulated: Repairing equipment.");
            }

            public static void CloseShopDlg()
            {
                Console.WriteLine("Simulated: Closing shop dialog.");
            }

            public static void SellItem(Item item)
            {
                Console.WriteLine($"Simulated: Selling item {item.name} (Quantity: {item.quantity}).");
            }

            public static void LogString(string message)
            {
                Console.WriteLine($"Simulated Log: {message}");
            }

            public static int GetNextMapID()
            {
                Console.WriteLine("Simulated: Getting next map ID.");
                return 0;
            }

            public static bool MapIsDungeon(int mapId)
            {
                Console.WriteLine($"Simulated: Checking if map {mapId} is a dungeon.");
                return true;
            }

            public static int GetTownWait()
            {
                Console.WriteLine("Simulated: Getting town wait time.");
                return 1000;
            }

            public static int GetDungeonCompletionWait()
            {
                Console.WriteLine("Simulated: Getting dungeon completion wait time.");
                return 1000;
            }

            public static int GetLastPropSpawn()
            {
                Console.WriteLine("Simulated: Getting last prop spawned.");
                return 0;
            }

            public static void LootItem(Drop drop)
            {
                Console.WriteLine($"Simulated: Looting item {drop.name} (ID: {drop.id}).");
            }

            public static void HideCharacter(float x, float y, float z)
            {
                Console.WriteLine($"Simulated: Hiding character at {x}, {y}, {z}.");
            }

            public static string GetMapNameById(int id)
            {
                if (LoadedMaps?.Maps == null) return string.Empty;
                var map = LoadedMaps.Maps.FirstOrDefault(m => m.ID == id);
                return map?.Name ?? string.Empty;
            }

            public static string GetMBDungeonNameById(int id)
            {
                if (LoadedMBDungeons?.MBDungeons == null) return string.Empty;
                var dungeon = LoadedMBDungeons.MBDungeons.FirstOrDefault(d => d.ID == id);
                return dungeon?.Name ?? string.Empty;
            }

            public static string GetRCDungeonNameById(int id)
            {
                if (LoadedRCDungeons?.Dungeons == null) return string.Empty;
                var dungeon = LoadedRCDungeons.Dungeons.FirstOrDefault(d => d.ID == id);
                return dungeon?.Name ?? string.Empty;
            }

            public static bool IsItemFiltered(string itemName)
            {
                if (LoadedItemPickupFilter?.Items == null) return false;
                return LoadedItemPickupFilter.Items.Any(i => i.ItemName == itemName);
            }

            // Hold loaded XML data for helper functions
            public static DNMaps LoadedMaps;
            public static DNBotMBDungeons LoadedMBDungeons;
            public static RCDungeons LoadedRCDungeons;
            public static ItemPickupFilter LoadedItemPickupFilter;

            // Generic XML Deserializer
            public static T DeserializeXml<T>(string filePath)
            {
                XmlSerializer serializer = new XmlSerializer(typeof(T));
                using (StreamReader reader = new StreamReader(filePath))
                {
                    return (T)serializer.Deserialize(reader);
                }
            }

            public static void Main(string[] args)
            {
                Console.WriteLine("Starting Dragon Nest Automation App...");
                var config = Config.LoadDefault();
                try
                {
                    var maps = XmlLoader.Load<DNMaps>(config.MapsXml);
                    var mbDungeons = XmlLoader.Load<DNBotMBDungeons>(config.MissionBoardXml);
                    var rcDungeons = XmlLoader.Load<RCDungeons>(config.RCXml);
                    var itemPickupFilter = XmlLoader.Load<ItemPickupFilter>(config.ItemPickupFilterXml);
                    Console.WriteLine("XML Data Loaded.");

                    var simulation = new Simulation(maps, mbDungeons, rcDungeons, itemPickupFilter);
                    using (var luaEngine = new LuaEngine(config, maps, mbDungeons, rcDungeons, itemPickupFilter, simulation))
                    {
                        var lua = luaEngine.Lua;
                        // Enhanced error handling and logging
                        string logFile = Path.Combine(config.MainDir, "error.log");
                        void LogError(string message, Exception ex = null)
                        {
                            string fullMsg = $"[{DateTime.Now}] {message}" + (ex != null ? $"\nException: {ex}" : "");
                            Console.WriteLine(fullMsg);
                            try { File.AppendAllText(logFile, fullMsg + Environment.NewLine); } catch { }
                        }

                        // Validate XML data
                        if (maps == null || maps.Maps == null || !maps.Maps.Any())
                        {
                            LogError("Maps.xml is missing or invalid.");
                            return;
                        }
                        if (mbDungeons == null || mbDungeons.MBDungeons == null)
                        {
                            LogError("MissionBoard.xml is missing or invalid.");
                            return;
                        }
                        if (rcDungeons == null || rcDungeons.Dungeons == null)
                        {
                            LogError("RC.xml is missing or invalid.");
                            return;
                        }
                        if (itemPickupFilter == null || itemPickupFilter.Items == null)
                        {
                            LogError("ItemPickupFilter.xml is missing or invalid.");
                            return;
                        }

                        // Load core Lua scripts
                        string[] coreLuaFiles = new string[]
                        {
                            Path.Combine(config.CommonScriptsDir, "Quest.lua"),
                            Path.Combine(config.CommonScriptsDir, "basic.lua"),
                            Path.Combine(config.CommonScriptsDir, "botWorker.lua"),
                            Path.Combine(config.CommonScriptsDir, "maps.lua"),
                            Path.Combine(config.CommonScriptsDir, "props.lua"),
                            Path.Combine(config.CommonScriptsDir, "botManager.lua"),
                            Path.Combine(config.CommonScriptsDir, "rcBot.lua"),
                            Path.Combine(config.CommonScriptsDir, "questlist.lua"),
                        };
                        foreach (string luaFile in coreLuaFiles)
                        {
                            try { lua.DoFile(luaFile); }
                            catch (FileNotFoundException fnf) { LogError($"Lua script not found: {luaFile}", fnf); }
                            catch (NLua.Exceptions.LuaException lex) { LogError($"Lua error in {luaFile}", lex); }
                            catch (Exception ex) { LogError($"Unexpected error loading core Lua script {Path.GetFileName(luaFile)}", ex); }
                        }
                        // Load remaining Lua scripts
                        string[] remainingLuaFiles = Directory.GetFiles(config.ScriptsDir, "*.lua", SearchOption.AllDirectories)
                            .Where(f => !coreLuaFiles.Contains(f)).ToArray();
                        foreach (string luaFile in remainingLuaFiles)
                        {
                            try { lua.DoFile(luaFile); }
                            catch (FileNotFoundException fnf) { LogError($"Lua script not found: {luaFile}", fnf); }
                            catch (NLua.Exceptions.LuaException lex) { LogError($"Lua error in {luaFile}", lex); }
                            catch (Exception ex) { LogError($"Unexpected error loading Lua script {Path.GetFileName(luaFile)}", ex); }
                        }
                        // Simulate bot operation (OnTick loop)
                        Console.WriteLine("\nSimulating bot operation... Press Ctrl+C to stop.");
                        try { lua.DoString("if OnLoad then OnLoad() end"); } catch (NLua.Exceptions.LuaException ex) { LogError("Error in OnLoad", ex); }
                        try { lua.DoString("if OnStartBot then OnStartBot() end"); } catch (NLua.Exceptions.LuaException ex) { LogError("Error in OnStartBot", ex); }
                        bool running = true;
                        Console.CancelKeyPress += (s, e) => { running = false; e.Cancel = true; Console.WriteLine("Stopping simulation..."); };
                        while (running)
                        {
                            try { lua.DoString("if OnTick then OnTick() end"); }
                            catch (NLua.Exceptions.LuaException ex) { LogError("Error during Lua OnTick", ex); running = false; }
                            catch (Exception ex) { LogError("Unexpected error during OnTick", ex); running = false; }
                            System.Threading.Thread.Sleep(100);
                        }
                        Console.WriteLine("Simulation stopped.");
                        try { lua.DoString("if OnStopBot then OnStopBot() end"); } catch (NLua.Exceptions.LuaException ex) { LogError("Error in OnStopBot", ex); }

                        // Global unhandled exception handler
                        AppDomain.CurrentDomain.UnhandledException += (sender, e) =>
                        {
                            LogError("Unhandled exception occurred", e.ExceptionObject as Exception);
                            Console.WriteLine("A fatal error occurred. See error.log for details.");
                        };
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Fatal error: {ex.Message}");
                }
            }
        }

        // D3DXVECTOR3 struct for Lua interop
        public struct D3DXVECTOR3
        {
            public float x, y, z;
        }
    }
}
