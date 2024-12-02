#!/bin/sh
set +x

. ./scripts/functions.sh

find ./stacks -iname "docker-compose.yaml" | while read f;
do
  dir=$(get_abs_filename $(dirname -- "$f"))
  (cd $dir && docker compose up -d)
done
