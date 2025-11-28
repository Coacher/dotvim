#!/bin/bash

shopt -s nullglob

for plugin in */; do
    cd ${plugin} || exit 1
    echo -e "Begin processing ${plugin}\n"

    git checkout -- . && git clean -d --force -x
    git checkout $(basename $(git symbolic-ref --short refs/remotes/origin/HEAD)) \
        && git reset --hard $(git symbolic-ref --short refs/remotes/origin/HEAD)
    git checkout -- . && git clean -d --force -x
    git pull && git gc --aggressive --prune=now

    echo -e "Finish processing ${plugin}\n"
    cd - || exit 1
done
