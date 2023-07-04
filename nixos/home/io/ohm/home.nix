{ config, pkgs, inputs, ... }:
let 
  nixpkgs-f2k = inputs.nixpkgs-f2k;
in
{
  home.username = "ohm";
  home.homeDirectory = "/home/ohm";

  imports = [
    ../../shared/home.nix
    ./rofi
    ./gtk
    ./kitty

    (import ./picom/default.nix { inherit config pkgs nixpkgs-f2k; })
  ];

  home.packages = with pkgs; [
    btop
    pfetch
    exa
    wezterm
    starship
    gh
    cinnamon.nemo
    flameshot
    xorg.xinput
    rofi-power-menu
    playerctl
  ];

  services.playerctld.enable = true;

  home.activation.installAwesomeWMConfig = ''
    	if [ ! -d "$HOME/.config/awesome" ]; then
    	  ln -s "/etc/nixos/home/io/ohm/awesome" "$HOME/.config/awesome"
    	  chmod -R +w "$HOME/.config/awesome"
        ln -s "/etc/nixos/home/shared/nvim/custom" "$HOME/.config/nvim/lua/custom"
    	  chmod -R +w "$HOME/.config/nvim/lua/custom"
    	fi
  '';

  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}
