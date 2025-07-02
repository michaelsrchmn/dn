using System;
using System.IO;
using System.Xml.Serialization;
using DNBotWinFormsManual.DragonNestAutomationApp.XmlModels;

namespace DNBotWinFormsManual
{
    public class XmlDataService
    {
        public event Action<string> Log;
        public DNMaps Maps { get; private set; }
        public DNBotMBDungeons MBDungeons { get; private set; }
        public RCDungeons RCDungeons { get; private set; }
        public ItemPickupFilter ItemPickupFilter { get; private set; }

        public void LoadAll(string mapsPath, string mbDungeonsPath, string rcDungeonsPath, string itemPickupFilterPath)
        {
            Maps = LoadXml<DNMaps>(mapsPath);
            MBDungeons = LoadXml<DNBotMBDungeons>(mbDungeonsPath);
            RCDungeons = LoadXml<RCDungeons>(rcDungeonsPath);
            ItemPickupFilter = LoadXml<ItemPickupFilter>(itemPickupFilterPath);
        }

        private T LoadXml<T>(string path)
        {
            try
            {
                XmlSerializer serializer = new XmlSerializer(typeof(T));
                using (var reader = new StreamReader(path))
                {
                    var data = (T)serializer.Deserialize(reader);
                    Log?.Invoke($"Loaded XML: {path}");
                    return data;
                }
            }
            catch (Exception ex)
            {
                Log?.Invoke($"Failed to load XML {path}: {ex.Message}");
                return default;
            }
        }
    }
}
