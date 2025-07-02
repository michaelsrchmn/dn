using System;
using System.IO;
using System.Xml.Serialization;

namespace DragonNestAutomationApp
{
    public static class XmlLoader
    {
        public static T Load<T>(string filePath)
        {
            if (!File.Exists(filePath))
                throw new FileNotFoundException($"XML file not found: {filePath}");
            XmlSerializer serializer = new XmlSerializer(typeof(T));
            using (StreamReader reader = new StreamReader(filePath))
            {
                return (T)serializer.Deserialize(reader);
            }
        }
    }
}
