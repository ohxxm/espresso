{
  description = "flake power";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";
    home-manager.url = "github:nix-community/home-manager";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-gaming.url = "github:fufexan/nix-gaming";
    patched-fonts = {
      url = "github:40huo/Patched-Fonts";
      flake = false;
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, nixpkgs-f2k, lanzaboote, hyprland, nix-gaming, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      config.allowUnfree = true;
    in
    {
      nixosConfigurations = {
        io = inputs.nixpkgs.lib.nixosSystem {

          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/io/configuration.nix
            ./hosts/shared
            ./hosts/shared/gaming
	          ./hosts/shared/blocker
            ./home/shared

            #	lanzaboote.nixosModules.lanzaboote


            #	({ pkgs, lib, ... }: {
            #	    boot.bootspec.enable = true;
            # 
            #	    environment.systemPackages = [
            #		pkgs.sbctl
            #	    ];
            #
            #	    boot.loader.systemd-boot.enable = lib.mkForce false;
            #
            #	    boot.lanzaboote = {
            #		enable = true;
            #		pkiBundle = "/etc/secureboot";
            #	    };
            #	})

            {
              nixpkgs.overlays = [
                nixpkgs-f2k.overlays.compositors
                nixpkgs-f2k.overlays.window-managers
                nixpkgs-f2k.overlays.stdenvs

                (final: _:
                  let
                    inherit (final) system;
                  in
                  {
                    patched-fonts = pkgs.callPackage ./derivations/patched-fonts.nix {
                      src = inputs.patched-fonts;
                    };
                  })
              ];
            }

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                extraSpecialArgs = { inherit inputs; };
                users.ohm = ./home/io/ohm/home.nix;
              };
            }
          ];
        };
        overlord = inputs.nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/overlord/configuration.nix
            ./hosts/shared
            ./hosts/shared/gaming
            ./home/shared

            {
              nixpkgs.overlays = [
                (final: _:
                  let
                    inherit (final) system;
                  in
                  {
                    patched-fonts = pkgs.callPackage ./derivations/patched-fonts.nix {
                      src = inputs.patched-fonts;
                    };
                  })
              ];
            }
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = true;
                extraSpecialArgs = { inherit inputs; };
                users.ohm = ./home/overlord/ohm/home.nix;
              };
            }
          ];
        };
      };
    };
}
