#!/bin/bash

set -e

CMD="rsync -rlp -Ic --existing -i"
SRC="$(dirname $(readlink -e ${0}))/.vim/"

${CMD} --dry-run "${SRC}" "${1}"

read -r -p "Proceed? (y/N): " ANSWER
case "${ANSWER:-N}" in
    [yY])
        ${CMD} --stats "${SRC}" "${1}"
        ;;
    [nN])
        echo "Aborting per user request."
        ;;
    *)
        echo "Invalid input. Please enter 'y' or 'n'."
        ;;
esac
