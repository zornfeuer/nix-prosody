let
  domain = "test.boltanka.tech";
  certDir = "/var/lib/acme/${domain}";
in
{
  services.prosody = {
    enable = true;
    admins = [ "admin@${domain}" ];
    ssl.cert = "${certDir}/full.pem";  # Опечатка? fullchain->full
    ssl.key = "${certDir}/key.pem";
    allowRegistration = true;

    virtualHosts.${domain} = {  # Опечатка? boltanka->test.boltanka
      enabled = true;
      domain = "${domain}";
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

  # Даём Prosody доступ.
  users.users.prosody.extraGroups = [ "acme" ];
}
