{
  system,
  ...
}:

{
  imports = [
    ./home-packages.nix
  ];
  home = {
    username = "prosody-op";
    homeDirectory = "/home/prosody-op";
    stateVersion = "25.05";
  };
}
