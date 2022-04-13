{ pkgs }:

{
  # Takes a scheme, resulting wallpaper height and width, plus logo scale, and ouputs the generated wallpaper path
  # Example:
  # wallpaper = nixWallpaperFromScheme {
  #   scheme = config.colorscheme;
  #   width = 2560;
  #   height = 1080;
  #   logoScale = 5.0;
  # };
  nixWallpaperFromScheme = import ./nix-wallpaper.nix { inherit pkgs; };

  # Takes a picture path and a scheme kind ("dark" or "light"), and outputs a colorscheme based on it
  # Please note the path must be accessible by your flake on pure mode
  # Example:
  # colorscheme = colorschemFromPicture {
  #   path = ./my/cool/wallpaper.png;
  #   kind = "dark";
  # };
  colorschemeFromPicture = import ./from-picture.nix { inherit pkgs; };

  # Takes a scheme, ouputs a generated materia GTK theme
  # Example:
  # gtk.theme.package = gtkThemeFromScheme {
  #   scheme = config.colorscheme;
  # };
  gtkThemeFromScheme = import ./gtk-theme.nix { inherit pkgs; };

  # Takes a scheme, ouputs a vim theme package.
  #
  # The output theme name will be "nix-" followed by the coloscheme's slug, and
  # should be set, for example, by adding to your vim config:
  # "colorscheme nix-${config.colorscheme.slug}"
  #
  # Example:
  # programs.vim.plugins = [
  #   {
  #     plugin = vimThemeFromScheme { scheme = config.colorscheme; };
  #     config = "colorscheme nix-${config.colorscheme.slug}";
  #   }
  # ];
  vimThemeFromScheme = import ./vim-theme.nix { inherit pkgs; };

  # Takes a scheme, ouputs a xresources theme.
  #
  # Example:
  # xresources.extraConfig = builtins.readFile (xresourcesThemeFromScheme {
  #   scheme = config.colorscheme;
  # });
  xresourcesThemeFromScheme = import ./xresources-theme.nix { inherit pkgs; };

  # Takes a scheme, ouputs a xresources 256 theme.
  #
  # Example:
  # xresources.extraConfig = builtins.readFile (xresources256ThemeFromScheme {
  #   scheme = config.colorscheme;
  # });
  xresources256ThemeFromScheme = import ./xresources-256-theme.nix { inherit pkgs; };
}
