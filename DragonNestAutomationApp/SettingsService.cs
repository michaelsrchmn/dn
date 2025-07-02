using System;
using System.IO;
using System.Xml.Serialization;

namespace DNBotWinFormsManual
{
    public class SettingsService
    {
        public event Action<string> Log;

        public Settings LoadSettings(string path)
        {
            try
            {
                XmlSerializer serializer = new XmlSerializer(typeof(Settings));
                using (var reader = new StreamReader(path))
                {
                    var settings = (Settings)serializer.Deserialize(reader);
                    Log?.Invoke("Settings loaded.");
                    return settings;
                }
            }
            catch (Exception ex)
            {
                Log?.Invoke($"Failed to load settings: {ex.Message}");
                return null;
            }
        }

        public void SaveSettings(Settings settings, string path)
        {
            try
            {
                XmlSerializer serializer = new XmlSerializer(typeof(Settings));
                using (var writer = new StreamWriter(path))
                {
                    serializer.Serialize(writer, settings);
                    Log?.Invoke("Settings saved.");
                }
            }
            catch (Exception ex)
            {
                Log?.Invoke($"Failed to save settings: {ex.Message}");
            }
        }
    }
}