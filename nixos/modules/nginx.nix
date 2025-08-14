let
  domain = "test.boltanka.tech";
in
{
  services.nginx = {
    enable = true;
    virtualHosts."${domain}" = {
      useACMEHost = true;
    };
  };

  users.users.nginx.extraGroups = [ "acme" ];
}
