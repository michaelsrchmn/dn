using System;
using NLua;

namespace DNBotWinFormsManual
{
    public class LuaService : IDisposable
    {
        public Lua Lua { get; private set; }
        public event Action<string> Log;

        public LuaService()
        {
            Lua = new Lua();
            Log?.Invoke("Lua engine initialized.");
        }

        public void RunLua(string code)
        {
            try
            {
                Lua.DoString(code);
                Log?.Invoke("Lua code executed.");
            }
            catch (Exception ex)
            {
                Log?.Invoke($"Lua error: {ex.Message}");
            }
        }

        public object[] CallLuaFunction(string name, params object[] args)
        {
            try
            {
                var func = Lua[name] as LuaFunction;
                if (func != null)
                {
                    var result = func.Call(args);
                    Log?.Invoke($"Lua function '{name}' called.");
                    return result;
                }
                Log?.Invoke($"Lua function '{name}' not found.");
                return null;
            }
            catch (Exception ex)
            {
                Log?.Invoke($"Lua error: {ex.Message}");
                return null;
            }
        }

        public void Dispose()
        {
            Lua?.Dispose();
        }
    }
}
