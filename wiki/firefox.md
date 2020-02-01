## Firefox `about:config` tweaks

### General

| Description                  | Setting                           | Value |
|------------------------------|-----------------------------------|-------|
| Enable hardware acceleration | layers.acceleration.force-enabled | true  |
| Increase scroll speed        | mousewheel.min_line_scroll_amount | 50    |
| Disable pocket               | extensions.pocket.enabled         | false |
| Disable reader               | reader.parse-on-load.enabled      | false |
| Disable "Search with …"      | browser.urlbar.oneOffSearches     | false |
| Disable fullscreen autohide  | browser.fullscreen.autohide       | false |
| Disable DRM popup            | browser.eme.ui.enabled            | false |

### Privacy

The following `about:config` settings can be enabled **in addition** to what is
possible in `about:preferences`:

| Description                   | Setting                                 | Value |
|-------------------------------|-----------------------------------------|-------|
| Prevent cross-domain cookies  | privacy.firstparty.isolate              | true  |
| Fingerprinting                | privacy.resistFingerprinting            | true  |
| Firefox telemetry             | beacon.enabled                          | false |
| WebRTC IP leak                | media.peerconnection.enabled            | false |
| Microphone/camera status      | media.navigator.enabled                 | false |
| WebGL fingerprinting/security | webgl.disabled                          | true  |
| Clipboard event notifications | dom.event.clipboardevents.enabled       | false |
| Block outdated SSL/TLS        | security.ssl.require_safe_negotiation   | true  |
| Page fetch on hover           | network.http.speculative-parallel-limit | 0     |
| Page prefetch                 | network.dns.disablePrefetch             | true  |
| Page prefetch                 | network.prefetch-next                   | false |

#### Potential issues

`privacy.firstparty.isolate` setting might break certain websites that rely on
cross-domain cookies, this includes the Twitch dark theme for example.

`privacy.resistFingerprinting` will disable media queries, change user agent,
reset timezone and change various other settings
([docs](https://wiki.mozilla.org/Security/Fingerprinting)).

### Sources
- https://wiki.mozilla.org/Security:Renegotiation#security.ssl.require_safe_negotiation
- https://www.usenix.org/legacy/events/leet10/tech/full_papers/Krishnan.pdf
- https://wiki.mozilla.org/Security/Fingerprinting
- https://restoreprivacy.com/firefox-privacy/

[Table of Contents](README.md)
