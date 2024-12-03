#!/bin/bash

exit_if() {
  if [ $1 -ne 0 ]
  then
    exit $1
  fi
}

get_abs_filename() {
  echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}
