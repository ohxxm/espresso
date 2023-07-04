{ config, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      		local wezterm = require("wezterm")
      		
      		return {
      		font = wezterm.font("CaskaydiaCove Nerd Font Mono", {weight="DemiBold", stretch="Normal", style="Italic"}),
      		font_size = 14.0,
      		enable_tab_bar = false,
      		default_cursor_style = 'SteadyBar',
      		audible_bell = "Disabled",
      		enable_wayland = true,

      		 colors = {
          indexed = {[16] = "#f1cf8a", [17] = "#dee1e6"},
      		
          scrollbar_thumb = "#384148",
          split = "#22262e",
      	
          tab_bar = {
            background = "#22262e",
              active_tab = {
                bg_color = "#70a5eb",
      	  fg_color = "#fafdff"
              },
              inactive_tab = {
      	  bg_color = "#22262e",
      	  fg_color = "#fafdff"
      	},
              inactive_tab_hover = {
      	  bg_color = "#384148",
      	  fg_color = "#fafdff"
      	},
      	new_tab = {
      	  bg_color = "#22262e",
      	  fg_color = "#fafdff"
      	},
      	new_tab_hover = {
      	  bg_color = "#384148",
      	  fg_color = "#fafdff",
      	  italic = true
      	},
            },

          visual_bell = "#384148",
      	
          -- nightbuild only
          compose_cursor = "#f1cf8a",
    
          -- Theme Colors (Decay)
          foreground = "#b6beca",
          background = "#171a1f",
          cursor_bg = "#dee1e6",
          cursor_border = "#fafdff",
          cursor_fg = "#22262e",
          selection_bg = "#575268",
          selection_fg = "#D9E0EE",

          ansi = {"#1c252c", "#e05f65", "#78dba9", "#f1cf8a", "#70a5eb", "#c68aee","#74bee9", "#dee1e6"},
          brights = {"#384148", "#fc7b81", "#94f7c5", "#ffeba6", "#8cc1ff", "#e2a6ff", "#90daff", "#fafdff"},
      }}
      	'';
  };
}
