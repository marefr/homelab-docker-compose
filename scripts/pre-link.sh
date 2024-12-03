#!/bin/bash
set +x

. ./scripts/functions.sh

TARGET=${1:-"../homelab-private"}
TARGET_PREUP="$TARGET/preup"

find ${TARGET_PREUP} -iname "*.sh" | while read f;
do
  fn=${f#"$TARGET_PREUP/"}
  absfile=$(get_abs_filename "$f")
  set -x
  ln -sf $absfile "./preup/$fn"
  { set +x; } &> /dev/null
done
