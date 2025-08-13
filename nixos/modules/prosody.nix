let
  domain = "test.boltanka.tech";
in
{
  services.prosody = {
    enable = true;

    virtualHosts = {
      boltanka = {
        inherit domain;
        enabled = true;
      };
    };
    admins = [
      "admin@${domain}"
    ];
    allowRegistration = true;
    httpFileShare.domain = "uploads.${domain}";

    muc = [
      {
        name = "ChatRooms on ${domain}";
        domain = "conference.${domain}";
      }
    ];
  };
}
