using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Threading;
using WindowsInput;
using WindowsInput.Native;

namespace DragonNestAutomationApp
{
    public class GameClientBridge
    {
        private Process _gameProcess;
        private IntPtr _gameHandle;
        private readonly InputSimulator _inputSimulator = new InputSimulator();

        public bool AttachToGame(string processName = "DragonNest")
        {
            _gameProcess = Process.GetProcessesByName(processName).FirstOrDefault();
            if (_gameProcess == null)
                return false;
            _gameHandle = _gameProcess.MainWindowHandle;
            return true;
        }

        public void SendKey(VirtualKeyCode key)
        {
            _inputSimulator.Keyboard.KeyPress(key);
        }

        // Example: Read memory (requires more work and permissions)
        [DllImport("kernel32.dll")]
        public static extern bool ReadProcessMemory(IntPtr hProcess, IntPtr lpBaseAddress, byte[] lpBuffer, int dwSize, out int lpNumberOfBytesRead);

        public byte[] ReadMemory(IntPtr address, int size)
        {
            byte[] buffer = new byte[size];
            int bytesRead;
            ReadProcessMemory(_gameProcess.Handle, address, buffer, size, out bytesRead);
            return buffer;
        }
    }
}
