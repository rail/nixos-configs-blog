{ ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    hostName = "merail";
    nameservers = [
      "67.207.67.3"
      "67.207.67.2"
    ];
    defaultGateway = "159.89.176.1";
    defaultGateway6 = "";
    interfaces = {
      eth0 = {
        ip4 = [
          { address="159.89.176.112"; prefixLength=20; }
{ address="10.17.0.6"; prefixLength=16; }
        ];
        ip6 = [
          { address="2604:a880:800:a1::ae7:f001"; prefixLength=64; }
{ address="fe80::201c:1bff:fe75:243d"; prefixLength=64; }
        ];
      };
      
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="22:1c:1b:75:24:3d", NAME="eth0"
    
  '';

  services.openssh.enable = true;
  services.openssh.listenAddresses = [
    { addr = "0.0.0.0"; port = 2222; }
  ];

  networking.firewall = {
    enable = true;
    allowPing = true;
    allowedTCPPorts = [ 2222 80 443 ];
  };
}
