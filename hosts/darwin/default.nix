{
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/darwin/home-manager.nix
    ../../modules/shared
  ];

  environment.systemPackages = import ../../modules/shared/system-packages.nix { inherit pkgs; };

  nix = {
    gc = {
      interval = {
        Weekday = 0;
        Hour = 2;
        Minute = 0;
      };
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "@admin"
      ];
    };
  };

  security = {
    pam = {
      services = {
        sudo_local = {
          enable = true;
          reattach = true;
          touchIdAuth = true;
        };
      };
    };
  };

  system = {
    checks = {
      verifyNixPath = false;
    };

    defaults = {
      dock = {
        autohide = true;
        show-recents = true;
        launchanim = true;
        orientation = "bottom";
        tilesize = 64;
      };

      finder = {
        _FXShowPosixPathInTitle = false;
      };

      NSGlobalDomain = {
        AppleShowAllExtensions = false;
        ApplePressAndHoldEnabled = false;

        KeyRepeat = 6; # Values: 120, 90, 60, 30, 12, 6, 2
        InitialKeyRepeat = 35; # Values: 120, 94, 68, 35, 25, 15

        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.sound.beep.volume" = 1.0;
      };

      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };
    };

    stateVersion = 6;
  };
}
