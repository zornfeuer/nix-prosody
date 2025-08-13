{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    htop
    fastfetch
    neovim
  ];
}
