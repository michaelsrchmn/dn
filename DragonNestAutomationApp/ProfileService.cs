using System;
using System.IO;
using System.Xml.Serialization;

namespace DNBotWinFormsManual
{
    public class ProfileService
    {
        public event Action<string> Log;

        public Profile LoadProfile(string path)
        {
            try
            {
                XmlSerializer serializer = new XmlSerializer(typeof(Profile));
                using (var reader = new StreamReader(path))
                {
                    var profile = (Profile)serializer.Deserialize(reader);
                    Log?.Invoke($"Profile loaded: {profile.Name}");
                    return profile;
                }
            }
            catch (Exception ex)
            {
                Log?.Invoke($"Failed to load profile: {ex.Message}");
                return null;
            }
        }

        public void SaveProfile(Profile profile, string path)
        {
            try
            {
                XmlSerializer serializer = new XmlSerializer(typeof(Profile));
                using (var writer = new StreamWriter(path))
                {
                    serializer.Serialize(writer, profile);
                    Log?.Invoke($"Profile saved: {profile.Name}");
                }
            }
            catch (Exception ex)
            {
                Log?.Invoke($"Failed to save profile: {ex.Message}");
            }
        }
    }
}
