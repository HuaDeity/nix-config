_:

let
  shared-packages = (import ../shared/packages.nix) { };
in
shared-packages
++ [
  "dockutil"
  "hugo"
  "laishulu/homebrew/macism"
  "mas"
  "pinentry-mac"
  "uutils-coreutils"
]
