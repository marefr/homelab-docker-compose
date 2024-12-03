#!/bin/sh
set +x

. ./scripts/functions.sh

find ./preup -iname "*.sh" -print | sort | while read script;
do
  set -x
  $script
  { status=$?; set +x; } &> /dev/null

  exit_if $status
done
