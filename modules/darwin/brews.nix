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
  "pinentry-mac"
  "uutils-coreutils"
]
