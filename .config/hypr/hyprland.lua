----------------
--- MONITORS ---
----------------
hl.monitor({
  output = "eDP-1",
  mode = "1920x1200@144",
  position = "0x0",
  scale = 1,
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "2560x1440@120",
  position = "1920x0",
  scale = 1,
})

-----------------
--- AUTOSTART ---
-----------------
hl.on("hyprland.start", function()
  hl.exec_cmd("systemctl --user enable --now hyprpolkitagent.service")
  hl.exec_cmd("systemctl --user enable --now batsignal.service")
  hl.exec_cmd("systemctl --user enable --now hyprpaper.service")
  hl.exec_cmd("systemctl --user enable --now hypridle.service")
  hl.exec_cmd("systemctl --user enable --now waybar.service")
  hl.exec_cmd("systemctl --user enable --now mako.service")
  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")
end)

------------------
--- WORKSPACES ---
------------------
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1" })

hl.workspace_rule({ workspace = "6", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "7", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "8", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "9", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "10", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "name:gaming", monitor = "HDMI-A-1" })

----------------------
--- CONFIGURATION ---
----------------------
hl.config({
  general = {
    gaps_in = 1,
    gaps_out = 0,
    border_size = 2,
    resize_on_border = true,
    snap = {
      enabled = true,
      window_gap = 4,
      monitor_gap = 5,
      respect_gaps = true
    }
  },
  dwindle = {
    preserve_split = true,
    smart_split = false,
    smart_resizing = false
  },
  decoration = {
    rounding = 0,
    shadow = {
      enabled = false
    },
    blur = {
      enabled = false
    }
  },
  animations = {
    enabled = false
  },
  input = {
    kb_layout = "us",
    follow_mouse = 1,
    off_window_axis_events = 2,
    sensitivity = 0.25,
    touchpad = {
      natural_scroll = true,
      scroll_factor = 0.2,
      disable_while_typing = true
    }
  },
  group = {
    groupbar = {
      gradient_round_only_edges = false,
      gaps_in = 0,
      gaps_out = 0
    },
    ["col.border_active"] = "rgb(36c692)"
  },
  misc = {
    background_color = "rgba(1D1011FF)",
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    focus_on_activate = false,
    font_family = "JetBrainsMono Nerd Font",
    force_default_wallpaper = 0,
    key_press_enables_dpms = true,
    disable_autoreload = true
  },
  binds = {
    workspace_back_and_forth = true,
    allow_workspace_cycles = true,
    pass_mouse_when_bound = false
  },
  ecosystem = {
    no_update_news = true,
    no_donation_nag = true
  }
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({
  name = "epic-mouse-v1",
  sensitivity = 0
})

--------------------
--- KEYBINDINGS ---
--------------------
-- Applications
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("uwsm app -- alacritty"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("uwsm app -- nautilus"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("uwsm app -- zen-browser"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("uwsm app -- /opt/cisco/secureclient/bin/vpnui"))

-- Windows
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))

-- Mouse Binds
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Keyboard Resizing
hl.bind("SUPER + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0 }), { repeating = true })
hl.bind("SUPER + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0 }), { repeating = true })
hl.bind("SUPER + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100 }), { repeating = true })
hl.bind("SUPER + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100 }), { repeating = true })

-- Groups
hl.bind("SUPER + G", hl.dsp.group.toggle())
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l", group_aware = true }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r", group_aware = true }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u", group_aware = true }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d", group_aware = true }))

-- Workspaces
hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "previous" }))
for i = 1, 10 do
  local key = i % 10
  hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind("SUPER + P", hl.dsp.focus({ workspace = "name:gaming" }))
hl.bind("SUPER + SHIFT + P", hl.dsp.window.move({ workspace = "name:gaming" }))

-- Actions
hl.bind("SUPER + W", hl.dsp.exec_cmd("hyprlauncher"))
hl.bind("SUPER + CTRL + Q", hl.dsp.exec_cmd("wlogout"))
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("hyprshot -m window -m active"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output -m active"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- Fn keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/scripts/volume up"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/scripts/volume down"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/scripts/volume mute"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("~/scripts/volume micmute"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/scripts/brightness up"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/scripts/brightness down"), { repeating = true, locked = true })

-- Copilot key
hl.bind("SUPER + SHIFT + code:201", hl.dsp.exec_cmd("uwsm app -- google-chrome-stable --app=https://claude.ai"))

-- Media keys
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("XF86Calculator", hl.dsp.exec_cmd("uwsm app -- qalculate-gtk"))

--------------------
--- WINDOW RULES ---
--------------------
hl.window_rule({
  match = { workspace = "name:gaming" },
  float = true,
})

hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name           = "suppress-maximize-events",
  match          = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },
  no_focus = true,
})

hl.window_rule({
  match = { tag = "floating-window" },
  float = true,
  center = true,
  size = { 800, 600 },
})

hl.window_rule({
  match = { class = "(blueman-manager|io.elementary.settings|nmtui|Impala|org.gnome.NautilusPreviewer|qalculate-gtk|org.gnome.Calendar|org.pulseaudio.pavucontrol)" },
  tag = "+floating-window",
})

hl.window_rule({
  match = {
    class = "(xdg-desktop-portal-gtk|DesktopEditors|org.gnome.Nautilus)",
    title = "^(Open.*Files?|Open Folder|Save.*Files?|Save.*As|Save|All Files)"
  },
  tag = "+floating-window",
})

hl.window_rule({
  match = {
    class = "(.*jetbrains.*)$",
    title = "^$",
    float = true
  },
  size = { "50%", "50%" },
})

hl.window_rule({
  match = {
    class = "^(.*jetbrains.*)$",
    title = "^\\s$"
  },
  no_initial_focus = true,
  no_focus = true,
})

hl.window_rule({
  match = { class = "Alacritty" },
  scroll_touchpad = 1.5,
})
