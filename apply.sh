#! /bin/bash
d_label=$(date -Iseconds)
home="/home/declan"
repo="$home/repos/dotfiles"
mkdir $repo/.archive/$d_label
cp -r /etc/nixos $repo/.archive/$d_label/nixos
cp -r $repo/nixos/* /etc/nixos/
nixos-rebuild switch --flake /etc/nixos/#default
