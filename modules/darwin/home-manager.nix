{
  config,
  ...
}:

let
  user = config.system.primaryUser;
  brewPrefix = config.homebrew.brewPrefix;
in
{
  imports = [
    ./dock
  ];

  users.knownUsers = [ "${user}" ];

  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    uid = 501;
    shell = "${brewPrefix}/zsh";
  };

  homebrew = {
    enable = true;
    taps = (import ./taps.nix) { };
    brews = (import ./brews.nix) { };
    casks = (import ./casks.nix) { };
    masApps = (import ./masApps.nix) { };
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };

  # # Enable home-manager
  # home-manager = {
  #   useGlobalPkgs = true;
  #   users.${user} =
  #     { ... }:
  #     {
  #       home = {
  #         enableNixpkgsReleaseCheck = true;
  #         stateVersion = "24.11";
  #       };
  #     };
  # };

  # Fully declarative dock using the latest from Nix Store
  local.dock.enable = true;
  local.dock.entries = [
    { path = "/System/Applications/Facetime.app/"; }
    { path = "/System/Volumes/Preboot/Cryptexes/App/System/Applications/Safari.app/"; }
    { path = "/System/Applications/Messages.app/"; }
    { path = "/System/Applications/Music.app/"; }
    { path = "/System/Applications/Mail.app/"; }
    { path = "/System/Applications/Photo Booth.app/"; }
    { path = "/Applications/Reeder.app/"; }
    { path = "/Applications/Bookends.app/"; }
    { path = "/Applications/Tower.app/"; }
    { path = "/Applications/Ghostty.app/"; }
    { path = "/Applications/Zed Preview.app/"; }
    { path = "/System/Applications/iPhone Mirroring.app/"; }
    {
      path = "${config.users.users.${user}.home}/Downloads";
      section = "others";
      options = "--sort dateadded --view fan --display stack";
    }
  ];
  local.dock.username = "${user}";
}
