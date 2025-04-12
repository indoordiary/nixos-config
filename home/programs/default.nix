{ pkgs, ... }:
let
  wechat = pkgs.makeDesktopItem {
    name = "wehcat";
    desktopName = "wechat";
    exec = "QT_SCALE_FACTOR=2 wechat-uos %U";
    terminal = false;
    icon = "wechat";
    comment = "WeChat for Linux";
  };
in
{
  imports = [
    ./fcitx5
    ./browser

    ./media.nix
    ./zathura.nix
    ./mimelist.nix
  ];

  catppuccin.obs.enable = true;
  programs = {
    obs-studio = {
      enable = true;

      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        input-overlay
        obs-pipewire-audio-capture
      ];
    };
  };

  home.packages = with pkgs; [
    xdg-utils
    mako
    waybar

    # Social Apps
    telegram-desktop
    qq
    wechat-uos
    (wechat)

    bilibili
    qqmusic
    typora

    nautilus
    sushi
    loupe

    libsForQt5.kdenlive

    mihomo-party

    inputs.zen-browser.packages."${system}".beta
  ];
}
