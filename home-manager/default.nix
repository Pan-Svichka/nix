{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    # ./hyprland
    ./programs
    # ./shell
  ];

  # setup fonts for other distros, run "fc-cache -f" to refresh fonts
  fonts.fontconfig.enable = true;

  home = {
    username = "$USER";
    homeDirectory = "/home/$USER";
    # do not change this value
    stateVersion = "23.05";

    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
    };

    packages = with pkgs; [
    ];
  };

  i18n = {
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-mozc
          fcitx5-anthy
          fcitx5-gtk
        ];
      };
    };
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # stop bothering me
  xdg = {
    enable = true;
    userDirs.enable = true;
    mimeApps.enable = true;
    configFile = {
      "nix/nix.conf".text = "experimental-features = nix-command flakes";
      "nixpkgs/config.nix".text = ''{ allowUnfree = true; }'';
    };
  };
}
