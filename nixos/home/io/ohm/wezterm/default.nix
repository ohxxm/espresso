{ config, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      		local wezterm = require("wezterm")
      		local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]

      		custom.background = "#11111b"
      		
      		return {
      		    font = wezterm.font("Iosevka Nerd Font", {weight="DemiBold", stretch="Normal", style="Italic"}),
      		    font_size = 14.0,
      		    enable_tab_bar = false,
      		    default_cursor_style = 'SteadyBar',
      		    audible_bell = "Disabled",
      		    color_schemes = {
      			["Customppuccin"] = custom,
      		    };
      		    color_scheme = "Customppuccin",
      		}
      		'';
  };
}
