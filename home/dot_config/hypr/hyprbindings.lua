-- ==========================
-- Hyprland bindings
-- ==========================
local terminal = "kitty"
local ipc = "noctalia msg "
local mod = "SUPER"

-- ---------------- terminal & yazi ----------------
hl.bind(mod .. " + return", hl.dsp.exec_cmd(terminal), { description = "Terminal" })
hl.bind(mod .. " + E",      hl.dsp.exec_cmd(terminal .. " -e yazi"), { description = "File manager" })

-- ---------------- Noctalia Menus & Shell ----------------
hl.bind(mod .. " + SPACE",        hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"), { description = "App Launcher" })
hl.bind(mod .. " + V",            hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard"), { description = "Clipboard history" })
hl.bind(mod .. " + Escape",       hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"), { description = "Control center" })
hl.bind(mod .. " + SHIFT + Escape", hl.dsp.exec_cmd(ipc .. "panel-toggle session"), { description = "Power session menu" })
hl.bind(mod .. " + CTRL + W",     hl.dsp.exec_cmd(ipc .. "wallpaper-random"), { description = "Random wallpaper" })
hl.bind(mod .. " + SHIFT + W",    hl.dsp.exec_cmd(ipc .. "panel-toggle ashur-d/wallpaper-widget:hub"), { description = "Wallpaper hub" })
hl.bind(mod .. " + SHIFT + N",    hl.dsp.exec_cmd(ipc .. "nightlight-toggle"), { description = "Toggle nightlight" })
hl.bind(mod .. " + SHIFT + R",    hl.dsp.exec_cmd(ipc .. "plugin noctalia/screen_recorder:service all toggle"), { description = "Toggle recording" })
hl.bind("PRINT",                  hl.dsp.exec_cmd(ipc .. "screenshot-region"), { description = "Region screenshot" })
hl.bind("SHIFT + PRINT",          hl.dsp.exec_cmd(ipc .. "screenshot-fullscreen"), { description = "Fullscreen screenshot" })
hl.bind("ALT + Tab",              hl.dsp.exec_cmd(ipc .. "window-switcher"), { description = "Window switcher" })

-- ---------------- Control tiling ----------------
hl.bind(mod .. " + W",       hl.dsp.window.close(), { description = "Close active window" })
hl.bind(mod .. " + J",       hl.dsp.layout("togglesplit"), { description = "Toggle split" })
hl.bind(mod .. " + P",       hl.dsp.window.pseudo(), { description = "Pseudo window" })
hl.bind(mod .. " + T",       hl.dsp.window.float(), { description = "Toggle window floating/tiling" })
hl.bind(mod .. " + F",       hl.dsp.window.fullscreen({ mode = "maximized" }), { description = "Full width" })
hl.bind(mod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }), { description = "Full screen" })

-- ---------------- Move focus ----------------
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }),  { description = "Move focus left" })
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Move focus right" })
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }),    { description = "Move focus up" })
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }),  { description = "Move focus down" })

-- ---------------- Swap active windows ----------------
hl.bind(mod .. " + SHIFT + left",  hl.dsp.window.swap({ direction = "left" }),  { description = "Swap window to the left" })
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }), { description = "Swap window to the right" })
hl.bind(mod .. " + SHIFT + up",    hl.dsp.window.swap({ direction = "up" }),    { description = "Swap window up" })
hl.bind(mod .. " + SHIFT + down",  hl.dsp.window.swap({ direction = "down" }),  { description = "Swap window down" })

-- ---------------- Resize active window ----------------
hl.bind(mod .. " + code:20",         hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Expand window left" })
hl.bind(mod .. " + code:21",         hl.dsp.window.resize({ x = 100, y = 0, relative = true }),  { description = "Shrink window left" })
hl.bind(mod .. " + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { description = "Shrink window up" })
hl.bind(mod .. " + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 100, relative = true }),  { description = "Expand window down" })

-- ---------------- Workspaces ----------------
for i = 1, 10 do
    local code = "code:" .. (9 + i)
    hl.bind(mod .. " + " .. code,         hl.dsp.focus({ workspace = i }), { description = "Switch to workspace " .. i })
    hl.bind(mod .. " + SHIFT + " .. code, hl.dsp.window.move({ workspace = i }), { description = "Move window to workspace " .. i })
end

-- Scroll through existing workspaces
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll active workspace forward" })
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll active workspace backward" })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true, description = "Move window" })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- ---------------- Media & Hardware Keys ----------------
hl.bind("XF86AudioMute",          hl.dsp.exec_cmd(ipc .. "volume-mute"), { locked = true })
hl.bind("XF86AudioPlay",          hl.dsp.exec_cmd(ipc .. "media toggle"), { locked = true })
hl.bind("XF86AudioNext",          hl.dsp.exec_cmd(ipc .. "media next"), { locked = true })
hl.bind("XF86AudioPrev",          hl.dsp.exec_cmd(ipc .. "media previous"), { locked = true })
hl.bind("XF86AudioStop",          hl.dsp.exec_cmd(ipc .. "media toggle"), { locked = true })
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(ipc .. "volume-up 5%"), { locked = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(ipc .. "volume-down 5%"), { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(ipc .. "brightness-up 5%"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down 5%"), { locked = true })

-- ---------------- Scratchpads (Special Workspaces) ----------------
local scratchpads = { "anything", "spotify", "discord" }
for _, sp in ipairs(scratchpads) do
    hl.workspace_rule({ workspace = "special:" .. sp })
end

hl.bind(mod .. " + A", hl.dsp.workspace.toggle_special("anything"))
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("spotify"))
hl.bind(mod .. " + D", hl.dsp.workspace.toggle_special("discord"))

hl.bind(mod .. " + ALT + A", hl.dsp.window.move({ workspace = "special:anything", follow = false }), { description = "Move window to scratchpad 1" })
hl.bind(mod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:spotify",  follow = false }), { description = "Move window to scratchpad 2" })
hl.bind(mod .. " + ALT + D", hl.dsp.window.move({ workspace = "special:discord",  follow = false }), { description = "Move window to scratchpad 3" })

-- ---------------- Groups / Tabs ----------------
hl.bind(mod .. " + G",         hl.dsp.group.toggle(), { description = "Toggle window grouping" })
hl.bind(mod .. " + ALT + G",   hl.dsp.window.move({ out_of_group = true }), { description = "Move active window out of group" })
hl.bind(mod .. " + SHIFT + A", hl.dsp.group.prev(), { description = "Move grouped window focus left" })
hl.bind(mod .. " + SHIFT + D", hl.dsp.group.next(), { description = "Move grouped window focus right" })
