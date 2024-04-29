{ config, pkgs, home-manager, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.declan = {
    isNormalUser = true;
    description = "Declan";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Shell & Terminal
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Setting up home manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  # Optionally, use home-manager.extraSpecialArgs to pass
  # arguments to home.nix
  home-manager.users.declan = import ./home.nix;
  
  # inputs.home-manager.nixosModules.default
  # ({ pkgs, ... }: {
  #   nixpkgs.overlays = [ rust-overlay.overlays.default ];
  #   environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
  # })
}