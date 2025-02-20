{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # hello
    awesome
    wezterm
    alacritty
    polybarFull
    picom
    pcmanfm
    pavucontrol
    blueman
    emacs
    rofi
    flameshot
    kora-icon-theme
    brave
    kdePackages.kdeconnect-kde
    zoom-us
    vscode
    # vscode-fhs
    vim
    texliveTeTeX
    fzf
    fd
    eza
    nerd-fonts.symbols-only
    cascadia-code
    fira-code
    inconsolata
    inter
    jetbrains-mono
    meslo-lgs-nf
    roboto
    # rubik
    virt-manager
    lazygit
    vlc
    ripgrep
    udiskie
    tmux
    clipman
    starship
    gh
    btop
    font-awesome
    pop-gtk-theme
    xdg-desktop-portal-gtk
    bat
    lxappearance
    simp1e-cursors
    zotero
    kdePackages.okular
    ookla-speedtest
    signal-desktop
    xclip
    spice-vdagent
    networkmanagerapplet
    nodePackages_latest.npm
    sshfs
    slack
    fwupd

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    ".config/nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";
        recursive = true;
      };

    ".config/awesome" = {
        source = "${config.home.homeDirectory}/.dotfiles/awesome";
        recursive = true;
      };

    ".config/polybar" = {
        source = "${config.home.homeDirectory}/.dotfiles/polybar";
        recursive = true;
      };

    ".config/rofi" = {
        source = "${config.home.homeDirectory}/.dotfiles/rofi";
        recursive = true;
      };

    "Pictures/wallpapers/digital-art-anime-cartoon-city-road-bicycle-1745701-wallhere.com.jpg".source = 
            "${config.home.homeDirectory}/.dotfiles/digital-art-anime-cartoon-city-road-bicycle-1745701-wallhere.com.jpg";
    ".wezterm.lua".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/.wezterm.lua";
    # ".zshrc".source = "${config.home.homeDirectory}/.dotfiles/.zshrc";
    ".bashrc".source = "${config.home.homeDirectory}/.dotfiles/.bashrc";
    ".xscreensaver".source = "${config.home.homeDirectory}/.dotfiles/.xscreensaver";
    ".alacritty.toml".source = "${config.home.homeDirectory}/.dotfiles/alacritty.toml";
    ".config/starship.toml".source = "${config.home.homeDirectory}/.dotfiles/starship.toml";
    ".fonts" = {
        recursive = true;
        source = "${config.home.homeDirectory}/.dotfiles/.fonts";
      };

    ".local/bin/mntrem" = {
        source = "${config.home.homeDirectory}/.dotfiles/mntrem";
        executable = true;
      };


  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ryan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # MY ADDITIONAL MODIFICATIONS
  xsession.enable = true;
  xsession.windowManager.awesome.enable = true;
  targets.genericLinux.enable = true;
  services.udiskie.enable = true;
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "sudo"
            "jump"
            "copypath"
            "starship"
            "zsh-interactive-cd"
          ];
          theme = "robbyrussell";
        };
      shellAliases = {
          ll = "eza --long --all --sort=type";
          ".." = "cd ..";
          p = "python3";
          python = "python3";
          usc = "openconnect-sso -s vpn.usc.edu";
          ta ="tmux attach-session -t";
          umntrem = "fusermount -u ~/remote_mount/";
        };
      initExtra = "";
    };

    programs.git = {
        enable = true;
        userName = "Ryan Swift";
        userEmail = "ryanswif@usc.edu";
      };

    programs.neovim = {
       enable = true;
       withPython3 = true;
       plugins = with pkgs.vimPlugins; [
         nvim-treesitter.withAllGrammars
       ];
       extraPackages = [ 
       pkgs.gcc
       pkgs.lazygit 
       pkgs.gh
       pkgs.nodePackages_latest.npm
       ];
      };

    gtk = {
        enable = true;
        iconTheme = {
          name = "kora";
          package = pkgs.kora-icon-theme;
        };
        theme = {
            name = "Pop-dark";
            package = pkgs.pop-gtk-theme;
        };
        cursorTheme = {
            name = "Simp1e-Adw-Dark";
            package = pkgs.simp1e-cursors;
          };
        gtk3.extraConfig = {
            Settings = ''
              gtk-application-prefer-dark-theme=1
                '';
            };

        gtk4.extraConfig = {
            Settings = ''
              gtk-application-prefer-dark-theme=1
                '';
          };
      };

      # Enable SSH support in Home Manager
      programs.ssh.enable = true;
      services.ssh-agent.enable = true;

      # Configure SSH forwarding for all hosts
      programs.ssh.extraConfig = ''
        Host server1
          HostName netpd.usc.edu
          User ryanswif
          Port 6304
          ForwardAgent yes

        Host server2
          HostName netpd.usc.edu
          User ryanswif
          Port 6305
          ForwardAgent yes

        Host labServer1
          HostName 10.15.30.21
          User ryanswif
          Port 22
          ForwardAgent yes

        Host labServer2
          HostName 10.15.30.22
          User ryanswif
          Port 22
          ForwardAgent yes
      '';


      services.picom.enable = true;
      programs.lazygit.enable = true;
}
