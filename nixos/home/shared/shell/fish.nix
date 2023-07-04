{ config, pkgs, lib, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "exa -l --icons";
    };
    interactiveShellInit = ''
      	    set fish_greeting
      	    pfetch
      	'';
  };

  programs.starship = {
    enable = true;
    settings = {
      format = "$directory$character";
      character = {
        success_symbol = "[ ](bold blue)";
        error_symbol = "[ ](bold red)";
      };
    };
  };
}
