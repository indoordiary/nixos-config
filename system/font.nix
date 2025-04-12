{ pkgs, inputs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    packages = with pkgs; [
      # icon fonts
      material-symbols

      # Sans(Serif) fonts
      libertinus
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      roboto
      (google-fonts.override { fonts = [ "Inter" ]; })

      # monospace fonts
      jetbrains-mono

      # nerdfonts
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only

      #custom
      inconsolata
      fira-code
    ];

    fontconfig.defaultFonts =
      let
        addAll = builtins.mapAttrs (_: v: v ++ [ "Noto Color Emoji" ]);
      in
      addAll {
        serif = [
          "Libertinus Serif"
        ];
        sansSerif = [
          "Inter"
        ];
        monospace = [
          "JetBrains Mono"
        ];
        emoji = [ ];
      };
  };
}
