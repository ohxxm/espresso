{ config, pkgs, ... }:

{
  home.activation.installEWWConfig = ''
        if [ ! -d "$HOME/.config/eww" ]; then
            ln -s "/etc/nixos/home/overlord/ohm/eww/config" "$HOME/.config/eww"
    	chmod -R +w "$HOME/.config/awesome"
        fi
  '';
}
