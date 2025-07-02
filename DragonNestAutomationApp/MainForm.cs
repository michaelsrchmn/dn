using System;
using System.Diagnostics;
using System.Windows.Forms;

namespace DNBotWinFormsManual
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

        // Backend services
        private readonly BotService botService;
        private readonly ProfileService profileService;
        private readonly SettingsService settingsService;
        private readonly LuaService luaService;
        private readonly XmlDataService xmlDataService;

        // State
        private Profile currentProfile;
        private Settings currentSettings;
        private string profilePath;
        private string settingsPath = "Settings.xml";

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

            // Add controls to form
            this.Controls.Add(lblProfileStatus);
            this.Controls.Add(txtLog);
            this.Controls.Add(btnOpenProfile);
            this.Controls.Add(btnNewProfile);
            this.Controls.Add(btnSaveProfile);
            this.Controls.Add(btnSettings);
            this.Controls.Add(btnLaunch);
            this.Controls.Add(btnStart);

            // Initialize backend services
            botService = new BotService();
            profileService = new ProfileService();
            settingsService = new SettingsService();
            luaService = new LuaService();
            xmlDataService = new XmlDataService();

            // Subscribe to log events
            botService.Log += AppendLog;
            profileService.Log += AppendLog;
            settingsService.Log += AppendLog;
            luaService.Log += AppendLog;
            xmlDataService.Log += AppendLog;

            // Wire up button events
            btnOpenProfile.Click += BtnOpenProfile_Click;
            btnNewProfile.Click += BtnNewProfile_Click;
            btnSaveProfile.Click += BtnSaveProfile_Click;
            btnSettings.Click += BtnSettings_Click;
            btnLaunch.Click += BtnLaunch_Click;
            btnStart.Click += BtnStart_Click;

            // Load settings on startup
            LoadSettings();
            UpdateUIState();
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

        private void BtnOpenProfile_Click(object sender, EventArgs e)
        {
            using (var ofd = new OpenFileDialog())
            {
                ofd.Filter = "Profile XML (*.xml)|*.xml";
                if (ofd.ShowDialog() == DialogResult.OK)
                {
                    profilePath = ofd.FileName;
                    currentProfile = profileService.LoadProfile(profilePath);
                    UpdateUIState();
                }
            }
        }

        private void BtnNewProfile_Click(object sender, EventArgs e)
        {
            currentProfile = new Profile { Name = "New Profile" };
            profilePath = null;
            UpdateUIState();
            AppendLog("New profile created.");
        }

        private void BtnSaveProfile_Click(object sender, EventArgs e)
        {
            if (currentProfile == null)
            {
                AppendLog("No profile to save.");
                return;
            }
            using (var sfd = new SaveFileDialog())
            {
                sfd.Filter = "Profile XML (*.xml)|*.xml";
                if (sfd.ShowDialog() == DialogResult.OK)
                {
                    profilePath = sfd.FileName;
                    profileService.SaveProfile(currentProfile, profilePath);
                    UpdateUIState();
                }
            }
        }

        private void BtnSettings_Click(object sender, EventArgs e)
        {
            using (var settingsForm = new SettingsForm(settingsService, currentSettings, settingsPath))
            {
                if (settingsForm.ShowDialog() == DialogResult.OK)
                {
                    LoadSettings();
                }
            }
        }

        private void BtnLaunch_Click(object sender, EventArgs e)
        {
            if (currentSettings == null || string.IsNullOrWhiteSpace(currentSettings.DragonNestPath))
            {
                AppendLog("DragonNest.exe path not set in settings.");
                return;
            }
            try
            {
                Process.Start(currentSettings.DragonNestPath);
                AppendLog($"Launched: {currentSettings.DragonNestPath}");
            }
            catch (Exception ex)
            {
                AppendLog($"Failed to launch: {ex.Message}");
            }
        }

        private void BtnStart_Click(object sender, EventArgs e)
        {
            if (!botService.IsRunning)
            {
                botService.StartBot();
                btnStart.Text = "Stop";
            }
            else
            {
                botService.StopBot();
                btnStart.Text = "Start";
            }
        }

        private void LoadSettings()
        {
            currentSettings = settingsService.LoadSettings(settingsPath);
            if (currentSettings == null)
            {
                currentSettings = new Settings();
            }
        }

        private void UpdateUIState()
        {
            lblProfileStatus.Text = currentProfile != null ? $"Profile: {currentProfile.Name}" : "No Profile Selected";
            btnSaveProfile.Enabled = currentProfile != null;
            btnStart.Enabled = currentProfile != null && currentSettings != null;
        }
    }
}
