{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./modules/default.nix
  ];

  time.timeZone = "Europe/Moscow";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}
