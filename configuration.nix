{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    ./profiles/server.nix
  ];

  boot.cleanTmpDir = true;
  networking.hostName = "merail";
  # networking.firewall.allowPing = true;
  networking.firewall.enable = false;
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1GWq6pYsGJSzhjyLkkxrQwfuv5QSqGCubEMkhOoeV11dBtD8GiarjOq8xOkR3Er+dZWykjpzuld+pw1nRso6JEfhQ3JtzZXeM9PeHwFB2t7JH1mhl20jLz89umvXGc5uuiEZB0a9ZRaQwl/5zWvidU79ctHdTUwqDx2ylGP8hchpOJ446L+g9eFz1ejkT96tWUSOpv9r+WlytevfxsvTtre+/x9Sp7xmiNWMr/xyiSGDvr/F+R166td51Gm4PturELONzhaiV060iVbaxjTWbzt+XXj+7sGVes+Z6bp2z4M+I1eLrBZNwQHq0HPineK6/Blsc09P3HN5SlthYwx7Gn4V51r5hQjNH46ABI7u+FlMKPYQEBhwquINUWmlcn5sr+WJj0atQN/5iNjJMt3mGdzSJLfYLkNRgTWhJkg6j0RAmlDlbfikN+uzB2CzzdMNhZt6MAiAa3Jcm6AHWpGlTrc7rCmiS/EgyZrwyjIOwysApPyIZ8TkfPQd08PhFRyrB5lQnlcclsyeIrmHcRpkjKjPS1yI8fyZjIFJLBJtJ3d7BPETzUtdf4lIKTrLn/0w88pN0QNCbr+PmjN+M/D7RrLiEo73OpLKi0o2g97zmu1w+nG78UQ2uJSMALPbYCP8KswgQgRL5L2RcbcLv1+wTMksGcr6jb63JsfbQMv9rTw== Rail Aliiev <rail@mozilla.com>"
  ];
}
