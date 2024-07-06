# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment = {
    sessionVariables = rec {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      XDG_CURRENT_DESKTOP = "hyprland";
      XDG_SESSION_DESKTOP = "hyprland";

      # Not officially in the specification
      XDG_BIN_HOME = "$HOME/.local/bin";
      PATH = [
        "${XDG_BIN_HOME}"
      ];
      QT_QPA_PLATFORMTHEME = "qt5ct";
      MOZ_ENABLE_WAYLAND = "1";
      QT_IM_MODULES = "wayland;ibus";
      XDG_SESSION_TYPE = "wayland";
      GTK_IM_MODULE = "wayland";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "ibus";
      ANKI_WAYLAND = "1";
      DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = "1";
    };

    systemPackages = with pkgs; [
      # Libs
      fuse
      icu
      elmPackages.elm

      # Media
      mpv
      vlc
      steam

      # Archiving
      atool
      gnome.file-roller
      rar
      curl
      wget
      rar # includes unrar
      zip # not includes unzip
      unzip
      p7zip
      gzip
      lzip

      # File Management
      findutils
      xdg-desktop-portal-gtk
      qbittorrent
      fd

      # System Utilities
      alejandra
      coreutils-full
      calc
      wget
      w3m
      killall
      ripgrep
      glibcLocales
      wl-clipboard-rs
      xdg-utils
      zsh
      bash
      qt6ct
      qt5ct
      adwaita-qt
      qadwaitadecorations
      qadwaitadecorations-qt6
      polkit-kde-agent

      #Desktop
      obs-studio
      vesktop
      slurp
      grim
      gammastep
      telegram-desktop
      libreoffice
      font-manager
      pavucontrol
      swaynotificationcenter
      osu-lazer-bin
      obsidian

      # Development and Scripting
      aegisub
      xwaylandvideobridge
      fastfetch
      ffmpeg
      appimage-run
      fcitx5
      opentabletdriver
      wineWowPackages.waylandFull
      wineWowPackages.stable
      winetricks
      aseprite
      rustup
      gcc
      llvm
    ];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    times-newer-roman
    font-awesome
    nerdfonts
  ];

  # Bootloader.

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.initrd.kernelModules = ["amdgpu"];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };
  i18n.inputMethod.fcitx5.waylandFrontend = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];

  #services.xserver.xkb.variant = "";
  #services.xserver.xkb.layout = "";

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = false;
  services.xserver.desktopManager.xfce.enable = false;
  services.locate.enable = true;
  # Configure keymap in X11
  # services.xserver = {
  #
  #layout = "us";
  # xkbVariant = "";
  #};

  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
    driversi686Linux.amdvlk
    rocmPackages.clr.icd
  ];
  hardware.opengl.driSupport = true; # This is already enabled by default
  hardware.opengl.driSupport32Bit = true; # For 32 bit applications

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  security = {
    rtkit.enable = true;
    pam.services.greetd.enableGnomeKeyring = true; #exist for login
  };
  services = {
    flatpak.enable = true;
    gpm.enable = true;
  };

  programs = {
    firefox.enable = true;
    thunar.enable = true;
    xwayland.enable = true;
    hyprland.portalPackage = pkgs.xdg-desktop-portal-hyprland;
    zsh.enable = true;
    appimage.enable = true;
  };
  nixpkgs.config.allowUnfree = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  users.users.pan_svichka = {
    shell = pkgs.zsh;
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
