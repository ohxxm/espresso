{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "Iosevka NF SemiBold Italic";
      size = 15;
    };
    settings = {
      confirm_os_window_close = 0;
      window_margin_width = 30;
      cursor_shape = "beam";
    };

    extraConfig = builtins.readFile ./colors.nix;
  };
}
