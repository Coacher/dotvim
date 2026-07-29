#!/usr/bin/bash

set -e

SRC="$(dirname "$(readlink -e "${0}")")/.vim/"
TGT="${1}"

rclone check "${SRC}" "${TGT}" \
    --one-way --links \
    --log-file /dev/null --combined - \
    | rg -v '^=' --sort=path

rclone copy "${SRC}" "${TGT}" \
    --checksum --links --metadata --no-update-modtime \
    --log-file /dev/null --interactive
