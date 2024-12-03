#!/bin/sh
set +x

. ./scripts/functions.sh

echo "Starting stacks..."

find ./stacks -iname "docker-compose.yaml" | while read f;
do
  dir=$(get_abs_filename $(dirname -- "$f"))
  echo "$(basename ${dir}):"
  (cd $dir && docker compose up -d)

  status=$?
  exit_if $status
done
