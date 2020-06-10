#!/bin/sh

# this script doesnt work just yet.
# am only posting it here for reference.

# cut out the first ten seconds of the video
# ref: https://www.arj.no/2018/05/18/trimvideo/
ffmpeg -i 'input.mp4' -ss 00:00:10 -c:v copy -c:a copy output.mp4
