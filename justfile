default:
  @just --list

GITHUB_USERNAME := "HuaDeity"
PASSWORD_MANAGER := "doppler"

export NIX_CONFIG := "
  accept-flake-config = true
  extra-experimental-features = flakes nix-command
"

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

dot_init:
  chezmoi init --apply ${GITHUB_USERNAME}

pass_login:
  ${PASSWORD_MANAGER} login

[macos]
nix_init *args:
  just switch {{args}}

[linux]
nix_init *args:
  nix run home-manager/master -- init --switch .#{{arch()}}-linux {{args}}

init *args:
  nix_init {{args}}
  just pass_login
  just dot_init
