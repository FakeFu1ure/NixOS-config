{config, pkgs, ...}:

{
  services.zapret.enable = true;
  services.zapret.whitelist = [
    "youtube.com"
    "googlevideo.com"
    "ytimg.com"
    "youtu.be"
    "discord.com"
    "discord-attachmets-uploads-prd.storage.googleapis.com"
    "googleapis.com"
    "yande.re"
    "hypr.land"
  ];
  services.zapret.params = [
    "--dpi-desync=fake,disorder2"
    "--dpi-desync-ttl=1"
    "--dpi-desync-autottl=2"
  ];



}
