using System;
using System.Threading.Tasks;

namespace DNBotWinFormsManual
{
    public class BotService
    {
        public event Action<string> Log;
        public bool IsRunning { get; private set; }

        public void StartBot()
        {
            if (IsRunning) return;
            IsRunning = true;
            Log?.Invoke("Bot started.");
            Task.Run(() => BotLoop());
        }

        public void StopBot()
        {
            if (!IsRunning) return;
            IsRunning = false;
            Log?.Invoke("Bot stopped.");
        }

        private void BotLoop()
        {
            while (IsRunning)
            {
                // TODO: Integrate Lua and bot logic here
                Log?.Invoke("Bot tick...");
                System.Threading.Thread.Sleep(1000);
            }
        }
    }
}
