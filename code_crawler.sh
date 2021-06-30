#!/usr/bin/env bash

mydir=${0%/*}
grep=${GREPCMD:-rg}
lang="$1"
shift

cat "$mydir/$lang.config" | grep -v "^$" | grep -v "^#" | while read -r entry; do
    eval $grep $@ "'$entry'" .
done
