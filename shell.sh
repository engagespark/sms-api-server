#!/usr/bin/env bash
## based on: https://jade.fyi/blog/pinning-nixos-with-npins/

cd $(dirname $0)

nixpkgs_pin=$(nix --extra-experimental-features nix-command eval --raw -f npins/default.nix nixpkgs)
nix_path="nixpkgs=${nixpkgs_pin}"

NIX_PATH="${nix_path}" nix-shell -A shell "$@"

