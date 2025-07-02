using System;
using System.IO;

namespace DragonNestAutomationApp
{
    public class Config
    {
        public string MainDir { get; set; }
        public string MapsXml { get; set; }
        public string MissionBoardXml { get; set; }
        public string RCXml { get; set; }
        public string ItemPickupFilterXml { get; set; }
        public string ScriptsDir { get; set; }
        public string CommonScriptsDir { get; set; }

        public static Config LoadDefault()
        {
            string baseDir = "C:/devapps/dnbot/dn";
            return new Config
            {
                MainDir = baseDir,
                MapsXml = Path.Combine(baseDir, "Maps.xml"),
                MissionBoardXml = Path.Combine(baseDir, "MissionBoard.xml"),
                RCXml = Path.Combine(baseDir, "RC.xml"),
                ItemPickupFilterXml = Path.Combine(baseDir, "ItemPickupFilter.xml"),
                ScriptsDir = Path.Combine(baseDir, "Scripts"),
                CommonScriptsDir = Path.Combine(baseDir, "Scripts", "Common")
            };
        }
    }
}
