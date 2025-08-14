let
  domain = "test.boltanka.tech";
in
{
  security.acme = {
    acceptTerms = true;
    useRoot = true;
    defaults = {
      email = "zornfeuer@i2pmail.org";
    };
    certs = {
      "boltanka.tech" = {
        inherit domain;
        webroot = "/var/www/${domain}";
        email = "zornfeuer@i2pmail.org";
        extraDomainNames = [
          "conference.${domain}"
          "upload.${domain}"
        ];
      };
    };
  };
}
