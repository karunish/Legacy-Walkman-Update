# Changelog

## v4
- Pitch & tempo icon in the Now Playing top action bar (turns amber when active).

## v3
- Pitch & tempo control: tempo and pitch 0.5x-2x, link toggle, Normal / Slowed /
  Nightcore presets, live updates, saved between sessions, long-press for
  instant nightcore on/off, overflow-menu entry.

## v2
- Fixed a crash on Android 7.1.2 when the navigation drawer opened (the app read
  a hidden `Bitmap$Config.nativeInt` field; now uses the public Bitmap API).

## v1
- Runs on non-Sony Android 7.1.2: removed the Sony shared user id, added no-op
  stand-ins for Sony-only libraries, fixed two resources that newer aapt2 rejects.
