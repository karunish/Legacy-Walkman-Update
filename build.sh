#!/usr/bin/env bash
# Build a pitch/tempo-enabled SemcMusic APK from YOUR OWN copy of the original.
#   ./build.sh /path/to/SemcMusic.apk
# Optional signing with your own key:
#   KEYSTORE=my.jks KS_ALIAS=alias KS_PASS=secret ./build.sh SemcMusic.apk
set -euo pipefail

APKTOOL_VERSION=2.10.0
APKTOOL_SHA256=c0350abbab5314248dfe2ee0c907def4edd14f6faef1f5d372d3d4abd28f0431
SIGNER_VERSION=1.3.0
SIGNER_SHA256=e1299fd6fcf4da527dd53735b56127e8ea922a321128123b9c32d619bba1d835
EXPECTED_APK_SHA256=411375df92c43e589df2ac081024bda4474aaabb18c625e7c6ddd57330cd7bbc

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
tools="$here/tools"; work="$here/work"; out="$here/out"

die() { echo "build.sh: $*" >&2; exit 1; }

sha256() {
  if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
  else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

fetch() { # url dest expected_sha256
  if [[ ! -f "$2" ]]; then
    echo "Downloading $(basename "$2") ..."
    curl -fL --retry 3 -o "$2" "$1" || die "download failed: $1"
  fi
  [[ "$(sha256 "$2")" == "$3" ]] || die "checksum mismatch for $2 (delete it and retry)"
}

[[ $# -eq 1 && -f "$1" ]] || die "usage: ./build.sh /path/to/SemcMusic.apk"
apk_in="$1"
for c in java python3 curl; do command -v "$c" >/dev/null 2>&1 || die "'$c' is required"; done

if [[ "$(sha256 "$apk_in")" != "$EXPECTED_APK_SHA256" ]]; then
  echo "WARNING: this APK is not the exact file this project was tested with"
  echo "         (Sony Music / Walkman 8.4.A.3.1). Patching will stop with an"
  echo "         error if it is a different version."
fi

mkdir -p "$tools" "$work" "$out"
fetch "https://github.com/iBotPeaches/Apktool/releases/download/v${APKTOOL_VERSION}/apktool_${APKTOOL_VERSION}.jar" \
      "$tools/apktool.jar" "$APKTOOL_SHA256"
fetch "https://github.com/patrickfav/uber-apk-signer/releases/download/v${SIGNER_VERSION}/uber-apk-signer-${SIGNER_VERSION}.jar" \
      "$tools/uber-apk-signer.jar" "$SIGNER_SHA256"

echo "==> Decoding"
rm -rf "$work/decoded" "$work/unsigned.apk" "$work/signed"
java -jar "$tools/apktool.jar" d -f -o "$work/decoded" "$apk_in" >"$work/apktool-decode.log" 2>&1 \
  || { tail -20 "$work/apktool-decode.log"; die "decode failed"; }

echo "==> Patching"
python3 "$here/patch/patch.py" "$work/decoded"

echo "==> Building"
java -jar "$tools/apktool.jar" b "$work/decoded" -o "$work/unsigned.apk" >"$work/apktool-build.log" 2>&1 \
  || { tail -20 "$work/apktool-build.log"; die "build failed"; }

echo "==> Aligning and signing"
sign_args=(-a "$work/unsigned.apk" -o "$work/signed" --allowResign)
if [[ -n "${KEYSTORE:-}" ]]; then
  sign_args+=(--ks "$KEYSTORE" --ksAlias "${KS_ALIAS:?set KS_ALIAS}" --ksPass "${KS_PASS:?set KS_PASS}" \
              --ksKeyPass "${KS_KEY_PASS:-$KS_PASS}")
fi
java -jar "$tools/uber-apk-signer.jar" "${sign_args[@]}" >"$work/sign.log" 2>&1 \
  || { tail -20 "$work/sign.log"; die "signing failed"; }

result="$(ls "$work"/signed/*.apk | head -n1)"
cp "$result" "$out/SemcMusic-pitchtempo.apk"
echo
echo "Done: $out/SemcMusic-pitchtempo.apk"
echo "Install:  adb install -r $out/SemcMusic-pitchtempo.apk"
echo "(uninstall the original first if it is installed - the signature differs)"
