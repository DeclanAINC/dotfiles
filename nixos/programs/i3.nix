# xsession.windowManager.i3 =
{ pkgs, ... }:
let 
  mod = "Mod4";
in rec {
  enable = true;
  package = pkgs.i3;
  config = {
    workspaceLayout = "default";
    modifier = mod;
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
  };
}
