{ pkgs }: { scheme }:
let
  c = scheme.colors;
in
pkgs.writeTextFile {
  name = "base16-${scheme.slug}.Xresources";
  text = ''
    ! Base16 ${scheme.name}
    ! Scheme: ${scheme.author}

    #define base00 #${c.base00}
    #define base01 #${c.base01}
    #define base02 #${c.base02}
    #define base03 #${c.base03}
    #define base04 #${c.base04}
    #define base05 #${c.base05}
    #define base06 #${c.base06}
    #define base07 #${c.base07}
    #define base08 #${c.base08}
    #define base09 #${c.base09}
    #define base0A #${c.base0A}
    #define base0B #${c.base0B}
    #define base0C #${c.base0C}
    #define base0D #${c.base0D}
    #define base0E #${c.base0E}
    #define base0F #${c.base0F}

    *foreground:   base05
    #ifdef background_opacity
    *background:   [background_opacity]base00
    #else
    *background:   base00
    #endif
    *cursorColor:  base05

    *color0:       base00
    *color1:       base08
    *color2:       base0B
    *color3:       base0A
    *color4:       base0D
    *color5:       base0E
    *color6:       base0C
    *color7:       base05

    *color8:       base03
    *color9:       base08
    *color10:      base0B
    *color11:      base0A
    *color12:      base0D
    *color13:      base0E
    *color14:      base0C
    *color15:      base07

    ! Note: colors beyond 15 might not be loaded (e.g., xterm, urxvt),
    ! use 'shell' template to set these if necessary
    *color16:      base09
    *color17:      base0F
    *color18:      base01
    *color19:      base02
    *color20:      base04
    *color21:      base06
  '';
}