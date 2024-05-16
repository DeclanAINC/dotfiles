# programs.vscode = 
{ pkgs, ... }: 
{
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
  ];
}