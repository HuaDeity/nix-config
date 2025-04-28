default:
  @just --list

GITHUB_USERNAME := "HuaDeity"
PASSWORD_MANAGER := "doppler"

export NIX_CONFIG := "
  accept-flake-config = true
  extra-experimental-features = flakes nix-command
"

dot_init:
  chezmoi init --apply ${GITHUB_USERNAME}

pass_login:
  ${PASSWORD_MANAGER} login

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

init *args:
  just switch {{args}}
  just pass_login
  just dot_init

