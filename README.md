# Declan's AINC NixOs Config and dotfiles
This is my continuous (and eternally) WIP nixos config using home manager as well, its pretty fun.

## To do - Cleanup
The old directories from Tom's configurations for `i3/`, `nvim/`, and `tmux/` are not being used in any way
by my flake or home manager, but I;m keeping them around to so i can eventually port over the part sof them i like.

## To do - Plans
### Barrier
Need to configure `barrier` to run on startup and connect to `10.0.0.31`.

### xRandr
Configure start script to run the `xrandr` config created, as well as figure out a good resolution rescale so that my 
tool bar ui stuff is f**king huge.

### Default floating window size
Any time a file selector window show up its goddam gigantic, i have no idea where ot start with this (possibly fixed with `xrandr`).

### Firefox scaling and config
The scaling of firefox suffers the same fate as the scaling of all the other tool bars, and might be fixed with `xrandr` config.

What i would actually like to do is configure firefox through nix and home manager so that it define the default profile,
mostly so i can setup an `autoconfig.js` to i can bind `ctrl + >` to be `ctrl +  f10` to open the context menu at cursor position, but its 
a little more complex than just a home manager option.

These links are where im up to:
- https://support.mozilla.org/en-US/kb/customizing-firefox-using-autoconfig
- https://www.reddit.com/r/NixOS/comments/1b6aj0m/firefox_config_hack_s_post/
- https://discourse.nixos.org/t/combining-best-of-system-firefox-and-home-manager-firefox-settings/37721
- https://home-manager-options.extranix.com/?query=firefox&release=master