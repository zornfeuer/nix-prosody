{
  pkgs,
  ...
}:

{
  users.users.prosody-op = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
