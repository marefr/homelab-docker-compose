#!/bin/bash

TARGET=${1:-"../homelab-private"}

find . -type l | while read f;
do
  set -x
  unlink $f
  { set +x; } &> /dev/null
done