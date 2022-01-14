#!/usr/bin/env bash

filename=$(realpath "$0")
mydir=${filename%/*}
grep=${GREPCMD:-rg -n}
lang="$1"
extra_args=""
config_file="${CONFIG_FILE:-$mydir/$lang.config}"
args_file="$mydir/$lang.args"
shift
contents=$(cat "$config_file" | grep -v "^$" | grep -v "^#")
if [ -f "$args_file" ]; then
    extra_args=$(gsed -z 's/\n/ /g' "$args_file")
fi
eval $grep -f <(echo "$contents") "$extra_args" $@ .
