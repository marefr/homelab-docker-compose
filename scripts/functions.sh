#!/bin/sh

Red="\033[0;31m"

exit_if() {
  if [ $1 -ne 0 ]
  then
    echo "${Red}"
    exit $1
  fi
}

get_abs_filename() {
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}
