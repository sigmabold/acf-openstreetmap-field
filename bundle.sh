#!/bin/sh

set -e

DIR="$( cd -P "$( dirname "$0" )" && pwd )"
PLUGIN="$( basename $DIR )"
VER="$( jq -r .version package.json )"
PREFIX="$PLUGIN.$VER"

git archive --format=zip --prefix="$PLUGIN/" -o "$PREFIX.zip" HEAD