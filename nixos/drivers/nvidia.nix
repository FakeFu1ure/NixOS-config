{ host, ... }:
let
  inherit (import ./ID.nix) intelID nvidiaID;
in
{
  imports = [
    ./nvidia-prime-drivers.nix
  ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
  
    open = true;
    
    modesetting.enable = true;
    powerManagement.enable = true;
    

    nvidiaSettings = true;
    powerManagement.finegrained = true;
  };

  drivers.nvidia-prime = {
    enable = true;
    intelBusID = "${intelID}";
    nvidiaBusID = "${nvidiaID}";
  };
}
