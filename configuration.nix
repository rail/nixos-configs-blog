{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    ./profiles/server.nix
  ];

  boot.cleanTmpDir = true;
  networking.hostName = "merail";
  services.openssh.enable = true;
}
