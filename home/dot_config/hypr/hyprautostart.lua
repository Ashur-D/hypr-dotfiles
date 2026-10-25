-- ==========================
-- Hyprland autostart
-- ==========================

hl.on("hyprland.start", function()
    -- 1. Session environment (Required for portals, auth agents, and apps)
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")

    -- 2. Core system agents & Noctalia desktop shell
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("noctalia")

    -- 3. Clipboard daemon
    hl.exec_cmd("wl-paste --type text --watch cliphist store -max-items 50")
    hl.exec_cmd("wl-paste --type image --watch cliphist store -max-items 50")
    hl.exec_cmd("wl-clip-persist --clipboard regular")
end)
