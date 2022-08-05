#!/usr/bin/env bash

set -e
make install -j 4

export VAR=$(date)
export NIX_SHOW_STATS=1

t=$(time outputs/out/bin/nix --option max-jobs 4 --extra-experimental-features nix-command --extra-experimental-features flakes build --substituters "" --impure nix-parallel-ifd#ifd)

echo $t
