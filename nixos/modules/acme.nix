let
  domain = "test.boltanka.tech";
in
{
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "zornfeuer@i2pmail.org";
      webroot = "/var/lib/acme/acme-challenges";
    };
    certs.${domain} = {
      extraDomainNames = [
        "conference.${domain}"
        "upload.${domain}"
      ];
      group = "prosody"; # Даём Prosody доступ.
    };
  };

  # Создаём директорию для валидации.
  systemd.tmpfiles.rules = [
    "d /var/lib/acme/acme-challenges 0755 acme acme -"
  ];
}
