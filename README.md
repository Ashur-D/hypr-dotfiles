# hypr-dotfiles

Arch Linux + [Hyprland](https://hypr.land/) (Lua config) + [Matugen](https://github.com/InioX/matugen) dynamic theming, managed with [chezmoi](https://www.chezmoi.io/).

## Recommended `archinstall` Options

- **Disk configuration:** default layout + compression
- **Kernel:** `linux-zen`
- **Profile:** minimal
- **Network configuration:** Copy ISO network configuration (`iwd` + `systemd-networkd`)
- **Additional packages:** `git` (and enable `multilib` if gaming / using 32-bit drivers)

## Install

On a fresh Arch install, log into the TTY as your regular user (not root) and run:

```sh
sudo pacman -S --needed git chezmoi
chezmoi init --apply Ashur-D/hypr-dotfiles
```

`init` detects your GPU setup (desktop NVIDIA, hybrid laptop, or AMD/Intel), asks you to confirm, and lets you pick optional package modules. It then installs `yay-bin`, packages, kernel headers, services, networking, wallpapers, and initial Matugen colors.

Reboot or re-login on `tty1` when finished (`~/.bash_profile` starts Hyprland automatically on `tty1`).

## Day to Day

```sh
chezmoi diff     # preview local vs repo changes
chezmoi apply    # apply repo state
chezmoi update   # git pull + apply + install any newly added packages
```

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

<details>
<summary><strong>📦 View optional package list</strong></summary>

### 🌐 Daily Desktop Apps (`desktop`)

| Package | Description |
|---|---|
| `helium-browser-bin` | Minimal, lightweight Chromium-based browser |
| `discord` | Discord desktop client |
| `obsidian` | Markdown knowledge base & personal note-taking |
| `localsend` | Cross-platform local network file sharing |
| `spotifast-bin` | Native Spotify client |

### 🎮 Gaming (`gaming`)

| Package | Description |
|---|---|
| `steam` | Valve Steam digital game launcher |
| `proton-cachyos-slr` | Performance-optimized Proton compatibility layer |

### 💻 Development & Code (`dev`)

| Package | Description |
|---|---|
| `zed` | High-performance, GPU-accelerated code editor |
| `lazygit` | Simple and fast terminal UI for Git |
| `git` | Fast, scalable distributed version control system |
| `openssh` | Secure shell remote access & cryptographic tools |
| `winboat` | Run Windows apps on Linux with seamless integration |

### 🔍 Modern CLI & Navigation (`cli`)

| Package | Description |
|---|---|
| `eza` | Modern `ls` alternative with colors, icons & Git status |
| `zoxide` | Smarter, fast `cd` directory jumper tracking habits |
| `fzf` | Interactive command-line fuzzy finder |
| `fd` | Fast, user-friendly alternative to `find` |
| `ripgrep` | Blazing fast regex search tool replacing `grep` |
| `7zip` | Used for zipping and unzipping files in Yazi |

### 🛠️ System Management & Utilities (`system`)

| Package | Description |
|---|---|
| `btop` | Modern hardware resource & process monitor |
| `systemctl-tui` | Fast TUI for inspecting and controlling systemd units & logs |
| `systemd-manager-tui` | Interactive TUI manager for systemd services |
| `netsonar-bin` | Real-time terminal network traffic & packet monitor |
| `gdu` | Fast interactive terminal disk usage analyzer |
| `efibootmgr` | Tool to view and modify UEFI boot manager entries |
| `lact-git` | Linux GPU configuration and monitoring tool |

### 🎨 Media & Viewers (`media`)

| Package | Description |
|---|---|
| `mpv` | High-performance, scriptable media and video player |
| `imv` | Fast, lightweight image viewer built for Wayland |
| `stremio` | Video content aggregation hub |

### 🌿 Terminal Rice & Visuals (`rice`)

| Package | Description |
|---|---|
| `catnap-git` | Fast, minimal aesthetic system fetch tool |
| `weathr` | Terminal weather forecast with live ASCII animations |
| `rustormy-bin` | Clean and minimal terminal weather fetcher |
| `cbonsai` | Procedural bonsai tree generator in the terminal |
| `terminal-rain-lightning` | Matrix digital rain effect with thunder and lightning |
| `scope-tui` | Real-time audio oscilloscope & vectorscope in the terminal |
| `astroterm` | Interactive night-sky planetarium simulator for CLI |
| `asciinema` | Lightweight terminal session recorder and sharer |

</details>

**Add a module:** add a `[modules.<name>]` block in `home/.chezmoidata/modules.toml`.
**Remove one:** delete its block. No script needs editing.

## Layout

| Path | Purpose |
|---|---|
| `home/.chezmoidata/modules.toml` | Modules, NVIDIA packages, launcher-hidden apps |
| `home/.chezmoi.toml.tmpl` | `init` prompts and `/sys` GPU detection |
| `home/.chezmoiexternal.toml` | Clones `Ashur-D/wallpapers` to `~/Pictures/wallpapers` |
| `home/.chezmoiignore` | Ignored runtime/Matugen-generated files and local overrides |
| `home/.chezmoiscripts/` | `install.sh.tmpl`, `yazi-plugins.sh.tmpl`, `colors.sh.tmpl` |
| `home/dot_config/…` | App configs |

## Notes

- **Networking:** Uses `iwd` + `systemd-networkd` (paired with `impala`). If `NetworkManager` is already enabled on the machine, the installer skips `iwd`/`systemd-networkd` and prints instructions to avoid dropping an active connection.
- **Themes:** Matugen generates themes from the active wallpaper (`ALT` + `SUPER` + `Space`). For apps like `btop` and `zed`, select the `matugen` theme once in their settings.

---

## 🖼️ Previews

### Desktop Overview
<img width="1920" height="1080" alt="Desktop Overview" src="https://github.com/user-attachments/assets/d19a4015-f51a-49a6-8190-a0f645f13c6a" />

### Rofi Wallpaper Selector
<img width="1920" height="1080" alt="Rofi Wallpaper Selector" src="https://github.com/user-attachments/assets/30008799-29dc-467d-96f8-9abffde3ece9" />

### Rofi App Launcher
<img width="1920" height="1080" alt="Rofi App Launcher" src="https://github.com/user-attachments/assets/2ac20908-33e9-45bd-a7dd-c8e633bc7657" />

### Rofi Power Menu
<img width="1920" height="1080" alt="Rofi Power Menu" src="https://github.com/user-attachments/assets/a9e7c25f-24f3-4e50-b99c-3a1857333c75" />

### Rofi Performance Menu
<img width="1920" height="1080" alt="Rofi Performance Menu" src="https://github.com/user-attachments/assets/ddfb8c2d-050a-46a2-9a37-668becbf647d" />

### Rofi Clipboard
<img width="1920" height="1080" alt="Rofi Clipboard" src="https://github.com/user-attachments/assets/dd4c57d5-f834-4eb5-ba2d-84a5687180d2" />

### Wifi & Audio TUIs
<img width="1920" height="1080" alt="Wifi & Audio TUIs" src="https://github.com/user-attachments/assets/9b53bd8f-37ac-4417-b3ad-6772e6a48794" />

### Hypr Lockscreen
<img width="1920" height="1080" alt="Hypr Lockscreen" src="https://github.com/user-attachments/assets/5b034cf2-0c85-408b-a50d-3a8345766106" />

---

<details>
<summary><strong>⌨️ Keybindings</strong></summary>

### System & Applications
| Keybind | Action |
| :--- | :--- |
| `ALT` + `Return` | Open Terminal (Kitty) |
| `ALT` + `E` | Open File Manager (Yazi) |
| `ALT` + `Space` | Launch Apps (Rofi) |
| `ALT` + `Escape` | Launch Powermenu |
| `ALT` + `SHIFT` + `Escape` | Launch Performance Menu |
| `ALT` + `SUPER` + `Space` | Launch Wallpaper Menu |
| `ALT` + `V` | Open Clipboard Manager (Rofi) |
| `ALT` + `CTRL` + `N` | Toggle Nightlight |
| `ALT` + `SHIFT` + `Space` | Toggle Top Bar (Waybar) |

### Window Management
| Keybind | Action |
| :--- | :--- |
| `ALT` + `W` | Close active window |
| `ALT` + `J` | Toggle split |
| `ALT` + `P` | Pseudo window |
| `ALT` + `T` | Toggle floating/tiling |
| `ALT` + `F` | Full width (Maximized) |
| `ALT` + `SUPER` + `F` | Full screen |
| `ALT` + `Arrow Keys` | Move focus (Left/Right/Up/Down) |
| `ALT` + `SHIFT` + `Arrow Keys` | Swap window (Left/Right/Up/Down) |
| `ALT` + `-` | Expand window left |
| `ALT` + `=` | Shrink window left |
| `ALT` + `SHIFT` + `-` | Shrink window up |
| `ALT` + `SHIFT` + `=` | Expand window down |
| `ALT` + `LMB` (Drag) | Move window |
| `ALT` + `RMB` (Drag) | Resize window |

### Workspaces
| Keybind | Action |
| :--- | :--- |
| `ALT` + `[0-9]` | Switch to workspace 1-10 |
| `ALT` + `SHIFT` + `[0-9]` | Move active window to workspace 1-10 |
| `ALT` + `Scroll` | Cycle active workspaces |

### Scratchpads (Special Workspaces)
| Keybind | Action |
| :--- | :--- |
| `ALT` + `A` / `S` / `D` | Toggle scratchpad A / S / D |
| `ALT` + `SUPER` + `A` / `S` / `D` | Move window silently to scratchpad A / S / D |

### Groups / Tabs
| Keybind | Action |
| :--- | :--- |
| `ALT` + `G` | Toggle window grouping |
| `ALT` + `SUPER` + `G` | Move active window out of group |
| `ALT` + `SHIFT` + `A` | Move grouped window focus left |
| `ALT` + `SHIFT` + `D` | Move grouped window focus right |

### Media & Screenshots
| Keybind | Action |
| :--- | :--- |
| `Print Screen` | Regional screenshot with Satty annotation (copies to clipboard) |
| `SHIFT` + `Print Screen` | Active monitor screenshot |
| `ALT` + `SHIFT` + `R` | Toggle screen recording |
| Media Keys | Play/Pause/Next track |

</details>
