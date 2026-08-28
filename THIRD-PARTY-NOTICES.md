# Third-party notices

This repository is derived from MPVKit 1.0.0. Its source snapshot remains under LGPL-3.0.

The published binary targets contain mpv v0.41.0 and FFmpeg n8.1.2 built in their
LGPL-2.1-or-later configurations. FFmpeg uses OpenSSL and is built without `--enable-gpl`,
`--enable-version3`, or GnuTLS. mpv is built with `-Dgpl=false`.

The package also links binary targets supplied by the following upstream projects:
OpenSSL, libass, libunibreak, FreeType, FriBidi, HarfBuzz, MoltenVK, shaderc,
Little CMS, libplacebo, libdovi, dav1d, uavs3d, uchardet, and libbluray.
Each component remains governed by its own license. Exact versions and archive hashes are in
[`SOURCES.lock`](SOURCES.lock).

The release's LGPL-2.1 and FFmpeg license texts are available under [`LICENSES/`](LICENSES/).
Consumers distributing a combined application must also preserve all notices required by the
binary dependencies they select. This repository does not relicense those components.
