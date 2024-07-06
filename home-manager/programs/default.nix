{pkgs, ...}: {
  imports = [
  ];
  home.packages = with pkgs; [
  ];

  wayland.windowManager.sway = {
    enable = false;
    extraConfig = "";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    systemd = {
      enable = true;
    };
    settings = {
      exec-once = [
        "/home/pan_svichka/stuff/scripts/app-start.sh"
      ];
      input = {
        #             kb_layout = ;
        follow_mouse = 1;
        accel_profile = "flat";
        left_handed = "true";
      };

      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 3;
        "col.active_border" = "rgb(6f507e)";
        "col.inactive_border" = "rgb(000B0F)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true;
        allow_tearing = true;
        layout = "dwindle";
      };

      decoration = {
        rounding = 0;
        drop_shadow = false;
        shadow_range = 0;
        shadow_render_power = 0;
        "col.shadow" = "rgba(1a1a1aee)";

        # dim_inactive = true
        # dim_strength = 0.05

        blur = {
          enabled = false;
          size = 2;
          passes = 3;
          new_optimizations = true;
        };
      };

      animations = {
        enabled = false;
      };

      dwindle = {
        pseudotile = false;
        preserve_split = true;
        # force_split = 2;
      };

      master = {
        # mfact = "0.5";
        orientation = "left";
        smart_resizing = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
        disable_splash_rendering = false;
        mouse_move_enables_dpms = false;
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;
        key_press_enables_dpms = false;
        enable_swallow = false;
        #  focus_on_activate = false;
      };

      #Constants
      "$mod" = "Alt_L";
      "monitor" = ",preferred,auto,auto";
      "$terminal" = "alacritty";
      "$fileManager" = "thunar";
      "$menu" = "rofi -show drun";

      bind = [
        # Start some sick programs
        "$mod, D, 	 exec, $menu"
        "$mod, Return, exec, $terminal"
        #"$mod, ,      exec, $fileManager"
        "$mod, p,      exec, aegisub"
        "SUPER, Q,     exec, aseprite"
        "SUPER, a,     exec, ~/prg/appimg/osu.AppImage"
        "SUPER, w,     exec, telegram-dmsktop"
        "SUPER, b,     exec, alacritty msg create-window --command=btop"

        # Shot monitor
        ", PRINT, exec, grim ~/Pictures/Screenshots/screenshot-$(date '+%Y-%m-%d-%H-%M-%S').png"
        # Shot region
        "SHIFT, PRINT, exec, slurp | grim -g - ~/Pictures/Screenshots/screenshot-$(date '+%Y-%m-%d-%H-%M-%S').png"

        # Move focus with mod + arrow keys
        "$mod, H, movefocus, l,"
        "$mod, L, movefocus, r,"
        "$mod, K, movefocus, u,"
        "$mod, J, movefocus, d,"

        # Group Navigation
        "$mod, w,        togglegroup          "
        "$mod, n,        changegroupactive, f,"
        "$mod, m,        changegroupactive, b,"

        "SUPER SHIFT, h,  moveintogroup, l"
        "SUPER SHIFT, l, moveintogroup, r"

        "$mod, e, togglesplit,"

        # Key bindings
        "$mod SHIFT, Q, killactive"
        "$mod SHIFT, E, exit"
        "$mod, F,       fullscreen"
        "$mod SHIFT, R, exec, hyprctl reload"
        "$mod SHIFT, SPACE, togglefloating"

        #$mod, P, pseudo, # dwindle
        "$mod SHIFT, o, togglesplit," # dwindle

        # Scratchpad
        "$mod SHIFT, S, movetoworkspace, special"
        "$mod, S,      togglespecialworkspace,"

        # Scroll through existing workspaces with mod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # Sound control
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
        ", XF86AudioMute,        exec, wpctl set-mute   @DEFAULT_SINK@ toggle"
        ", XF86AudioMicMute,     exec, wpctl set-mute   @DEFAULT_SOURCE@ toggle"

        # Move focus with mod + arrow keys
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        "$mod SHIFT, h,  movewindow, l"
        "$mod SHIFT, l,  movewindow, r"
        "$mod SHIFT, k,  movewindow, u"
        "$mod SHIFT, j,  movewindow, d"

        # Switch workspaces with mod + [0-9]
        "$mod, 1, workspace, 1 "
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "SUPER, x, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod, X, workspace, 12"
        "$mod, Z, workspace, 11"
        "$mod, T, workspace, 13"
        "$mod, V, workspace, 16"
        "$mod, G, workspace, 14"
        "$mod, C, workspace, 15"

        # Move active window to a workspace with mod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$SUPER SHIFT, x, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "$mod_SHIFT, Z, movetoworkspace, 11"
        "$mod_SHIFT, X, movetoworkspace, 12"
        "$mod_SHIFT, T, movetoworkspace, 13"
        "$mod_SHIFT, G, movetoworkspace, 14"
        "$mod_SHIFT, C, movetoworkspace, 15"
        "$mod_SHIFT, V, movetoworkspace, 16"
      ];

      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };

    extraConfig = ''
      windowrulev2 = workspace 2 silent,class:(aegisub.*)$
      windowrulev2 = workspace 3 silent,class:(org.telegram.desktop)$
      # windowrulev2 = workspace 4 silent,class:()$
      windowrulev2 = workspace 5 silent,class:(java)$
      # windowrulev2 = workspace 6 silent,class:()$
      windowrulev2 = workspace 7 silent,title:(VSCodium)$
      windowrulev2 = workspace 9 silent,class:(audacious)$
      windowrulev2 = workspace 10 silent,class:(pavucontrol)$
      windowrulev2 = workspace 11 silent,class:(osu!)$
      windowrulev2 = workspace 12 silent,class:(firefox)$
      windowrulev2 = workspace 13 silent,class:(org.Qbittorrent.QBittorrent)$
      windowrulev2 = workspace 14 silent,class:(krita)$
      windowrulev2 = workspace 15 silent,class:(libreoffice-writer)$
      windowrulev2 = workspace 16 silent,class:(vesktop)$

      windowrule = suppressevent maximize, class:.* # TF does this do?
    '';
  };

  programs = {
    git = {
      enable = true;
      userName = "Pan-Svichka";
      userEmail = "borzhomi232@pm.me";
    };

    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };

    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = ./rofi.rasi;
    };

    neovim = {
      enable = true;
    };

    btop = {
      enable = true;
    };

    tmux = {
      enable = true;
    };

    waybar = {
      enable = true;
    };

    alacritty = {
      enable = true;
    };

    bash = {
      enable = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    zsh = {
      enable = true;
      initExtra = ''

        ~/stuff/scripts/randomizer.sh
        cal
        echo "Роби переклад"
        #date "+%A, %B %d, %Y"


        # some useful options (man zshoptions)
        setopt autocd extendedglob nomatch menucomplete
        setopt interactive_comments
        stty stop undef		# Disable ctrl-s to freeze terminal.
        zle_highlight=('paste:none')
        alias sp="sudo poweroff"
        #alias wineosu='WINEPREFIX=~/home/pan_svichka/prg/gms/osu/osu!wine+prefix/osu!prefix'
        #alias cdr="cd ~/stuff/code/rust/projects"

        # Specify the location of the history file
        HISTFILE="$HOME/.histfile"
        #HISTSIZE=10000000000000000000
        SAVEHIST=100000000000

        # beeping is annoying
        unsetopt BEEP
        setopt SHARE_HISTORY
        # Colors
        autoload -Uz colors && colors

        # Set the prompt
        PS1="[%F{red}%*%f]%n%F{lightblue} —>%f %~ %% "
        PS3="[%F{red}%*%f]%n%F{lightblue}@%m ->%f %~ %F{red}%f%% "
        PS2="%n@%m %~ %# "

        # Define some aliases
        alias ll="ls -l"
        alias la="ls -a"
        alias cls="clear"
        alias ls='ls --color=auto'
        alias xc='cls && source ~/.zshrc && source ~/.zshenv'

        # Enable colorized output for ls
        export CLICOLOR=1
        export LSCOLORS=GxFxCxDxBxegedabagaced

        # Add custom bin directory to the PATH
        #export PATH="$HOME/bin:$PATH"
        #export PATH=$PATH:/sbin/:/usr/sbin:/usr/bin:
        #export PKG_CONFIG_LIBDIR=/usr/local/lib/pkgconfig:/usr/lib64/pkgconfig/

        # Set editor to nano (you can change this to your preferred text editor)
        export EDITOR="nvim"
        export VISUAL="nvim"
        # Enable history sharing between multiple Zsh sessions
        setopt share_history

        # Enable autocorrect
        setopt correct

        #Theme
        ZSH_THEME="default"

        # Initialize fzf if installed (a fuzzy finder)
        if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
            source /usr/local/opt/fzf/shell/key-bindings.zsh
            source /usr/local/opt/fzf/shell/completion.zsh
        fi

        # completions
        autoload -Uz compinit

        compinit
        _comp_options+=(globdots)

        # Customize menu completion behavior and highlight options
        zstyle ':completion:*' menu select
        zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36"

        zmodload zsh/complist

        autoload -U up-line-or-beginning-search
        autoload -U down-line-or-beginning-search
        zle -N up-line-or-beginning-search
        zle -N down-line-or-beginning-search
        autoload -Uz colors && colors


        #plugins2
        #source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

        #source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"


        # Key-bindings
        	bindkey -s '^R' 'ranger^M'
        	bindkey -s '' 'btop^M'
        	#bindkey -s '^n' 'nvim $(fzf)^M'
        	bindkey -s '^V' 'nvim\n'
        	bindkey -s '^Z' 'nvim ~/.config/sway/config^M'
        	bindkey -s '^N' 'nvim ~/.zshrc^M'
        	bindkey -s '^A' 'nvim ~/.zshenv^M'

        	bindkey '^[[P' delete-char
        	bindkey "^k"   up-line-or-beginning-search # Up
        	bindkey "^j"   down-line-or-beginning-search # Down
        	bindkey "^l"   forward-word
        	bindkey "^h"   backward-word

        	bindkey '^[[1;5D' backward-word
        	bindkey '^[[1;5C' forward-word
        	bindkey '^[[3~'   delete-char
        	bindkey "^H"      backward-delete-char
        	bindkey "^[[H"    beginning-of-line
        	bindkey "^[[F"    end-of-line
        	bindkey "^[[2~"   delete-char

        autoload edit-command-line; zle -N edit-command-line
         bindkey '^e' edit-command-line
      '';
      envExtra = ''

        # Graphics settings
        #export AMD_VULKAN_ICD=RADV
        #export DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1=1
        export  XMODIFIERS=@im=fcitx

        export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

        # Uncomment the following line to always use software rendering for OpenGL
        # export LIBGL_ALWAYS_SOFTWARE=1

      '';
    };
  };
}
