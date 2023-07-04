{ lib, stdenv, pkgs, src }:

let
  custom = ../home/shared/nvim/custom;
in
stdenv.mkDerivation {
  pname = "nvchad";
  version = "1.0.0";

  src = pkgs.fetchFromGitHub {
    owner = "NvChad";
    repo = "NvChad";
    rev = "refs/heads/v2.0";
    sha256 = "sha256-1gSXfZvu0MR8QwLBzzNDoZGWSpCrD3wWxGFBG7hOU5E=";
  };

  installPhase = ''
    mkdir $out
    cp -r $src "$out/"
    mkdir -p "$out/lua/custom"
    cp -r ${custom}/* "$out/lua/custom/"
  '';

  meta = with lib; {
    description = "NvChad";
    homepage = "https://github.com/NvChad/NvChad";
    platforms = platforms.all;
    license = licenses.gpl3;
  };
}
