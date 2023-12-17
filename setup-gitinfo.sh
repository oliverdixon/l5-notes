#!/bin/bash
# OWD 2023

set -e

# Download the git hook script from CTAN and configure it as a post-commit
# action (and via symbolic links for any subsequent aliases defined by $HOOKS,
# e.g. post-checkout) for the current repository.

declare -r FILE_URL="http://mirrors.ctan.org/macros/latex/contrib/gitinfo2/post-xxx-sample.txt"
declare -ra HOOKS=("post-commit" "post-checkout")

cd "$(git rev-parse --show-toplevel)/.git/hooks"
wget -nv "$FILE_URL" -O "${HOOKS[0]}"
chmod a+x "${HOOKS[0]}"

for dest in "${HOOKS[@]:1}"; do
    ln -sfT "${HOOKS[0]}" "$dest"
    echo "Created alias \"${HOOKS[0]}\" -> \"$dest\""
done

