{ config, pkgs, ... }:

let

  nvim = pkgs.neovim.override { vimAlias = true; viAlias = true; };

in

{
  environment.systemPackages = with pkgs; [
    curl
    file
    fzf
    gitAndTools.gitFull
    htop
    lsof
    nvim
    rsync
    silver-searcher
    wget
  ];

  programs.bash.enableCompletion = true;
  # copy the system configuration into nix-store
  system.copySystemConfiguration = true;
  system.autoUpgrade.enable = true;
  nix.gc.automatic = true;
  security.sudo.wheelNeedsPassword = false;
  environment.variables = {
    EDITOR = "vim";
  };
  boot.cleanTmpDir = true;

  programs.tmux.enable = true;
  programs.tmux.shortcut = "a";
  programs.tmux.clock24 = true;
  programs.tmux.terminal = "screen-256color";
  programs.tmux.baseIndex = 1;
  programs.tmux.historyLimit = 10000;
  programs.tmux.extraTmuxConf = ''
    unbind %
    bind - split-window -v
    unbind '"'
    bind | split-window -h

    set -g status-interval 5
    set -g status-bg black
    set -g status-fg white
    set -g window-status-activity-bg default
    set -g window-status-activity-fg default
    set -g window-status-activity-attr underscore
    set -g status-left-length 30
    set -g status-right-length 60
    set -g status-left ' #[default]'
    set -g status-right '#[default]'
    setw -g window-status-format '#[fg=colour241]#I#F #[fg=white]#W#[default] '
    setw -g window-status-current-format '#[fg=colour241]#I#F #[bg=white,fg=black] #W #[bg=black,fg=white]'

    # ctrl+left/right cycles thru windows
    bind-key -n C-right next
    bind-key -n C-left prev

  '';

  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.ohMyZsh.enable = true;
  programs.zsh.ohMyZsh.plugins = [ "git" "systemd" "colorize" "colored-man-pages" "ssh-agent" ];
  programs.zsh.ohMyZsh.theme = "frisk";
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.shellAliases = {
    l = "ls -alh";
    ll = "ls -l";
    ls = "ls --color=tty";
  };
  programs.zsh.interactiveShellInit = ''
    setopt print_exit_value
    unsetopt share_history
    FIGNORE=".o:~"
    LISTMAX=0
    LOGCHECK=300
    MAILCHECK=0
    REPORTTIME=60

    zstyle :omz:plugins:ssh-agent agent-forwarding on
    setopt NOCLOBBER
    setopt no_nomatch # when pattern matching fails, simply use the command as is
  '';
}
