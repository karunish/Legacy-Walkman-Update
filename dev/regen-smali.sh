#!/usr/bin/env bash
# Developer helper: regenerate overlay/smali/.../nightcore from src/ (PitchTempo.java).
# Only needed if you edit the Java. Normal users do NOT need this.
#
# Prerequisites (Debian/Ubuntu): sudo apt install openjdk-21-jdk-headless dalvik-exchange \
#                                  libandroid-23-java smali
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ANDROID_JAR="${ANDROID_JAR:-/usr/lib/android-sdk/platforms/android-23/android.jar}"
b="$here/dev/build"; rm -rf "$b"; mkdir -p "$b/classes"

javac -encoding UTF-8 -source 8 -target 8 -Xlint:-options -bootclasspath "$ANDROID_JAR" \
      -d "$b/classes" "$here/src/com/sonyericsson/music/nightcore/PitchTempo.java"
dalvik-exchange --dex --min-sdk-version=16 --output="$b/classes.dex" "$b/classes"
baksmali d "$b/classes.dex" -o "$b/smali"

dest="$here/overlay/smali/com/sonyericsson/music"
rm -rf "$dest/nightcore"
cp -r "$b/smali/com/sonyericsson/music/nightcore" "$dest/"
echo "overlay smali regenerated"
