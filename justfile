default:
  @just --list

# wrapper around {linux,darwin}-rebuild, always taking the flake
[macos]
rebuild *args:
  darwin-rebuild --flake .#{{arch()}}-darwin {{args}}

[linux]
rebuild *args:
  home-manager --flake .#{{arch()}}-linux {{args}}

build *args:
  just rebuild build {{args}}

[macos]
check *args:
  just rebuild check {{args}}

[macos]
update *args:
  nix flake update {{args}}

switch *args:
  just build {{args}}
  just confirm-switch {{args}}

[confirm]
confirm-switch *args:
  just rebuild switch {{args}}

