{ config, pkgs, inputs, ... }:

{
  home.username = "ohm";
  home.homeDirectory = "/home/ohm";

  imports = [
    inputs.hyprland.homeManagerModules.default
    ../../shared/home.nix

    ./hyprland
    ./eww
    ./wezterm
    ./rofi
  ];

  home.packages = with pkgs; [
    btop
    pfetch
    exa
    wezterm
    starship
    gh
    eww-wayland
  ];

  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}
