let
  domain = "test.boltanka.tech";
  inherit domain;
  certDir = "/var/lib/acme/${domain}";
in
{
  services.prosody = {
    enable = true;
    admins = [ "admin@${domain}" ];
    ssl.cert = "${certDir}/fullchain.pem";
    ssl.key = "${certDir}/key.pem";
    ssl.legacySSLFiles = true;
    allowRegistration = true;

    virtualHosts.${domain} = {
      enabled = true;
      ssl = {
        cert = "${certDir}/full.pem";
        key = "${certDir}/key.pem";
      };
    };

    muc = [
      {
        name = "ChatRooms on ${domain}";
        domain = "conference.${domain}";
      }
    ];
    uploadHttp.domain = "upload.${domain}";
  };

  users.users.prosody.extraGroups = [ "acme" ];
}
