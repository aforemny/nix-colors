{ lib, pkgs, config, ... }:

with lib;

let
  cfg = config.colorscheme;
in {
  options.nix-colors.colorscheme = mkOption { default = null; };
  options.colorscheme = {
    slug = mkOption {
      type = types.str;
      default = "";
      description = ''
        Color scheme slug (sanitized name)
      '';
    };
    name = mkOption {
      type = types.str;
      default = "";
      description = ''
        Color scheme (pretty) name
      '';
    };
    author = mkOption {
      type = types.str;
      default = "";
      description = ''
        Color scheme author
      '';
    };
    kind = mkOption {
      type = types.enum [ "dark" "light" ];
      default = if builtins.substring 0 1 cfg.colors.base00 > "5" then
        "light"
      else
        "dark";
      description = ''
        Whether the scheme is dark or light
      '';
    };

    colors = let
      mkColorOption = name: {
        inherit name;
        value = mkOption {
          type = types.strMatching "[a-fA-F0-9]{6}";
          description = "${name} color.";
        };
      };
    in listToAttrs (map mkColorOption [
      "base00"
      "base01"
      "base02"
      "base03"
      "base04"
      "base05"
      "base06"
      "base07"
      "base08"
      "base09"
      "base0A"
      "base0B"
      "base0C"
      "base0D"
      "base0E"
      "base0F"
    ]);

  };
  config = lib.mkIf (config.nix-colors.colorscheme != null) {
    assertions = [
      { assertion = false; message = "The 'nix-colors.colorscheme' option has been renamed to 'colorscheme'"; }
    ];
  };
}
