#!/bin/sh

set -eux
shopt -s extglob

mkdir -p new
for line in *.mp4; do
	ffmpeg -i "$line" -movflags faststart -acodec copy -vcodec copy "new/$line"
	sleep 1s
done
