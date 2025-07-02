using System;
using System.IO;
using NLua;
using DragonNestAutomationApp.XmlModels;

namespace DragonNestAutomationApp
{
    public class LuaEngine : IDisposable
    {
        public Lua Lua { get; private set; }
        public LuaEngine(Config config, DNMaps maps, DNBotMBDungeons mbDungeons, RCDungeons rcDungeons, ItemPickupFilter itemPickupFilter, Simulation simulation)
        {
            Lua = new Lua();
            // Set up Lua paths
            string scriptsPath = config.ScriptsDir.Replace("\\", "/") + "/?.lua";
            string commonScriptsPath = config.CommonScriptsDir.Replace("\\", "/") + "/?.lua";
            string packagePath = $"package.path = package.path .. ';{scriptsPath};{commonScriptsPath}'";
            Lua.DoString(packagePath);

            // Expose XML data
            Lua["mapsXml"] = maps;
            Lua["mbDungeonsXml"] = mbDungeons;
            Lua["rcDungeonsXml"] = rcDungeons;
            Lua["itemPickupFilterXml"] = itemPickupFilter;

            // Expose simulation objects
            Lua["actorSelf"] = simulation.ActorSelf;
            Lua["actorManager"] = simulation.ActorManager;
            Lua["dropManager"] = simulation.DropManager;
            Lua["inventoryManager"] = simulation.InventoryManager;
            Lua["skillManager"] = simulation.SkillManager;
            Lua["questManager"] = simulation.QuestManager;
            Lua["profileManager"] = simulation.ProfileManager;
            Lua["botManager"] = simulation.BotManager;
            Lua["mainDir"] = config.MainDir;

            // Register helper functions (example)
            Lua.RegisterFunction("GetMapNameById", simulation, simulation.GetType().GetMethod("GetMapNameById"));
            Lua.RegisterFunction("IsItemFiltered", simulation, simulation.GetType().GetMethod("IsItemFiltered"));

            // Dummy class function for Lua
            Lua.DoString("function class(name) return {} end");
        }

        public void Dispose()
        {
            Lua?.Dispose();
        }
    }
}
