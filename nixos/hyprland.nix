{ pkgs, lib, config, ... }:

{
  programs.hyprland.enable = true;
  services = {
    xserver.enable = true;
  };

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  
  services.displayManager.autoLogin = {
    enable = true;
    user = "fake";
  };
  
  programs.hyprland.xwayland.enable = true;
  xdg.portal = {

    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  };
  programs.thunar.enable = true;
  programs.fish.enable = true;
  users.users.fake.shell = pkgs.fish; 
  
  fonts.packages = with pkgs; 
  
  [
  nerd-fonts.jetbrains-mono
  nerd-fonts.symbols-only
  ];
  
  boot = {

    plymouth = {
      enable = true;
    };
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    };

  environment.systemPackages = with pkgs; [
    kitty
    swww
    waybar
    xdg-desktop-portal-hyprland
    vanilla-dmz
    fastfetch
    fuzzel
    wlogout
    matugen
    yazi
    pywalfox-native
    pywal
    mako
    obs-studio
    cava
    playerctl
    jq
    hyprshot
    krita
    (python3.withPackages (ps: with ps; [
      beautifulsoup4
      lxml
      requests
    ]))
  ];

  
}


