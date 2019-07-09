## Disable HDMI Audio

Running the following command will blacklist the `snd_hda_codec_hdmi` module and prevent it from getting loaded by `udev` at boot.

```
echo "blacklist snd_hda_codec_hdmi" > /etc/modprobe.d/hdmiaudio.conf
```

[Table of Contents](README.md)
