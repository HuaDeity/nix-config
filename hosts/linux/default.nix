{ ... }:

{
  imports = [
    ../../modules/linux/home-manager.nix
    ../../modules/shared
  ];
  promgrams.home-manager.enable = true;
}
