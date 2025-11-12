# NixOS Hyprland Configuration

<img width="282" height="126" alt="Nix_Logo" src="https://github.com/user-attachments/assets/1c55e9b2-f8db-4e48-a619-a22e35e2f4ac" />


<img width="1920" height="1080" alt="1" src="https://github.com/user-attachments/assets/aae62ed5-fa7f-40af-870f-a3897b8c6d74" />


A minimalistic, visually-oriented Hyprland configuration for NixOS, featuring dynamic theming and wallpaper managem ent.

<img width="1920" height="1080" alt="2" src="https://github.com/user-attachments/assets/ed907b10-f232-4725-ab56-4d9dcecd3f3b" />

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

![3](https://github.com/user-attachments/assets/8c910743-68a5-4b54-b969-29c9bc7f948a)


- Dynamic color scheme based on current wallpaper
- Minimalistic and clean aesthetic
- Automatic palette generation via `matugen`
- Seamless integration between all components

## 🔧 Installation & Usage

> **Note**: This configuration is provided as a **reference**. Feel free to copy and adapt parts for your own NixOS configuration.

### Standard NixOS Structure

This configuration uses the standard NixOS structure (non-flake). You can import specific modules or copy relevant sections into your own `configuration.nix`.

### Key Configuration Files

- `~/.config/hypr/` - Hyprland configuration and related scripts
- `~/.config/waybar/` - Waybar configuration
- `~/.config/kitty/` - Kitty terminal configuration
- `~/.config/fish/` - Fish shell configuration

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
