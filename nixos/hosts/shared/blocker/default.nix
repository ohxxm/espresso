{
  config
, pkgs
, ...
}: {
  networking.extraHosts = 
    let
      hostsPath = https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts;
      hostsFile = builtins.fetchurl hostsPath;
    in 
      builtins.readFile "${hostsFile}";
}
