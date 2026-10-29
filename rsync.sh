#!/usr/bin/bash

set -eu

TGT="${1:?usage: ${0##*/} TGT}"

ME="$(realpath -e "${0}")"
SRC="${ME%/*}"
ME="${ME##*/}"

TGT=$(realpath -E "${TGT}")

rclone check "${SRC}" "${TGT}" \
    --exclude "/.git/**" --exclude "/${ME}" \
    --one-way --links \
    --log-file /dev/null --combined - \
    | rg -v '^=' | sort -k 2

rclone copy "${SRC}" "${TGT}" \
    --exclude "/.git/**" --exclude "/${ME}" \
    --checksum --links --metadata --no-update-modtime \
    --log-file /dev/null --interactive
