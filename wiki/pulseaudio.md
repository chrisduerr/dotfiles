## Pulseaudio

### Setup sound cards

To disable a sound card, or set it to a specific profile, the pulseaudio config
can be used.

First the `CARD_NAME` and desired `PROFILE` need to be identified.

```bash
pacmd list-cards | grep -e 'name:' -e 'priority [0-9]*, a'
```

Profiles can then be set in the configuration file.

```
/etc/pulse/default.pa

set-card-profile <CARD_NAME> <PROFILE>
```

### Mono sound on stereo output

Pulseaudio can be used to remap all stereo audio to equal mono audio on all
channels.  The `OUTPUT_NAME` in the following config should be replaced with the
output listed in `pacmd list-sinks | grep -e 'name:'`.

```
/etc/pulse/default.pa

load-module module-remap-sink master=<OUTPUT_NAME> sink_name=mono sink_properties="device.description='Mono'" channels=2 channel_map=mono,mono
set-default-sink mono
```
## Sources:
- `man pulse-cli-syntax`

[Table of Contents](README.md)
