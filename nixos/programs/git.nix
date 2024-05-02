# programs.git = 
pkgs: {
  enable = true;
  package = pkgs.gitFull;
  userName = "declan";
  userEmail = "declan@ai-nc.com";
  extraConfig.pull.rebase = false;
  extraConfig.credential.helper = "oauth";
}