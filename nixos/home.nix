{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "declan";
  home.homeDirectory = "/home/declan";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # terminal stuff
    alacritty-theme

    # Termincal Applications
    lazygit
    yazi

    # GUI applications
    barrier
    flameshot
    google-chrome
    sublime-merge
    firefox
    discord
    slack
    freecad

    # Editors
    # vscode
    neovim
    libreoffice-fresh
    kate

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
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/declan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.fish = import ./programs/fish.nix pkgs;
  programs.git = import ./programs/git.nix pkgs;
  programs.vscode = {
    # user = "declan";
    # homeDir = "/home/declan";
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      github.copilot
      github.copilot-chat
      streetsidesoftware.code-spell-checker
      serayuzgur.crates
      tamasfe.even-better-toml
      # removed until i can figure out how to confiure it not to try to auto close every carrot
      # techtheawesome.rust-yew 
      rust-lang.rust-analyzer
      mkhl.direnv
      arrterian.nix-env-selector
      jnoortheen.nix-ide
      bradlc.vscode-tailwindcss
      # wgsl-analyzer.wgsl-analyzer
    ];
  };
  xsession.windowManager.i3 = import ./programs/i3.nix pkgs;
  programs.yazi = import ./programs/yazi.nix pkgs;
}
