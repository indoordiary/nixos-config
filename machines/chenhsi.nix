{ pkgs, ... }:
{
  imports = [ ./common ];

  profile = {
    terminal = "foot";
    font = "JetBrains Mono";
    darkMode = false;
    browser = "firefox";
    wallpaper = "${pkgs.wallpaper}/7qlsln.jpg";
  };

  optional = {
    cosmic = false;
    wm = true;
    hypr = {
      enable = true;
    };
    niri = false;

    podman = false;

    terminal = {
      foot = true;
      kitty = false;
      wezterm = false;
    };

    dev = {
      helix = false;
      zed = true;
      vscode = true;

      rust = false;
      go = false;
      node = true;
      zig = false;
    };
  };

}
