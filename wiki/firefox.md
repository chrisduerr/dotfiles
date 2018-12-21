## Firefox `about:config` tweaks

### General
|                              |                                   |       |
|------------------------------|-----------------------------------|-------|
| Enable hardware acceleration | layers.acceleration.force-enabled | true  |
| Increase scroll speed        | mousewheel.min_line_scroll_amount | 50    |
| Disable pocket               | extensions.pocket.enabled         | false |
| Disable reader               | reader.parse-on-load.enabled      | false |
| Disable "Search with …"      | browser.urlbar.oneOffSearches     | false |
| Disable fullscreen autohide  | browser.fullscreen.autohide       | false |
| Disable DRM popup            | browser.eme.ui.enabled            | false |

### Privacy
|                            |                                                 |       |
|----------------------------|-------------------------------------------------|-------|
| Prevent 3rd party tracking | privacy.firstparty.isolate                      | true  |
| Tracking protection        | privacy.resistFingerprinting                    | true  |
| Disable GPS                | geo.enabled                                     | false |
| Telemetry                  | beacon.enabled                                  | false |
| Telemetry                  | toolkit.telemetry.enabled                       | false |
| Disable sensors            | device.sensors.enabled                          | false |
| SSL negotiation            | security.ssl.require_safe_negotiation           | true  |
| SSL negotiation            | security.ssl.treat_unsafe_negotiation_as_broken | true  |
| Disable WebRTC             | media.peerconnection.enabled                    | false |

### Sources
- https://spyware.neocities.org/guides/firefox.html

[Table of Contents](README.md)
