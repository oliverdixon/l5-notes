#!/bin/bash
# OWD 2023

set -e

# Convert all Inkscape SVG icons to PDF 1.5 files, having vectorised all text
# into paths (text in icons is rare, and it is not worth encoding an entire
# font). Icons with a newer PDF of the same base name will be skipped.

declare -r ICONDIR="$(git rev-parse --show-toplevel)/icons/"
command="export-type:pdf; export-text-to-path; export-pdf-version:1.5;"
hash inkscape 2>/dev/null || { echo >&2 "Inkscape is missing!"; exit 1; }
workinqueue=false

echo -e "Working in $(realpath --relative-to=$PWD $ICONDIR)/\n"
cd "$ICONDIR"

for file in *-inkscape.svg; do
    outfile="${file/-inkscape.svg/.pdf}"
    if [[ $file -nt $outfile ]]; then
        command="${command} file-open:${file};"
        command="${command} export-filename:${outfile};"
        command="${command} export-do;"
        echo "Added: ${file} -> ${outfile}"
        workinqueue=true
    else
        echo "Skipping: ${file}"
    fi
done

echo ""
[[ $workinqueue = true ]] && DISPLAY= inkscape --shell <<< ${command} ||
    echo "Nothing to do!"

