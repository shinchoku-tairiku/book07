#!/usr/bin/env bash

set -eux -o pipefail

script_path="$(cd $(dirname $0); pwd)"
fonts_file="${1:-$script_path/fonts.txt}"

fonts_dir=".satysfi/dist/fonts"
mkdir -p "$fonts_dir"

tempdir="$(mktemp -d)"

cat "$fonts_file" | while read filename url; do
    echo "$filename <- $url"
    wget -O "$tempdir/$filename" "$url"
    unzip -o -d "$tempdir" "$tempdir/$filename"
done

echo "downloaded."

cp "$tempdir"/*.otf "$fonts_dir"/.

echo "done."
