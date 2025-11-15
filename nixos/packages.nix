{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
    		neovim
    		wget
    		git
    		telegram-desktop
    		pavucontrol
    		unzip
    		home-manager
    		btop
		
  ];
	programs.niri.enable = true;
}
