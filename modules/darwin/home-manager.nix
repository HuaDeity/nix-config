{
  config,
  ...
}:

let
  user = "huadeity";
in
{
  imports = [
    ./dock
  ];

  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
  };

  homebrew = {
    enable = true;
    taps = builtins.attrNames config.nix-homebrew.taps;
    brews = (import ./brews.nix) { };
    casks = (import ./casks.nix) { };
    masApps = (import ./masApps.nix) { };
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} =
      { ... }:
      {
        home = {
          enableNixpkgsReleaseCheck = true;
          stateVersion = "24.11";
        };
      };
  };

  # Fully declarative dock using the latest from Nix Store
  local.dock.enable = true;
  local.dock.entries = [
    { path = "/System/Applications/Facetime.app/"; }
    { path = "/Applications/Safari.app/"; }
    { path = "/System/Applications/Messages.app/"; }
    { path = "/System/Applications/Music.app/"; }
    { path = "/System/Applications/Mail.app/"; }
    { path = "/System/Applications/Photo Booth.app/"; }
    { path = "/Applications/Reeder.app/"; }
    { path = "/Applications/Bookends.app/"; }
    { path = "/Applications/Ghostty.app/"; }
    { path = "/Applications/Zed Preview.app/"; }
    { path = "/System/Applications/iPhone Mirroring.app/"; }
    {
      path = "${config.users.users.${user}.home}/Downloads";
      section = "others";
      options = "--sort dateadded --view fan --display stack";
    }
  ];

}
