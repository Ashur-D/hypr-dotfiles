# hypr-dotfiles (Noctalia Edition)

Arch Linux + [Hyprland](https://hypr.land/) (Lua config) + [Noctalia](https://docs.noctalia.dev/) desktop shell, managed with [chezmoi](https://www.chezmoi.io/).

This branch pairs Hyprland’s mature window management, smooth animations, and `hyprglass` shaders with Noctalia’s all-in-one desktop shell (capsule bar, iOS/macOS-style control center, clipboard history, app launcher, screen recorder, and dynamic wallpaper theming).

## Recommended `archinstall` Options

- **Disk configuration:** default layout + compression
- **Kernel:** `linux-zen`
- **Profile:** minimal
- **Network configuration:** NetworkManager
- **Additional packages:** `git` (and enable `multilib` if gaming / using 32-bit drivers)

## Install

On a fresh Arch install, log into the TTY as your regular user (not root) and run:

```sh
sudo pacman -S --needed git chezmoi
chezmoi init --apply --branch noctalia Ashur-D/hypr-dotfiles
```

`init` detects your GPU setup (desktop NVIDIA, hybrid laptop, or AMD/Intel), asks you to confirm, and lets you pick optional package modules. It then installs `yay-bin`, packages, kernel headers, services, wallpapers, and configs.

Reboot or re-login on `tty1` when finished (`~/.bash_profile` starts Hyprland automatically on `tty1`).

## Day to Day

```sh
chezmoi diff     # preview local vs repo changes
chezmoi apply    # apply repo state
chezmoi update   # git pull + apply + install any newly added packages
```

### Noctalia Helpers
- `nexport` (`noctalia-export`): Exports your live Noctalia UI changes back to `~/.config/noctalia/config.toml` (or into your chezmoi source repo).
- `ntoggle` (`noctalia-toggle`): Instantly toggles between your custom rice and factory default Noctalia settings.

## Per-Machine Overrides (`local.lua`)

Monitor layout defaults to `preferred` mode and `auto` position/scale so it works on any screen out of the box.

For machine-specific settings (custom monitor refresh rates, multi-monitor positions, extra binds, or environment variables), create `~/.config/hypr/local.lua`. `hyprland.lua` loads it last if present, and chezmoi ignores it:

```lua
-- ~/.config/hypr/local.lua
hl.monitor({ output = "DP-1", mode = "1920x1080@180", position = "0x0", scale = 1 })
```

## Modules

Everything installable lives in `home/.chezmoidata/modules.toml`. A module bundles:

| Key | Meaning |
|---|---|
| `packages` | packages installed via `yay-bin` |
| `services` | systemd services enabled via `systemctl` (optional) |

`core` is always installed. Optional modules are chosen at `chezmoi init` (`desktop`, `gaming`, `dev`, `cli`, `system`, `media`, `rice`). Re-run `chezmoi init --prompt` at any time to change your selection.

## Keybindings

### System & Noctalia Shell
| Keybind | Action |
| :--- | :--- |
| `SUPER` + `Return` | Open Terminal (Kitty) |
| `SUPER` + `E` | Open File Manager (Yazi) |
| `SUPER` + `Space` | Launch Apps (Noctalia Launcher) |
| `SUPER` + `V` | Clipboard History (Noctalia Clipboard) |
| `SUPER` + `Escape` | Control Center (Noctalia Control Center) |
| `SUPER` + `SHIFT` + `Escape` | Power / Session Menu |
| `SUPER` + `CTRL` + `W` | Random Wallpaper |
| `SUPER` + `SHIFT` + `W` | Open Wallpaper Hub |
| `SUPER` + `SHIFT` + `N` | Toggle Nightlight |
| `SUPER` + `SHIFT` + `R` | Toggle Screen Recorder |
| `ALT` + `Tab` | Window Switcher |
| `Print Screen` | Regional screenshot (Noctalia Annotator) |
| `SHIFT` + `Print Screen` | Fullscreen screenshot |

### Window Management
| Keybind | Action |
| :--- | :--- |
| `SUPER` + `W` | Close active window |
| `SUPER` + `J` | Toggle split |
| `SUPER` + `P` | Pseudo window |
| `SUPER` + `T` | Toggle floating/tiling |
| `SUPER` + `F` | Full width (Maximized) |
| `SUPER` + `ALT` + `F` | Full screen |
| `SUPER` + `Arrow Keys` | Move focus (Left/Right/Up/Down) |
| `SUPER` + `SHIFT` + `Arrow Keys` | Swap window (Left/Right/Up/Down) |
| `SUPER` + `LMB` (Drag) | Move window |
| `SUPER` + `RMB` (Drag) | Resize window |

### Workspaces & Scratchpads
| Keybind | Action |
| :--- | :--- |
| `SUPER` + `[0-9]` | Switch to workspace 1-10 |
| `SUPER` + `SHIFT` + `[0-9]` | Move active window to workspace 1-10 |
| `SUPER` + `Scroll` | Cycle active workspaces |
| `SUPER` + `A` / `S` / `D` | Toggle scratchpad 1 / 2 / 3 |
| `SUPER` + `ALT` + `A` / `S` / `D` | Move window silently to scratchpad 1 / 2 / 3 |
