# Introduction

This repo contains handbrake presets and scripts used in converting videos that
is playable on most devices. The table below should provide enough information
as to what the final result of the conversion would be.

| Videos    |         |                  |
|-----------|---------|------------------|
| Codec     | x264    |                  |
| Audio     | AAC 160 | AC-3 Passthrough |
| Subtitles | N/A     |                  |
| Container | MP4     |                  | 

# How To
* Install HandBrakeCLI and GNU Parallel
* Place any videos, to be converted, in the `files/` directory
* Execute the convert script

```bash
sh convert.sh <HandBrake Preset>
```

*Available Presets*
* Bluray1080pAnimation
* Bluray1080pFilm
* DVD720pAnimation
* DVD720pFilm
* DVD480pAnimation
* DVD480pFilm

# License
This project is licensed under the MIT license.
