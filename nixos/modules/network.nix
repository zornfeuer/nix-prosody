{
  networking = {
    interfaces.ens3 = {
      ipv4 = {
        addresses = [ 
          {
            address = "81.30.105.116";
            prefixLength = 32;
          }
        ];
      };
    };

    defaultGateway = "10.0.0.1";

    nameservers = [
      "188.93.16.19"
      "77.88.8.8"
    ];

    networkmanager.enable = true;
    hostName = "tulip-utahlite13742";
  };
}
