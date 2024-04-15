#! /bin/bash
d_label=$(date -Iseconds)
home="/home/declan"
mkdir .archive/$d_label
cp -r $home/.config/i3 $home/repos/dotfiles/.archive/$d_label/i3
cp -r $home/repos/dotfiles/i3/* $home/.config/i3/
i3-msg reload
i3-msg restart
