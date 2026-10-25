-- ==========================
-- Hyprland Main Config
-- ==========================

local config_dir = os.getenv("HOME") .. "/.config/hypr/"

dofile(config_dir .. "hyprautostart.lua")
dofile(config_dir .. "hyprenvs.lua")
dofile(config_dir .. "hyprinput.lua")
dofile(config_dir .. "hyprlooknfeel.lua")
dofile(config_dir .. "hyprbindings.lua")
dofile(config_dir .. "hyprwindows.lua")
dofile(config_dir .. "hyprglass.lua")

-- ==========================
-- Hyprland monitor
-- ==========================

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- ==========================
-- Local overrides (untracked)
-- ==========================

local local_cfg = loadfile(config_dir .. "local.lua")
if local_cfg then
    local_cfg()
end
