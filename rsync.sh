#!/usr/bin/bash

set -eu

ME="$(basename "$(readlink -e "${0}")")"
SRC="$(dirname "$(readlink -e "${0}")")"
TGT="${1:?usage: ${0##*/} TGT}"

rclone check "${SRC}" "${TGT}" \
    --exclude "/.git/**" --exclude "/${ME}" \
    --one-way --links \
    --log-file /dev/null --combined - \
    | rg -v '^=' | sort -k 2

rclone copy "${SRC}" "${TGT}" \
    --exclude "/.git/**" --exclude "/${ME}" \
    --checksum --links --metadata --no-update-modtime \
    --log-file /dev/null --interactive
