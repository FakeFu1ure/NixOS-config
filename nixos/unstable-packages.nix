{ config, pkgs, ... }:

let
  unstable = import <unstable> {
    config = config.nixpkgs.config;
  };
in
{
  # Определяем пакеты из стабильной и нестабильной веток
  environment.systemPackages = with pkgs; [
    #unstable.vicinae
  ];
}
