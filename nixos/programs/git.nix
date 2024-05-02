# programs.git = 
let
  gh_auth = "!/run/current-sustem/sw/bin/gh auth git-credential";
in
pkgs: {
  enable = true;
  package = pkgs.gitFull;
  userName = "declan";
  userEmail = "declan@ai-nc.com";
  extraConfig = {
    pull.rebase = false;
    credential.helper = "oauth";
    "credential \"https://github.com\"".helper = gh_auth;
    "credential \"https://gist.github.com\"".helper = gh_auth;
  };
}