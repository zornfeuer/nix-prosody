{
  pkgs,
  ...
}:
let
  domain = "boltanka.tech";
  certDir = "/var/lib/acme/${domain}";
in
{
  services.prosody = {
    enable = true;
    package = pkgs.prosody.override {
      withCommunityModules = [ "http_file_share" ];
    };
    admins = [ "admin@${domain}" ];
    ssl.cert = "${certDir}/fullchain.pem";
    ssl.key = "${certDir}/key.pem";
    allowRegistration = true;

    virtualHosts.${domain} = {
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

    httpFileShare = {
      domain = "uploads.${domain}"
    };
  };

  users.users.prosody.extraGroups = [ "acme" ];
}
