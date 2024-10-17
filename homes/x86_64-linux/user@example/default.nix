{
  lib,
  pkgs,
  config,
  ...
}: {
  lonewanderer.profiles = {
    desktop.enable = true;
    developer.enable = true;
    gaming.enable = true;
  };

  lonewanderer.system.user = {
    name = "";
    email = "";
    github = "";
    signingKey = ""; # ID of your GPG Signing key for automatic commit signing
  };

  #
  # Run `pamu2fcfg -n -o pam://yubikey` for each key
  #
  lonewanderer.system.security.u2f.keys = ''
    <key per line>
    <key per line>
  '';

  lonewanderer.hardware.display.monitors = {
    "DP-1" = {
      alias = 1;
      position = "0x0";
      scaling = 1;
      # extraParams = "bitdepth,10,vrr,2";
    };
  };

  home.stateVersion = "24.05";
}
