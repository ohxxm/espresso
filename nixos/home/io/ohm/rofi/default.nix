{ pkgs, config, builtins, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override {
      plugins = with pkgs; [
        rofi-power-menu
      ];
    };
  };
}
