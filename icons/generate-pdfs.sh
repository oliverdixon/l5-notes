#!/bin/bash
# OWD 2023

hash inkscape 2>/dev/null || { echo >&2 "Inkscape is missing!"; exit 1; }
command="export-type:pdf; export-text-to-path; export-pdf-version:1.5;"

for file in *-inkscape.svg; do
    outfile=${file/-inkscape.svg/.pdf}
    command="${command} file-open:${file};"
    command="${command} export-filename:${outfile}"
    command="${command} export-do;"
    echo "Added: ${file} -> ${outfile}"
done

DISPLAY= inkscape --shell <<< ${command}

