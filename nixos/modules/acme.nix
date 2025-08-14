let
  domain = "test.boltanka.tech";
in
{
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "zornfeuer@i2pmail.org";
    };
    certs = {
      "boltanka.tech" = {
        inherit domain;
        webroot = "/var/www/${domain}";
        extraDomainNames = [
          "conference.${domain}"
          "upload.${domain}"
        ];
      };
    };
  };
}
