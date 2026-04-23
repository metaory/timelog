#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/../.." || exit 1

for tape in .github/demos/*.tape; do
  [ -e "$tape" ] || exit 0
  vhs "$tape" &
done

wait
