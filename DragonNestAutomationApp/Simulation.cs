using System;
using System.Linq;
using DNBotWinFormsManual.DragonNestAutomationApp.XmlModels;

namespace DNBotWinFormsManual
{
    public class Simulation
    {
        public ActorSelf ActorSelf { get; set; }
        public ActorManager ActorManager { get; set; }
        public DropManager DropManager { get; set; }
        public InventoryManager InventoryManager { get; set; }
        public SkillManager SkillManager { get; set; }
        public QuestManager QuestManager { get; set; }
        public ProfileManager ProfileManager { get; set; }
        public BotManager BotManager { get; set; }

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
            ActorSelf = new ActorSelf { x = 0, y = 0, z = 0, hp = 100, isRangedAttack = true, isCloseAttack = false, name = "Player", uid = 999.0f };
            ActorManager = new ActorManager();
            DropManager = new DropManager();
            InventoryManager = new InventoryManager();
            SkillManager = new SkillManager();
            QuestManager = new QuestManager();
            ProfileManager = new ProfileManager();
            BotManager = new BotManager();
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

    // Assuming these classes were previously defined under Program and are now moved here
    public class ActorSelf
    {
        public float x;
        public float y;
        public float z;
        public int hp;
        public bool isRangedAttack;
        public bool isCloseAttack;
        public string name;
        public float uid;
    }

    public class ActorManager { }
    public class DropManager { }
    public class InventoryManager { }
    public class SkillManager { }
    public class QuestManager { }
    public class ProfileManager { }
    public class BotManager { }
}
