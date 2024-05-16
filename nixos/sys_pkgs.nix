{ config, pkgs, ... }:

{

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System wide packages
  # To search, run: `$ nix search wget`
  environment.systemPackages = with pkgs; [
    # //-- 	 Apps 	--//
    # Programs 
    peek
    dolphin
    unzip
    rofi
    arandr # gui for xrandr
    htop

    # Text editors
    vim

    # //-- 	 Languages   --//
    # Rust
    cargo
    rustc
    rust-analyzer

    # python
    python3
    python310Packages.black

    # JS
    nodejs

    # //-- 	 Utils  --//
    # Quality of life
    xmousepasteblock	# block middle-mouse paste
    autotiling		# auto tiling for i3

    # CLI tools
    wget
    git
    gh
    git-credential-oauth
    git-credential-manager
    btop
    ripgrep
    loc
    thefuck
    pandoc
    lshw

    # //-- 	 System  --//
    # linuxKernel.packages.linux_zen.perf

    # Build
    gcc
    pkg-config
    udev.dev

    # Env tools
    direnv
    nix-direnv

    # Shell
    fish
    alacritty
    tmux

    # Window manager
    i3
  ];

  fonts.packages = with pkgs; [ nerdfonts ];
}