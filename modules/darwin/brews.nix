_:

let
  shared-packages = (import ../shared/packages.nix) { };
in
shared-packages
++ [
  "antidote"
  "dockutil"
  "fisher"
  "hugo"
  "macism"
  "mas"
  "nvm"
  "pinentry-mac"
  "uutils-coreutils"
]
