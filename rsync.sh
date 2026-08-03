#!/usr/bin/bash

set -eu

SRC="$(dirname "$(readlink -e "${0}")")/.vim/"
TGT="${1:?usage: ${0##*/} TGT}"

rclone check "${SRC}" "${TGT}" \
    --one-way --links \
    --log-file /dev/null --combined - \
    | rg -v '^=' --sort=path

rclone copy "${SRC}" "${TGT}" \
    --checksum --links --metadata --no-update-modtime \
    --log-file /dev/null --interactive
