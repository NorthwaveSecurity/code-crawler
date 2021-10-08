#!/usr/bin/env bash

filename=$(realpath "$0")
mydir=${filename%/*}
grep=${GREPCMD:-rg -n}
lang="$1"
shift

cat "$mydir/$lang.config" | grep -v "^$" | grep -v "^#" | while read -r entry; do
    eval $grep $@ "'$entry'" .
done
