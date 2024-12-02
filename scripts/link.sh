#!/bin/sh
set +x

. ./scripts/functions.sh

TARGET=${1:-"../homelab-private/stacks"}

find ${TARGET} -iname "compose.override.yaml" | while read f;
do
  dir=$(dirname -- "$f")
  absdir=$(get_abs_filename "$dir")
  fn=${f#"$TARGET/"}
  absfile=$(get_abs_filename "$f")
  set -x
  ln -sf $absfile "./$fn"
  { set +x; } &> /dev/null

  # any override directory in target directory
  find ${dir} -type d -iname "override" -maxdepth 1 -mindepth 1 | while read d;
  do
    dn=${d#"$TARGET/"}
    abssubdir=$(get_abs_filename "$d")
    set -x
    ln -sf $abssubdir "./$dn"
    { set +x; } &> /dev/null
  done
done
