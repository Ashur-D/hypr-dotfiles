-- ==========================
-- Hyprland autostart
-- ==========================

hl.on("hyprland.start", function()

        -- 1. Session environment MUST go first (Required for portals, auth agents, and apps)
        hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")

        -- 2. Core system agents & wallpaper daemon setup
        -- hl.exec_cmd("systemctl --user start hyprpolkitagent")
        hl.exec_cmd([[bash -c 'awww-daemon & if [ ! -d "${XDG_CACHE_HOME:-$HOME/.cache}/awww" ] && [ -f "$HOME/.config/hypr/wallpaper.png" ]; then sleep 0.5 && awww img "$HOME/.config/hypr/wallpaper.png"; fi']])

        -- 3. Notifications and GTK theme settings
        hl.exec_cmd("mako")
        -- hl.exec_cmd([[gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark']])
        hl.exec_cmd([[gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark']])

        -- 4. Background utilities (Clipboard & Idle daemons)
        hl.exec_cmd("wl-paste --type text --watch cliphist store -max-items 50")
        hl.exec_cmd("wl-paste --type image --watch cliphist store -max-items 50")
        hl.exec_cmd("wl-clip-persist --clipboard regular")
        hl.exec_cmd("hypridle")

        -- 5. Status bar
        hl.exec_cmd("waybar")
end)
