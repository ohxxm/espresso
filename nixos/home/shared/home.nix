{ pkgs, ... }:
let
  nvchad = with pkgs; callPackage ../../derivations/nvchad.nix { };
in
{
  imports = [
    ./browser
    ./nvim
  ];

  home.packages = with pkgs; [
    discord
    youtube-music
    betterdiscordctl
    cider
    gcc
    nodejs
    python3
    python311Packages.pip
    cargo
    luarocks
    neovim-unwrapped
  ];

  xdg.desktopEntries = {
    discord = {
      name = "Discord";
      exec = "discord --enable-gpu-rasterization";
    };
  };
}
