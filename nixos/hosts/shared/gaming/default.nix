{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    vulkan-tools
    lutris
    bottles
    gamemode
    yuzu-mainline
  ];

  programs.steam = {
    enable = true;
  };

  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.enable = true;
}
