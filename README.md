# Lunox

Lunox is a standalone voxel survival game. It bundles the **Luanti** (formerly Minetest)
open-source voxel engine together with the **VoxeLibre** game framework, integrated
directly as the game's core (`games/lunox`) rather than as an external/downloadable mod.

## What's in this repo
- Full Luanti engine source (C++/Irrlicht) — compiled into the `lunox` desktop binary.
- VoxeLibre gameplay framework, bundled as the default and only shipped game (`games/lunox`).
- `games/lunox/mods/lunox_core` — Lunox-specific core features layered on top of VoxeLibre,
  starting with the **Copper Spring Launchpad** (`lunox:spring_block`) and **Copper Coil**
  (`lunox:copper_coil`) crafting item.

## Downloads
Grab a build from the [latest release](https://github.com/OnyxNeol/Lunox/releases/tag/lunox-latest)
or the [Lunox Stable 0.0.1](https://github.com/OnyxNeol/Lunox/releases/tag/Lunox-Stable-0.0.1) tag:

| Platform | File | Notes |
| --- | --- | --- |
| Windows | `Lunox-windows-setup.exe` | Installer — Start Menu + Desktop shortcuts, uninstaller |
| Windows | `Lunox-windows-x64.zip` | Portable, no install needed |
| macOS | `Lunox-macos.dmg` | Drag `Lunox.app` to Applications. Not notarized — right-click > Open the first time. |
| macOS | `Lunox-macos.zip` | Portable `.app` bundle |
| Linux | `Lunox-x86_64.AppImage` | `chmod +x` then run directly, no install needed |
| Linux | `Lunox-linux-x64.zip` | Portable build |

Lunox supports both singleplayer and multiplayer (host a game or connect to a server from
the same executable).

## Building
Desktop builds (Linux, Windows, macOS) are produced automatically by
`.github/workflows/lunox-desktop-build.yml` on every push to `main`, or on demand via
"Run workflow". Finished builds are uploaded as workflow artifacts and published to the
`lunox-latest` GitHub Release.

## Licensing
This project vendors the Luanti engine (LGPL-2.1) and VoxeLibre (GPL-3.0-and-later) —
see their respective `LICENSE.txt` files. Lunox-specific additions in
`games/lunox/mods/lunox_core` are provided under the same terms as the surrounding game code.
