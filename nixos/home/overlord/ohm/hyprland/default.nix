{ pkgs, hyprland, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    swaybg
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    disableAutoreload = false;
    extraConfig = import ./config.nix { };
  };
  xdg.configFile."wallpaper.png".source = ./wallpaper.png;
}
