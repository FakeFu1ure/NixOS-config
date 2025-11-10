{ config, pkgs, ... }:

{
  home = {
    username = "fake";
    homeDirectory = "/home/fake";
    stateVersion = "25.05";
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch";
      delete  = "sudo nix-collect-garbage -d";
      n       = "sudo nvim";
      nixos-git = "bash -c 'sudo nixos-rebuild switch && sudo cp -r /etc/nixos/* ~/nixos-repo/nixos/ && cp -r ~/.config/home-manager/* ~/nixos-repo/home/ && cd ~/nixos-repo && git add . && git commit -m \"Update configs: $(date +\"%Y-%m-%d %H:%M:%S\")\" || true && git push origin main'";
    };
    
    shellInit = ''
      fastfetch
      set fish_greeting
    '';
  };
  
}
