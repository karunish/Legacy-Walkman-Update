#!/usr/bin/env python3
"""Patch an apktool-decoded SemcMusic 8.4.A.3.1 tree.

usage: patch.py <decoded_dir>

What it does (see README for the full list):
  * removes the Sony shared user id
  * fixes two resources that the newer aapt2 refuses to rebuild
  * replaces a private-API bitmap helper that crashes on Android 7
  * adds the PitchTempo module + stand-ins for Sony-only libraries (overlay/)
  * inserts the hook calls into the player, app class and Now Playing screen
Every edit must match exactly once, otherwise the script stops, so a wrong
APK version fails loudly instead of producing a broken build.
"""
import shutil
import struct
import sys
import zlib
from pathlib import Path

OVERLAY = Path(__file__).resolve().parent.parent / "overlay"
MUSIC = "smali/com/sonyericsson/music/"
PT = "Lcom/sonyericsson/music/nightcore/PitchTempo;"


def die(msg):
    sys.exit("patch.py: " + msg)


def read(p):
    return p.read_text(encoding="utf-8")


def write(p, s):
    p.write_text(s, encoding="utf-8")


def need(p):
    if not p.exists():
        die("missing %s - is this really SemcMusic 8.4.A.3.1?" % p)
    return p


def replace_once(path, old, new, what, optional=False):
    s = read(need(path))
    n = s.count(old)
    if n == 0 and optional:
        print("  --  %s (not present, skipped)" % what)
        return
    if n != 1:
        die("%s: expected exactly 1 match in %s, found %d. "
            "Is this really SemcMusic 8.4.A.3.1?" % (what, path.name, n))
    write(path, s.replace(old, new))
    print("  ok  %s" % what)


def tiny_png():
    def chunk(t, d):
        c = struct.pack(">I", len(d)) + t + d
        return c + struct.pack(">I", zlib.crc32(t + d) & 0xFFFFFFFF)
    return (b"\x89PNG\r\n\x1a\n"
            + chunk(b"IHDR", struct.pack(">IIBBBBB", 1, 1, 8, 6, 0, 0, 0))
            + chunk(b"IDAT", zlib.compress(b"\x00\x00\x00\x00\x00"))
            + chunk(b"IEND", b""))


CREATE_BITMAP_SIG = (".method private static createBitmap(Landroid/util/DisplayMetrics;"
                     "IILandroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;")
CREATE_BITMAP_NEW = CREATE_BITMAP_SIG + """
    .locals 2

    if-lez p1, :cond_0

    if-gtz p2, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "width and height must be > 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    invoke-static {p0, p1, p2, p3}, Landroid/graphics/Bitmap;->createBitmap(Landroid/util/DisplayMetrics;IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0, p4}, Landroid/graphics/Bitmap;->setHasAlpha(Z)V

    return-object v0
.end method"""


def main():
    if len(sys.argv) != 2:
        die("usage: patch.py <decoded_dir>")
    root = Path(sys.argv[1])
    if not (root / "AndroidManifest.xml").exists():
        die("%s does not look like an apktool output directory" % root)

    print("[1/4] manifest and resources")
    mf = root / "AndroidManifest.xml"
    replace_once(mf, ' android:sharedUserId="com.sonyericsson.music"', "",
                 "remove sharedUserId")
    replace_once(mf, ' android:sharedUserLabel="@string/music_app_name_walkman_txt"', "",
                 "remove sharedUserLabel", optional=True)

    png = need(root / "res/drawable-land-hdpi-v4/widget_preview.png")
    if png.read_bytes()[:8] != b"\x89PNG\r\n\x1a\n":
        png.write_bytes(tiny_png())
        print("  ok  replace invalid widget_preview.png")
    replace_once(root / "res/values/styles.xml",
                 '<item name="android:typeface">199803</item>',
                 '<item name="android:typeface">sans</item>',
                 "replace Sony-only typeface value")

    print("[2/4] private bitmap API -> public API")
    cx = need(root / MUSIC / "common/cx.smali")
    s = read(cx)
    a = s.find(CREATE_BITMAP_SIG)
    if a < 0:
        die("createBitmap helper not found in cx.smali")
    b = s.find(".end method", a) + len(".end method")
    write(cx, s[:a] + CREATE_BITMAP_NEW + s[b:])
    print("  ok  cx.createBitmap")

    print("[3/4] hooks")
    ag = root / MUSIC / "localplayer/ag.smali"
    replace_once(ag,
                 "    invoke-super {p0}, Landroid/media/MediaPlayer;->start()V\n",
                 "    invoke-super {p0}, Landroid/media/MediaPlayer;->start()V\n\n"
                 "    invoke-static {p0}, %s->onStarted(Landroid/media/MediaPlayer;)V\n" % PT,
                 "player start() hook")
    replace_once(ag,
                 ".method public setNextMediaPlayer(Landroid/media/MediaPlayer;)V\n"
                 "    .locals 2\n\n    .prologue\n",
                 ".method public setNextMediaPlayer(Landroid/media/MediaPlayer;)V\n"
                 "    .locals 2\n\n    .prologue\n"
                 "    invoke-static {p1}, %s->onNext(Landroid/media/MediaPlayer;)V\n\n" % PT,
                 "gapless next-player hook")
    replace_once(root / MUSIC / "MusicApplication.smali",
                 "    invoke-super {p0}, Landroid/app/Application;->onCreate()V\n",
                 "    invoke-super {p0}, Landroid/app/Application;->onCreate()V\n\n"
                 "    invoke-static {p0}, %s->init(Landroid/content/Context;)V\n" % PT,
                 "load saved settings at app start")

    pf = root / MUSIC / "PlayerFragment.smali"
    replace_once(pf,
                 "    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V\n\n"
                 "    .line 2035\n    return-void",
                 "    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V\n\n"
                 "    invoke-static {p1}, %s->addMenu(Landroid/view/Menu;)V\n\n"
                 "    .line 2035\n    return-void" % PT,
                 "Now Playing menu entry + top-bar icon")
    replace_once(pf,
                 ".method public onOptionsItemSelected(Landroid/view/MenuItem;)Z\n"
                 "    .locals 5\n\n    .prologue\n",
                 ".method public onOptionsItemSelected(Landroid/view/MenuItem;)Z\n"
                 "    .locals 5\n\n    .prologue\n"
                 "    invoke-virtual {p0}, Lcom/sonyericsson/music/PlayerFragment;->getActivity()"
                 "Landroid/support/v4/app/FragmentActivity;\n\n    move-result-object v0\n\n"
                 "    invoke-static {v0, p1}, %s->onMenu(Landroid/app/Activity;Landroid/view/MenuItem;)Z\n\n"
                 "    move-result v0\n\n    if-eqz v0, :pt_continue\n\n    return v0\n\n    :pt_continue\n" % PT,
                 "menu click handler")
    replace_once(pf,
                 "    .line 495\n    :cond_4\n"
                 "    iget-object v0, p0, Lcom/sonyericsson/music/PlayerFragment;->A:Landroid/view/View;\n\n"
                 "    return-object v0\n.end method",
                 "    .line 495\n    :cond_4\n"
                 "    iget-object v0, p0, Lcom/sonyericsson/music/PlayerFragment;->A:Landroid/view/View;\n\n"
                 "    invoke-static {v0}, %s->attach(Landroid/view/View;)V\n\n"
                 "    return-object v0\n.end method" % PT,
                 "action-row button")

    print("[4/4] add PitchTempo + Sony-library stand-ins")
    shutil.copytree(OVERLAY / "smali", root / "smali", dirs_exist_ok=True)
    print("  ok  copied overlay/smali")
    print("done")


if __name__ == "__main__":
    main()
