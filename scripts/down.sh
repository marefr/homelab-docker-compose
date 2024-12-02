#!/bin/sh
set +x

get_abs_filename() {
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

find . -iname "docker-compose.yaml" | while read f;
do
  dir=$(get_abs_filename $(dirname -- "$f"))
  (cd $dir && docker compose down)
done
