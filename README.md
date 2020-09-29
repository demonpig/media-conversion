# Introduction

This repo contains handbrake presets and scripts used in converting videos that
is playable on most devices. The table below should provide enough information
as to what the final result of the conversion would be.

| Videos    |         |                  |
|-----------|---------|------------------|
| Codec     | x265    |                  |
| Audio     | Opus    | AC-3 Passthrough |
| Subtitles | N/A     |                  |
| Container | MKV     |                  | 

# How To
* Install HandBrakeCLI and GNU Parallel
* Place any videos, to be converted, in the `files/` directory
* Execute the convert script

```bash
sh -x convert.sh <HandBrake Preset>
```

*Available Presets*
* HEVC-1080p-Animation.json
* HEVC-1080p.json
* HEVC-480p-Animation.json
* HEVC-480p.json
* HEVC-720p-Animation.json
* HEVC-720p.json

# License
This project is licensed under the MIT license.
