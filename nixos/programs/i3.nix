# xsession.windowManager.i3 =
# find config options:
# @ https://nix-community.github.io/home-manager/options.xhtml
# @ https://github.com/nix-community/home-manager/blob/master/modules/services/window-managers/i3-sway/i3.nix#L143
{ pkgs, ... }:
let 
  mod = "Mod4";
in rec {
  enable = true;
  package = pkgs.i3;
  config = {
    workspaceLayout = "default";
    modifier = mod;
    terminal = "alacritty";
    fonts = {
      names = ["pango: Font Awesome" "Noto Sans Regular"];
      size = 6.0;
    };
    gaps = {
      inner = 6;
      outer = 3;
    };
    focus = {
      followMouse = false;
      newWindow = "urgent";
    };
    startup = [
      {
        command = "xmousepasteblock";
        always = true;
      }
    ];
  };
}
