{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      ohm = {
        settings = {
          "browser.startup.homepage" = "https://spaxly.github.io/latte/startpage/index.html";
        }; 
      };
    };
  };
}
