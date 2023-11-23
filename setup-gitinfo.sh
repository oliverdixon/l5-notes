#!/bin/bash
# OWD 2023

set -e

FILE_URL="http://mirrors.ctan.org/macros/latex/contrib/gitinfo2/post-xxx-sample.txt"
declare -a HOOKS=("post-commit" "post-checkout")

cd "$(git rev-parse --show-toplevel)/.git/hooks"
wget -nv "$FILE_URL" -O "${HOOKS[0]}"
chmod a+x "${HOOKS[0]}"

for dest in "${HOOKS[@]:1}"; do
    ln -sfT "${HOOKS[0]}" "$dest"
    echo "Created alias \"${HOOKS[0]}\" -> \"$dest\""
done

