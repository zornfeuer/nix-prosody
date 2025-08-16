let
  domain = "boltanka.tech";
in
{
  services.nginx = {
    enable = true;
    virtualHosts."${domain}" = {
      enableACME = true;
    };
  };

  users.users.nginx.extraGroups = [ "prosody" "acme" ];
}
