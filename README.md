# Pitch & Tempo for the Sony Music (Walkman) app

Adds pitch and tempo control to the Sony Music (Walkman) app and makes it
run on non-Sony Android 7.1.2 ROMs such as OmniROM.

Open Now Playing, tap the sliders icon in the top bar, and pick **Slowed**,
**Nightcore**, or set tempo and pitch yourself. It applies live while the song plays.

> **This repository contains no Sony code.** The Sony Music app is Sony's
> proprietary software and cannot be redistributed here. You supply your own copy
> of the APK, and the scripts patch it locally on your machine. Please do not
> upload patched APKs to this repository or its releases.
> This project is not affiliated with or endorsed by Sony.

## Features

- **Tempo** and **pitch** from 0.5x to 2x, with semitone readout
- **Link tempo & pitch** (on by default) for the classic nightcore / slowed sound; untick to change either one alone
- Presets: **Normal**, **Slowed** (0.85x), **Sped up** (1.25x)
- Applies live, carries over to the next track, remembered between sessions
- Where to find it on the Now Playing screen:
  - sliders icon in the top action bar (turns amber when active)
  - **Pitch & tempo** entry in the overflow menu
  - a button in the action row (shown after you tap the album art); **long-press it** for instant nightcore on/off
- Fixes that let the app run on AOSP-based Android 7.1.2 without Sony firmware

## Requirements

- Linux, macOS, or Windows with WSL
- Java 8+ (11+ recommended), Python 3.8+, `curl`
- **Your own copy of the original app**
  - package `com.sonyericsson.music`, version **8.4.A.3.1** (versionCode 17304577)
  - SHA-256 of the tested file: `411375df92c43e589df2ac081024bda4474aaabb18c625e7c6ddd57330cd7bbc`
  - Other versions will most likely fail to patch, because the hook points are obfuscated class names. The script stops with an error rather than producing a broken build.

## Build

```bash
git clone https://github.com/karunish/Legacy-Walkman-Update.git
cd semc-music-pitch-tempo
./build.sh /path/to/SemcMusic.apk
```

This downloads [Apktool](https://github.com/iBotPeaches/Apktool) 2.10.0 and
[uber-apk-signer](https://github.com/patrickfav/uber-apk-signer) 1.3.0 into `tools/`
(checksum-verified), decodes your APK, applies the patch, rebuilds, aligns and signs it.
The result is `out/SemcMusic-pitchtempo.apk`.

The APK is signed with a debug key by default. To use your own key:

```bash
KEYSTORE=my.jks KS_ALIAS=myalias KS_PASS=secret ./build.sh SemcMusic.apk
```

## Install

```bash
adb install -r out/SemcMusic-pitchtempo.apk
```

If the original app is already installed it is signed with a different key, so
uninstall it first (this clears the app's data).

## Compatibility

| | |
|---|---|
| Tested | Xperia M2 (D2305) running Android 7.1.2 (OmniROM), 32-bit ARM |
| Pitch/tempo needs | Android 6.0+ (uses `MediaPlayer.setPlaybackParams`); on older versions the control does nothing |
| **Not supported yet** | **Android 15+**: the app targets API 19, which those versions refuse to install, and it ships 32-bit-only native libraries that 64-bit-only phones cannot run |

Disabled because they depend on Sony firmware or servers: ClearAudio+, DSEE HX,
illumination, Update Center, and Sony's online services. 


## How pitch & tempo works

`PitchTempo` calls `MediaPlayer.setPlaybackParams()` with a speed and a pitch.

- It applies the values right after the app starts a player, and re-checks every 250 ms
  while something is playing, which also catches gapless track changes and slider moves.
- It only sets params on a player that is **currently playing**. On Android,
  setting a non-zero speed on a paused or prepared player starts it.
- Settings are stored in `SharedPreferences` (`pitch_tempo`).

## Known limitations

- At a gapless track change the new track may play at the old speed for about 250 ms.
- If a device's audio path can't do a requested speed/pitch, a toast says so.
- Untested on devices other than the one above.

>Note: It isn't dependent on proprietary sony firmware, this was only made to restore the walkman feel to my D2305 running a non-stock ROM

## Troubleshooting

```bash
adb logcat -b crash
```

Open an issue with that output, your Android version and device.


## Roadmap

- Android 15/16 support (raise target SDK, add runtime permission prompts, replace the 32-bit image libraries with standard Android APIs)

## License

MIT for the code in this repository (see `LICENSE`). The Sony Music app and its
trademarks remain the property of Sony and are not part of this project.
