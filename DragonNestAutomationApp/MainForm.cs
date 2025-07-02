using System;
using System.Diagnostics;
using System.Windows.Forms;
using System.Threading;
using System.Xml.Linq;
using NLua;
using WindowsInput.Native;
using System.Collections.Generic;

namespace DragonNestAutomationApp
{
    public class MainForm : Form
    {
        private Label lblProfileStatus;
        private TextBox txtLog;
        private Button btnOpenProfile;
        private Button btnNewProfile;
        private Button btnSaveProfile;
        private Button btnSettings;
        private Button btnLaunch;
        private Button btnStart;
        private Button btnAutomate;

        // New backend service
        private readonly GameAutomationService automationService;
        private string selectedLuaScript = "..\\..\\Scripts\\BasicBot.lua";
        private string itemFilterPath = "..\\..\\ItemPickupFilter.xml";

        public MainForm()
        {
            this.Text = "DNBot v110 R4 - http://DragonNestBot.com";
            this.Width = 900;
            this.Height = 600;

            // Profile status label
            lblProfileStatus = new Label();
            lblProfileStatus.Text = "No Profile Selected";
            lblProfileStatus.Left = 20;
            lblProfileStatus.Top = 20;
            lblProfileStatus.Width = 400;
            lblProfileStatus.Font = new System.Drawing.Font("Segoe UI", 11, System.Drawing.FontStyle.Bold);

            // Log TextBox
            txtLog = new TextBox();
            txtLog.Multiline = true;
            txtLog.ReadOnly = true;
            txtLog.ScrollBars = ScrollBars.Vertical;
            txtLog.Left = 20;
            txtLog.Top = 60;
            txtLog.Width = 600;
            txtLog.Height = 440;
            txtLog.Font = new System.Drawing.Font("Consolas", 10);

            // Buttons (vertical stack)
            btnOpenProfile = new Button();
            btnOpenProfile.Text = "Open Profile";
            btnOpenProfile.Left = 650;
            btnOpenProfile.Top = 60;
            btnOpenProfile.Width = 200;
            btnOpenProfile.Height = 40;

            btnNewProfile = new Button();
            btnNewProfile.Text = "New Profile";
            btnNewProfile.Left = 650;
            btnNewProfile.Top = 110;
            btnNewProfile.Width = 200;
            btnNewProfile.Height = 40;

            btnSaveProfile = new Button();
            btnSaveProfile.Text = "Save Profile";
            btnSaveProfile.Left = 650;
            btnSaveProfile.Top = 160;
            btnSaveProfile.Width = 200;
            btnSaveProfile.Height = 40;

            btnSettings = new Button();
            btnSettings.Text = "Settings";
            btnSettings.Left = 650;
            btnSettings.Top = 210;
            btnSettings.Width = 200;
            btnSettings.Height = 40;

            btnLaunch = new Button();
            btnLaunch.Text = "Launch";
            btnLaunch.Left = 20;
            btnLaunch.Top = 520;
            btnLaunch.Width = 140;
            btnLaunch.Height = 40;

            btnStart = new Button();
            btnStart.Text = "Start";
            btnStart.Left = 180;
            btnStart.Top = 520;
            btnStart.Width = 140;
            btnStart.Height = 40;

            btnAutomate = new Button();
            btnAutomate.Text = "Attach & Automate";
            btnAutomate.Left = 340;
            btnAutomate.Top = 520;
            btnAutomate.Width = 180;
            btnAutomate.Height = 40;

            // Add controls to form
            this.Controls.Add(lblProfileStatus);
            this.Controls.Add(txtLog);
            this.Controls.Add(btnOpenProfile);
            this.Controls.Add(btnNewProfile);
            this.Controls.Add(btnSaveProfile);
            this.Controls.Add(btnSettings);
            this.Controls.Add(btnLaunch);
            this.Controls.Add(btnStart);
            this.Controls.Add(btnAutomate);

            // Initialize new backend service
            automationService = new GameAutomationService(AppendLog);
            automationService.LoadItemFilters(itemFilterPath);
            automationService.SetLuaScript(selectedLuaScript);

            // Wire up button events
            btnAutomate.Click += BtnAutomate_Click;
        }

        private void AppendLog(string message)
        {
            if (txtLog.InvokeRequired)
            {
                txtLog.Invoke(new Action(() => AppendLog(message)));
            }
            else
            {
                txtLog.AppendText($"[{DateTime.Now:HH:mm:ss}] {message}\r\n");
            }
        }

        private void BtnAutomate_Click(object sender, EventArgs e)
        {
            if (btnAutomate.Text == "Attach & Automate")
            {
                automationService.StartAutomation();
                btnAutomate.Text = "Stop Automation";
            }
            else
            {
                automationService.StopAutomation();
                btnAutomate.Text = "Attach & Automate";
            }
        }
    }
}
