#!/bin/bash

set -eu
shopt -s globstar

# Variables
BASEPATH="$(dirname $0)"
MEDIA_FILES_DIR="files"
MEDIA_OUTPUT_DIR="converted"
MEDIA_HB_DIR="handbrake"
MEDIA_PRESET_FILENAME="${1-default}" ; MEDIA_PRESET_FILENAME="${MEDIA_PRESET_FILENAME%.json}.json"
MEDIA_PRESET="${MEDIA_PRESET_FILENAME%.json}"
NO_PARALLEL=0

# Checks
CMD_PL="/usr/bin/parallel"
CMD_HB="/usr/bin/HandBrakeCLI"
test -x $CMD_PL || export NO_PARALLEL=1
test -x $CMD_HB || exit 1
test -f "$BASEPATH/$MEDIA_HB_DIR/$MEDIA_PRESET_FILENAME" || exit 2

# Functions
function parallel_convert(){
    $CMD_PL --eta --verbose -j2 HandBrakeCLI \
        --preset-import-file "$BASEPATH/$MEDIA_HB_DIR/$MEDIA_PRESET_FILENAME" \
        --preset "${MEDIA_PRESET}" \
        -i {} -o $BASEPATH/$MEDIA_OUTPUT_DIR/{/.}.mkv ::: $BASEPATH/$MEDIA_FILES_DIR/*
}

function forloop_convert(){
    for file in $BASEPATH/$MEDIA_FILES_DIR/*; do
        HandBrakeCLI \
            --preset-import-file "$BASEPATH/$MEDIA_HB_DIR/$MEDIA_PRESET_FILENAME" \
            --preset "$MEDIA_PRESET" \
            -i "$file" -o "$BASEPATH/$MEDIA_OUTPUT_DIR/${file%.*}.mkv"
    done
}

# Main
mkdir -p $MEDIA_OUTPUT_DIR
if [[ $NO_PARALLEL -eq 1 ]]; then
    forloop_convert
else
    parallel_convert
fi
