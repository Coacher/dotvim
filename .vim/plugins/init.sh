#!/bin/bash

PLUG_DIR="vim-plug"

if [[ -d ${PLUG_DIR} ]]; then
    rm -Irv "${PLUG_DIR}"
fi

git clone --depth=1 https://github.com/junegunn/vim-plug.git "${PLUG_DIR}"
