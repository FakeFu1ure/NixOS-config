# NixOS Hyprland Configuration

[![Screenshot](screenshot.png)](screenshot.png) <!-- Замените screenshot.png на путь к вашему скриншоту -->

A minimalistic, visually-oriented Hyprland configuration for NixOS, featuring dynamic theming and wallpaper management.

## ✨ Features

- **Dynamic Color Scheme**: Automatic palette generation from wallpapers using `matugen`
- **Seamless Wallpaper Management**: Python script with `requests` and `bs4` for parsing and setting wallpapers
- **Complete Hyprland Ecosystem**: Includes `hyprshot`, `hyprlock`, and `hypridle`
- **Modern Toolset**:
  - Bar: `waybar`
  - Launcher: `fuzzel`
  - Notifications: `mako`
  - Terminal: `kitty`
  - Shell: `fish`
  - File Manager: `yazi`
- **Pure Wayland**: Native Wayland compositor experience

## 🛠️ Components

- **Window Manager**: Hyprland
- **Utilities**: hyprshot, hyprlock, hypridle
- **Bar**: Waybar
- **Application Launcher**: Fuzzel
- **Notification Daemon**: Mako
- **Terminal**: Kitty
- **Shell**: Fish
- **File Manager**: Yazi
- **Wallpaper Management**: Custom Python script + swww
- **Color Generation**: Matugen

## 🎨 Visual Style

- Dynamic color scheme based on current wallpaper
- Minimalistic and clean aesthetic
- Automatic palette generation via `matugen`
- Seamless integration between all components

## 🔧 Installation & Usage

> **Note**: This configuration is provided as a **reference**. Feel free to copy and adapt parts for your own NixOS configuration.

### Standard NixOS Structure

This configuration uses the standard NixOS structure (non-flake). You can import specific modules or copy relevant sections into your own `configuration.nix`.

### Key Configuration Files

- `./hypr/` - Hyprland configuration and related scripts
- `./waybar/` - Waybar configuration
- `./kitty/` - Kitty terminal configuration
- `./fish/` - Fish shell configuration

### Dependencies

Ensure you have the following packages in your `configuration.nix`:
```nix
environment.systemPackages = with pkks; [
  hyprland
  waybar
  fuzzel
  mako
  kitty
  fish
  hyprshot
  hyprlock
  hypridle
  yazi
  swww
  python3
  python3Packages.requests
  python3Packages.beautifulsoup4
];
