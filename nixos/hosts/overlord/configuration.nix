# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ../hardware-configuration.nix
    ../shared
  ];

  networking.hostName = "overlord"; # Define your hostname.

  services.greetd = {
    enable = true;
    settings = {
      default_session =
        let
          hyprland = pkgs.writeShellScript "hyprland" ''
            	    Hyprland
          '';
        in
        {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd ${hyprland}";
          user = "greeter";
        };
    };
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

