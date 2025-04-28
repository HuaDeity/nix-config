{
  pkgs,
  ...
}:

let
  user = "wangyizun";
in
{
  home = {
    enableNixpkgsReleaseCheck = true;
    username = "${user}";
    homeDirectory = "/nas/${user}";
    packages = pkgs.callPackage ./packages.nix { };
    stateVersion = "24.11";
  };
}
