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

## Building
Desktop builds (Linux, Windows, macOS) are produced automatically by
`.github/workflows/lunox-desktop-build.yml` on every push to `main`, or on demand via
"Run workflow". Finished builds are uploaded as workflow artifacts and published to the
`lunox-latest` GitHub Release.

## Licensing
This project vendors the Luanti engine (LGPL-2.1) and VoxeLibre (GPL-3.0-and-later) —
see their respective `LICENSE.txt` files. Lunox-specific additions in
`games/lunox/mods/lunox_core` are provided under the same terms as the surrounding game code.
