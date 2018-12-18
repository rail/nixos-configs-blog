{ pkgs, ... }:
let
  pubkeys = import ./pubkeys.nix;
in
{
  users.users.root.openssh.authorizedKeys.keys = [ pubkeys.rail ];

  users.extraUsers.rail = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [ pubkeys.rail ];
    shell = pkgs.zsh;
  };
  users.extraUsers.borg = {
    isNormalUser = true;
    uid = 1001;
    openssh.authorizedKeys.keys = [ pubkeys.borg ];
  };
}
