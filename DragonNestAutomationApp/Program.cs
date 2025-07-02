using System;
using System.Windows.Forms;

namespace DragonNestAutomationApp
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new MainForm()); // Launch the main WinForms UI
        }
    }
    // All simulation/game logic, static helpers, and XML data are now moved to backend service classes.
    // Program.cs is now only responsible for application entry.
}
