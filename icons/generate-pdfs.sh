#!/bin/bash
# OWD 2023

set -e

# Convert all Inkscape SVG icons to PDF 1.7 files, having vectorised all text
# into paths (text in icons is rare, and it is not worth encoding an entire
# font).

declare -r ICONDIR="$(git rev-parse --show-toplevel)/icons/"
command="export-type:pdf; export-text-to-path; export-pdf-version:1.5;"
hash inkscape 2>/dev/null || { echo >&2 "Inkscape is missing!"; exit 1; }

echo "Working in $(realpath --relative-to=$PWD $ICONDIR)/"
cd "$ICONDIR"

for file in *-inkscape.svg; do
    outfile="${file/-inkscape.svg/.pdf}"
    command="${command} file-open:${file};"
    command="${command} export-filename:${outfile};"
    command="${command} export-do;"
    echo "Added: ${file} -> ${outfile}"
done

echo ""
DISPLAY= inkscape --shell <<< ${command}

