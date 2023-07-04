{ config
, pkgs
, ...
}:
let
  nordvpn = with pkgs; callPackage ../../derivations/nordvpn.nix { };
in
{
  boot = {
    loader = {
      grub = {
        enable = true;
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        theme = pkgs.fetchFromGitHub
          {
            owner = "semimqmo";
            repo = "sekiro_grub_theme";
            rev = "1affe05f7257b72b69404cfc0a60e88aa19f54a6";
            sha256 = "02gdihkd2w33qy86vs8g0pfljp919ah9c13cj4bh9fvvzm5zjfn1";
          }
        + "/Sekiro";
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
    supportedFilesystems = [ "ntfs" ];
  };

  environment.systemPackages = with pkgs; [
    dconf
    git
    wget
    unzip
    pavucontrol
    neovim-unwrapped
  ];

  users = {
    users.ohm = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "adbusers" ];
    };
    defaultUserShell = pkgs.fish;
  };

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];

  sound.enable = false; # <- Causes issues during pipewire usage
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking = {
    networkmanager.enable = true;
  };

  time.timeZone = "America/New_York";

  programs.adb.enable = true;

  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.printing.enable = true;
  services.xserver.libinput.enable = true;
  programs.dconf.enable = true;

  system.autoUpgrade.enable = true;
}
