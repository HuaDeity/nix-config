{
  pkgs,
  isGraphical ? false,
  ...
}:

with pkgs;
let
  shared-packages = map (
    pkgName:
    if pkgName == "git-flow" then
      pkgs.gitflow
    else if pkgName == "jupyterlab" then
      pkgs.jupyter
    else if pkgName == "node" then
      pkgs.nodejs_23
    else
      pkgs.${pkgName}
  ) ((import ../shared/packages.nix) { });

  system-packages = (import ../shared/system-packages.nix) { inherit pkgs; };

  guiPackages = [
    ghostty
    monaspace
  ];

  cliPackages = [
    clang
    home-manager
    llvmPackages.openmp
    mihomo
  ];

  addPackages = if isGraphical then guiPackages ++ cliPackages else cliPackages;

in
shared-packages ++ system-packages ++ addPackages
