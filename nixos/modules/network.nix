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
        routes = [
          {
            address = "10.0.0.1";
            prefixLength = 32;
          }
          {
            address = "0.0.0.0";
            prefixLength = 0;
            via = "10.0.0.1";
          }
        ];
      };
    };

    nameservers = [
      "188.93.16.19"
      "77.88.8.8"
    ];

    networkmanager.enable = true;
    hostName = "tulip-utahlite13742";

    firewall = {
      allowedTCPPorts = [ 80 443 5222 ];
    };
  };
}
