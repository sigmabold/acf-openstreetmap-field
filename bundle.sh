#!/bin/bash

set -e

DIR="$( cd -P "$( dirname "$0" )" && pwd )"
PLUGIN="$( basename $DIR )"
VER="$( jq -r .version package.json )"
PREFIX="$PLUGIN.$VER"

npx gulp build

if [[ -n $(git status -s) ]]; then
    echo "Git is dirty, refusing to build bundle"
    exit 1
fi

git archive --format=zip --prefix="$PLUGIN/" -o "$PREFIX.zip" HEAD