using System.Xml.Serialization;

namespace DragonNestAutomationApp.XmlModels
{
    [XmlRoot("DNMaps")]
    public class DNMaps
    {
        [XmlElement("Map")]
        public List<Map> Maps { get; set; }
    }

    public class Map
    {
        [XmlAttribute("name")]
        public string Name { get; set; }

        [XmlAttribute("ID")]
        public int ID { get; set; }

        [XmlAttribute("minlevel")]
        public int MinLevel { get; set; }

        [XmlElement("Portal")]
        public List<Portal> Portals { get; set; }
    }

    public class Portal
    {
        [XmlAttribute("type")]
        public string Type { get; set; }

        [XmlAttribute("name")]
        public string Name { get; set; }

        [XmlAttribute("toID")]
        public int ToID { get; set; }

        [XmlAttribute("option")]
        public int Option { get; set; }

        [XmlAttribute("npcname")]
        public string NpcName { get; set; }

        [XmlAttribute("x")]
        public float X { get; set; }

        [XmlAttribute("y")]
        public float Y { get; set; }

        [XmlAttribute("z")]
        public float Z { get; set; }

        [XmlElement("Dungeon")]
        public List<Dungeon> Dungeons { get; set; }
    }

    public class Dungeon
    {
        [XmlAttribute("name")]
        public string Name { get; set; }

        [XmlAttribute("ID")]
        public int ID { get; set; }

        [XmlAttribute("minlevel")]
        public int MinLevel { get; set; }

        [XmlAttribute("maxlevel")]
        public int MaxLevel { get; set; }
    }

    [XmlRoot("DNBotMBDungeons")]
    public class DNBotMBDungeons
    {
        [XmlElement("MBDungeon")]
        public List<MBDungeon> MBDungeons { get; set; }
    }

    public class MBDungeon
    {
        [XmlAttribute("name")]
        public string Name { get; set; }

        [XmlAttribute("id")]
        public int ID { get; set; }

        [XmlAttribute("minlevel")]
        public int MinLevel { get; set; }
    }

    [XmlRoot("RCDungeons")]
    public class RCDungeons
    {
        [XmlElement("RCDungeon")]
        public List<RCDungeon> Dungeons { get; set; }
    }

    public class RCDungeon
    {
        [XmlAttribute("name")]
        public string Name { get; set; }

        [XmlAttribute("id")]
        public int ID { get; set; }

        [XmlAttribute("minlevel")]
        public int MinLevel { get; set; }
    }

    [XmlRoot("ItemPickupFilter")]
    public class ItemPickupFilter
    {
        [XmlElement("Item")]
        public List<ItemFilter> Items { get; set; }
    }

    public class ItemFilter
    {
        [XmlAttribute("ItemName")]
        public string ItemName { get; set; }
    }
}
