{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    ./users.nix
    ./soft.nix
    ./web.nix
  ];
}
