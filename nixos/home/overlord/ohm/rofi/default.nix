{ pkgs, config, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override {
      plugins = [
        # allows rofi to work in wayland along with xorg
        pkgs.rofi-wayland
      ];
    };


    extraConfig = {
      modi = "drun";
      terminal = "wezterm";
      show-icons = true;
      display-drun = " ";
      drun-display-format = "{name}";
    };

    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          font = "Operator Mono Medium Italic Nerd Font Complete";
        };

        "window" = {
          location = mkLiteral "center";
          width = mkLiteral "30%";
          height = mkLiteral "70%";

          enabled = true;
        };
      };
  };
}
