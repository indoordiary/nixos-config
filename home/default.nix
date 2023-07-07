{ config, pkgs, ... }:
let
  user = config.machine.userName;
in
{
  imports = [
    ./command-line
    ./editor
    ./firefox
    ./language
    ./mpv
    ./obs-studio
    ./scripts
    ./shell
    ./terminal
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      libsForQt5.kdenlive
    ];

    sessionVariables = {
      EDITOR = "hx";
      BROWSER = "firefox";
      TERMINAL = "kitty";
      GTK_IM_MODULE = "fcitx5";
      QT_IM_MODULE = "fcitx5";
      XMODIFIERS = "@im=fcitx5";
      XDG_CONFIG_HOME = "\${HOME}/.config";
      XDG_CACHE_HOME = "\${HOME}/.cache";
      XDG_BIN_HOME = "\${HOME}/.local/bin";
      XDG_DATA_HOME = "\${HOME}/.local/share";
    };
    sessionPath = [
      "$HOME/go/bin"
    ];
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.05";
}
