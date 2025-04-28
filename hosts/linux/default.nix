{ ... }:

{
  imports = [
    ../../modules/linux/home-manager.nix
    ../../modules/shared
  ];
  programs.home-manager.enable = true;
}
