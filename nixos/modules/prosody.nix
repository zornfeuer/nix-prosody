let
  domain = "test.boltanka.tech";
in
{
  services.prosody = {
    enable = true;
    admins = [ "admin@${domain}" ];
    ssl.cert = "/var/lib/acme/${domain}/fullchain.pem";
    ssl.key = "/var/lib/acme/${domain}/key.pem";
    allowRegistration = true;

    virtualHosts = {
      boltanka = {
        enabled = true;
        inherit domain;
        ssl.cert = "/var/lib/acme/${domain}/fullchain.pem";
        ssl.key = "/var/lib/acme/${domain}/key.pem";
      };
    };
    muc = [
      {
        name = "ChatRooms on ${domain}";
        domain = "conference.${domain}";
      }
    ];
    uploadHttp.domain = "uploads.${domain}";
  };
}
