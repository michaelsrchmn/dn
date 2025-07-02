using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;
using System.Xml.Linq;
using NLua;
using WindowsInput.Native;

namespace DragonNestAutomationApp
{
    public class GameAutomationService
    {
        private Thread automationThread;
        private bool automationRunning = false;
        private GameClientBridge gameClientBridge = new GameClientBridge();
        private string currentLuaScriptPath;
        private List<string> itemFilters = new List<string>();
        private Action<string> log;

        public GameAutomationService(Action<string> logCallback)
        {
            log = logCallback;
        }

        public void LoadItemFilters(string xmlPath)
        {
            try
            {
                var doc = XDocument.Load(xmlPath);
                itemFilters = doc.Descendants("Item")
                    .Select(x => (string)x.Attribute("ItemName"))
                    .Distinct()
                    .ToList();
                log?.Invoke($"Loaded {itemFilters.Count} item filters from XML.");
            }
            catch (Exception ex)
            {
                log?.Invoke($"Failed to load item filter XML: {ex.Message}");
            }
        }

        public void SetLuaScript(string luaPath)
        {
            if (File.Exists(luaPath))
            {
                currentLuaScriptPath = luaPath;
                log?.Invoke($"Lua script set: {luaPath}");
            }
            else
            {
                log?.Invoke($"Lua script not found: {luaPath}");
            }
        }

        public void StartAutomation()
        {
            if (automationRunning)
            {
                log?.Invoke("Automation already running.");
                return;
            }
            log?.Invoke("Attempting to attach to DragonNest...");
            if (!gameClientBridge.AttachToGame())
            {
                log?.Invoke("Failed to attach to DragonNest. Make sure the game is running.");
                return;
            }
            log?.Invoke("Attached to DragonNest. Starting automation.");
            automationRunning = true;
            automationThread = new Thread(() =>
            {
                NLua.Lua lua = null;
                if (!string.IsNullOrEmpty(currentLuaScriptPath))
                {
                    try
                    {
                        lua = new NLua.Lua();
                        lua.DoFile(currentLuaScriptPath);
                        log?.Invoke($"Loaded Lua script: {currentLuaScriptPath}");
                    }
                    catch (Exception ex)
                    {
                        log?.Invoke($"Failed to run Lua script: {ex.Message}");
                    }
                }
                while (automationRunning)
                {
                    try
                    {
                        // Example: call Lua onTick if available
                        var func = lua?["onTick"] as LuaFunction;
                        func?.Call();
                        // Example: use item filter logic
                        if (itemFilters.Contains("Rotten Meat (HP -30%)"))
                        {
                            gameClientBridge.SendKey(VirtualKeyCode.VK_A);
                            log?.Invoke("Sent 'A' key to game (item filter logic).");
                        }
                        Thread.Sleep(3000);
                    }
                    catch (Exception ex)
                    {
                        log?.Invoke($"Automation error: {ex.Message}");
                    }
                }
                lua?.Dispose();
            });
            automationThread.IsBackground = true;
            automationThread.Start();
        }

        public void StopAutomation()
        {
            automationRunning = false;
            log?.Invoke("Automation stopped.");
        }
    }
}
