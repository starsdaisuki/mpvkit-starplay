# StarPlay OpenSSL-only variant

This snapshot makes the following deliberate changes to upstream MPVKit 1.0.0:

- publishes only the LGPL `MPVKit` product and removes the GPL/Samba product;
- builds FFmpeg with OpenSSL instead of GnuTLS;
- removes GMP, Nettle, Hogweed, and GnuTLS package dependencies;
- removes FFmpeg's `--enable-version3` flag;
- keeps mpv configured with `-Dgpl=false`;
- disables mpv manpage generation for mobile library builds;
- provides resume gates for rebuilding only FFmpeg+mpv or only mpv;
- publishes an iOS-device and iOS-simulator package rather than claiming unsupported platforms.

The release acceptance checks are:

```text
FFmpeg: CONFIG_GPL=0, CONFIG_VERSION3=0, CONFIG_GNUTLS=0, CONFIG_OPENSSL=1
mpv:    -Dgpl=false
```

The release assets must also have zero private user paths when their raw archive bytes and
headers are scanned. Merely stripping symbols is insufficient because FFmpeg and mpv expose
their configuration strings at runtime.
