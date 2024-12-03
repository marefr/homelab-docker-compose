#!/bin/sh
set +x

. ./scripts/functions.sh

TARGET=${1:-"../homelab-private"}
TARGET_STACKS="$TARGET/stacks"

find ${TARGET_STACKS} -iname "compose.override.yaml" | while read f;
do
  dir=$(dirname -- "$f")
  absdir=$(get_abs_filename "$dir")
  fn=${f#"$TARGET_STACKS/"}
  absfile=$(get_abs_filename "$f")
  set -x
  ln -sf $absfile "./stacks/$fn"
  { set +x; } &> /dev/null

  # any override directory in target directory
  find ${dir} -type d -iname "override" -maxdepth 1 -mindepth 1 | while read d;
  do
    dn=${d#"$TARGET_STACKS/"}
    abssubdir=$(get_abs_filename "$d")
    set -x
    ln -sf $abssubdir "./stacks/$dn"
    { set +x; } &> /dev/null
  done
done
