## Mono Pulseaudio

Pulseaudio can be used to remap all stereo audio to equal mono audio on all
channels.  The `OUTPUT_NAME` in the following config should be replaced with
the output listed in `pacmd list-sinks | grep -e 'name:'`

```
/etc/pulse/default.pa

load-module module-remap-sink master=<OUTPUT_NAME> sink_name=mono sink_properties="device.description='Mono'" channels=2 channel_map=mono,mono
set-default-sink mono
```

[Table of Contents](README.md)
