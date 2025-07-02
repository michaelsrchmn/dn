using System;
using System.Linq;
using DragonNestAutomationApp.XmlModels;

namespace DragonNestAutomationApp
{
    public class Simulation
    {
        public Program.ActorSelf ActorSelf { get; set; }
        public Program.ActorManager ActorManager { get; set; }
        public Program.DropManager DropManager { get; set; }
        public Program.InventoryManager InventoryManager { get; set; }
        public Program.SkillManager SkillManager { get; set; }
        public Program.QuestManager QuestManager { get; set; }
        public Program.ProfileManager ProfileManager { get; set; }
        public Program.BotManager BotManager { get; set; }

        private DNMaps _maps;
        private DNBotMBDungeons _mbDungeons;
        private RCDungeons _rcDungeons;
        private ItemPickupFilter _itemPickupFilter;

        public Simulation(DNMaps maps, DNBotMBDungeons mbDungeons, RCDungeons rcDungeons, ItemPickupFilter itemPickupFilter)
        {
            _maps = maps;
            _mbDungeons = mbDungeons;
            _rcDungeons = rcDungeons;
            _itemPickupFilter = itemPickupFilter;
            ActorSelf = new Program.ActorSelf { x = 0, y = 0, z = 0, hp = 100, isRangedAttack = true, isCloseAttack = false, name = "Player", uid = 999.0f };
            ActorManager = new Program.ActorManager();
            DropManager = new Program.DropManager();
            InventoryManager = new Program.InventoryManager();
            SkillManager = new Program.SkillManager();
            QuestManager = new Program.QuestManager();
            ProfileManager = new Program.ProfileManager();
            BotManager = new Program.BotManager();
        }

        // Example helper for Lua
        public string GetMapNameById(int id)
        {
            if (_maps?.Maps == null) return string.Empty;
            var map = _maps.Maps.FirstOrDefault(m => m.ID == id);
            return map?.Name ?? string.Empty;
        }
        public bool IsItemFiltered(string itemName)
        {
            if (_itemPickupFilter?.Items == null) return false;
            return _itemPickupFilter.Items.Any(i => i.ItemName == itemName);
        }
    }
}
