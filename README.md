# MPVKit — StarPlay OpenSSL Variant

This repository is a clean source-and-recipe snapshot of the MPVKit variant used by StarPlay.
It is based on upstream [MPVKit 1.0.0](https://github.com/mpvkit/MPVKit/tree/1.0.0)
at commit `288527dffbc6d3e63cce147fc7b520c64a791603`.

The published Swift package is intentionally **iOS-only** and contains the LGPL product only.
Its mpv and FFmpeg binaries are built with OpenSSL, without GnuTLS, GMP, Nettle, Samba,
`--enable-version3`, or GPL code.

## Swift Package Manager

```swift
.package(
    url: "https://github.com/starsdaisuki/mpvkit-starplay",
    exact: "1.0.0-starplay.1"
)
```

Use the `MPVKit` product. There is no `MPVKit-GPL` product in this variant.

## Rebuilding

The build requires macOS, Xcode, Swift, Homebrew, pkg-config, wget, nasm, Meson, and Ninja.
The exact upstream inputs and their SHA-256 values are recorded in [`SOURCES.lock`](SOURCES.lock).

```bash
make build platform=ios version=1.0.0-starplay.1
```

The command produces iOS-device and iOS-simulator XCFramework archives in `dist/release/`.
Run it from a path that contains no private identity if the resulting binaries will be published;
FFmpeg and mpv retain build configuration paths in their public version strings.

For a resumed build with all dependency archives already present under `dist/`:

```bash
STARPLAY_ONLY_CORE=1 make build platform=ios version=1.0.0-starplay.1
STARPLAY_ONLY_MPV=1 make build platform=ios version=1.0.0-starplay.1
```

See [`VARIANT.md`](VARIANT.md) for the exact changes from upstream and
[`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md) for licensing details.

## Licensing

The MPVKit build scripts and package source in this repository remain under upstream's
LGPL-3.0 license; see [`LICENSE`](LICENSE). The produced mpv and FFmpeg binaries retain
their own LGPL-2.1-or-later licensing, and every other linked component remains under its
respective license. Build configuration does not relicense upstream code.
