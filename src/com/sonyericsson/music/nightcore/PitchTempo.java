package com.sonyericsson.music.nightcore;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.media.MediaPlayer;
import android.media.PlaybackParams;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Locale;

/** Pitch / tempo ("nightcore" / "slowed") control for the music player. */
public final class PitchTempo {
    private static final String PREFS = "pitch_tempo";
    private static final String K_SPEED = "speed";
    private static final String K_PITCH = "pitch";
    private static final String K_LINK = "linked";
    private static final String TAG = "pitch_tempo_button";
    public static final int MENU_ID = 0x70697463;

    private static final float MIN = 0.5f;
    private static final float MAX = 2.0f;
    private static final float NIGHTCORE = 1.25f;
    private static final float SLOWED = 0.85f;

    private static volatile float sSpeed = 1f;
    private static volatile float sPitch = 1f;
    private static volatile boolean sLinked = true;
    private static Context sCtx;
    private static boolean sWarned;
    private static boolean sPolling;
    private static WeakReference<ImageButton> sButton;
    private static WeakReference<IconDrawable> sMenuIcon;

    private static final ArrayList<WeakReference<MediaPlayer>> sPlayers =
            new ArrayList<WeakReference<MediaPlayer>>();
    private static final Handler sMain = new Handler(Looper.getMainLooper());

    private PitchTempo() {}

    // ------------------------------------------------------------------ state

    public static void init(Context c) {
        try {
            Context app = c.getApplicationContext();
            sCtx = app != null ? app : c;
            SharedPreferences sp = sCtx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            sSpeed = clamp(sp.getFloat(K_SPEED, 1f));
            sPitch = clamp(sp.getFloat(K_PITCH, 1f));
            sLinked = sp.getBoolean(K_LINK, true);
        } catch (Throwable t) {
            // keep defaults
        }
    }

    private static float clamp(float v) {
        if (v != v) return 1f;
        return v < MIN ? MIN : (v > MAX ? MAX : v);
    }

    private static boolean isDefault() {
        return Math.abs(sSpeed - 1f) < 0.005f && Math.abs(sPitch - 1f) < 0.005f;
    }

    private static void save() {
        try {
            if (sCtx == null) return;
            sCtx.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                    .putFloat(K_SPEED, sSpeed).putFloat(K_PITCH, sPitch)
                    .putBoolean(K_LINK, sLinked).apply();
        } catch (Throwable t) {
            // ignore
        }
    }

    static void setValues(float speed, float pitch) {
        sSpeed = clamp(speed);
        sPitch = clamp(pitch);
        save();
        applyAll();
        refreshButton();
    }

    // ------------------------------------------------- playback hooks (smali)

    /** Called right after MediaPlayer.start() in the app's player. */
    public static void onStarted(MediaPlayer mp) {
        try {
            register(mp);
            applyIfPlaying(mp);
            ensurePoll();
        } catch (Throwable t) {
            // never break playback
        }
    }

    /** Called when the app queues the next (gapless) player. Must not touch params here. */
    public static void onNext(MediaPlayer mp) {
        try {
            register(mp);
            ensurePoll();
        } catch (Throwable t) {
            // ignore
        }
    }

    private static void register(MediaPlayer mp) {
        if (mp == null) return;
        synchronized (sPlayers) {
            for (int i = sPlayers.size() - 1; i >= 0; i--) {
                MediaPlayer p = sPlayers.get(i).get();
                if (p == null) {
                    sPlayers.remove(i);
                } else if (p == mp) {
                    return;
                }
            }
            sPlayers.add(new WeakReference<MediaPlayer>(mp));
            while (sPlayers.size() > 8) sPlayers.remove(0);
        }
    }

    /** Applies the wanted speed/pitch to a player that is currently playing. Returns false if player is dead. */
    private static boolean applyIfPlaying(MediaPlayer mp) {
        if (Build.VERSION.SDK_INT < 23) return true;
        try {
            if (!mp.isPlaying()) return true; // setting params on a paused player would resume it
            PlaybackParams cur = mp.getPlaybackParams();
            boolean same = false;
            try {
                same = Math.abs(cur.getSpeed() - sSpeed) < 0.002f
                        && Math.abs(cur.getPitch() - sPitch) < 0.002f;
            } catch (IllegalStateException e) {
                same = false;
            }
            if (same) return true;
            PlaybackParams np = new PlaybackParams();
            np.setSpeed(sSpeed);
            np.setPitch(sPitch);
            np.setAudioFallbackMode(PlaybackParams.AUDIO_FALLBACK_MODE_FAIL);
            mp.setPlaybackParams(np);
            return true;
        } catch (IllegalStateException e) {
            return false;
        } catch (IllegalArgumentException e) {
            warnOnce();
            return true;
        } catch (Throwable t) {
            return true;
        }
    }

    private static void applyAll() {
        synchronized (sPlayers) {
            for (int i = sPlayers.size() - 1; i >= 0; i--) {
                MediaPlayer p = sPlayers.get(i).get();
                if (p == null || !applyIfPlaying(p)) sPlayers.remove(i);
            }
        }
    }

    private static void warnOnce() {
        if (sWarned) return;
        sWarned = true;
        sMain.post(new Runnable() {
            public void run() {
                try {
                    if (sCtx != null) {
                        Toast.makeText(sCtx, "This speed/pitch isn't supported on this device",
                                Toast.LENGTH_LONG).show();
                    }
                } catch (Throwable t) {
                    // ignore
                }
            }
        });
    }

    // Keeps new tracks (gapless transitions, resumes) in sync with the chosen values.
    private static final Runnable sTick = new Runnable() {
        public void run() {
            boolean any = false;
            synchronized (sPlayers) {
                for (int i = sPlayers.size() - 1; i >= 0; i--) {
                    MediaPlayer p = sPlayers.get(i).get();
                    if (p == null || !applyIfPlaying(p)) {
                        sPlayers.remove(i);
                    } else {
                        any = true;
                    }
                }
            }
            if (any) {
                sMain.postDelayed(this, 250);
            } else {
                sPolling = false;
            }
        }
    };

    private static void ensurePoll() {
        if (sPolling) return;
        sPolling = true;
        sMain.postDelayed(sTick, 250);
    }

    // --------------------------------------------------------------------- UI

    /** Adds the pitch/tempo button to the Now Playing action row. */
    public static void attach(final View root) {
        try {
            tryAttach(root, 0);
        } catch (Throwable t) {
            // ignore
        }
    }

    private static void tryAttach(final View root, final int attempt) {
        Context ctx = root.getContext();
        int id = ctx.getResources().getIdentifier("player_like_button", "id", ctx.getPackageName());
        View anchor = id != 0 ? root.findViewById(id) : null;
        if (anchor != null && anchor.getParent() instanceof LinearLayout) {
            LinearLayout row = (LinearLayout) anchor.getParent();
            if (row.findViewWithTag(TAG) == null) {
                row.addView(makeButton(ctx), 0);
            }
            return;
        }
        if (attempt < 40) {
            root.postDelayed(new Runnable() {
                public void run() {
                    try {
                        tryAttach(root, attempt + 1);
                    } catch (Throwable t) {
                        // ignore
                    }
                }
            }, 250);
        }
    }

    private static int dp(Context c, float v) {
        return (int) (v * c.getResources().getDisplayMetrics().density + 0.5f);
    }

    private static View makeButton(final Context ctx) {
        ImageButton b = new ImageButton(ctx);
        b.setTag(TAG);
        int bg = ctx.getResources().getIdentifier("action_button_highlight", "drawable", ctx.getPackageName());
        if (bg != 0) {
            b.setBackgroundResource(bg);
        } else {
            b.setBackgroundColor(0);
        }
        IconDrawable icon = new IconDrawable(dp(ctx, 24));
        icon.setActive(!isDefault());
        b.setImageDrawable(icon);
        b.setScaleType(ImageView.ScaleType.CENTER);
        int pad = dp(ctx, 12);
        b.setPadding(pad, pad, pad, pad);
        b.setContentDescription("Pitch and tempo");
        b.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                showDialog(v.getContext());
            }
        });
        // Long-press = instant nightcore on/off.
        b.setOnLongClickListener(new View.OnLongClickListener() {
            public boolean onLongClick(View v) {
                if (isDefault()) {
                    sLinked = true;
                    setValues(NIGHTCORE, NIGHTCORE);
                    toast(v.getContext(), "Nightcore  " + fmtSpeed(NIGHTCORE));
                } else {
                    setValues(1f, 1f);
                    toast(v.getContext(), "Normal speed");
                }
                return true;
            }
        });
        sButton = new WeakReference<ImageButton>(b);
        return b;
    }

    private static void refreshButton() {
        try {
            IconDrawable mi = sMenuIcon != null ? sMenuIcon.get() : null;
            if (mi != null) mi.setActive(!isDefault());
        } catch (Throwable t) {
            // ignore
        }
        try {
            ImageButton b = sButton != null ? sButton.get() : null;
            if (b != null && b.getDrawable() instanceof IconDrawable) {
                ((IconDrawable) b.getDrawable()).setActive(!isDefault());
            }
        } catch (Throwable t) {
            // ignore
        }
    }

    private static void toast(Context c, String s) {
        try {
            Toast.makeText(c, s, Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
            // ignore
        }
    }

    // Overflow-menu fallback entry -------------------------------------------

    public static void addMenu(Menu menu) {
        try {
            if (menu == null) return;
            MenuItem it = menu.findItem(MENU_ID);
            if (it == null) {
                it = menu.add(Menu.NONE, MENU_ID, Menu.NONE, "Pitch & tempo");
            }
            float density = android.content.res.Resources.getSystem().getDisplayMetrics().density;
            IconDrawable icon = new IconDrawable((int) (24f * density + 0.5f));
            icon.setActive(!isDefault());
            sMenuIcon = new WeakReference<IconDrawable>(icon);
            it.setIcon(icon);
            it.setShowAsAction(MenuItem.SHOW_AS_ACTION_IF_ROOM);
        } catch (Throwable t) {
            // ignore
        }
    }

    public static boolean onMenu(Activity a, MenuItem item) {
        try {
            if (item != null && item.getItemId() == MENU_ID && a != null) {
                showDialog(a);
                return true;
            }
        } catch (Throwable t) {
            // ignore
        }
        return false;
    }

    // ----------------------------------------------------------------- dialog

    private static String fmtSpeed(float v) {
        return String.format(Locale.US, "%.2f\u00d7", v);
    }

    private static String fmtPitch(float v) {
        double st = 12.0 * Math.log(v) / Math.log(2.0);
        return String.format(Locale.US, "%.2f\u00d7  (%+.1f semitones)", v, st);
    }

    private static int toProgress(float v) {
        return Math.round((clamp(v) - MIN) * 100f);
    }

    private static float fromProgress(int p) {
        float v = MIN + p / 100f;
        if (Math.abs(v - 1f) < 0.02f) v = 1f; // snap to normal
        return v;
    }

    static void showDialog(final Context ctx) {
        final Dialog d = new Dialog(ctx, android.R.style.Theme_DeviceDefault_Dialog);
        d.setTitle("Pitch & tempo");

        int p16 = dp(ctx, 16);
        int p8 = dp(ctx, 8);
        LinearLayout root = new LinearLayout(ctx);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(p16, p8, p16, p16);

        // presets
        LinearLayout presets = new LinearLayout(ctx);
        presets.setOrientation(LinearLayout.HORIZONTAL);
        final Button bNormal = new Button(ctx);
        bNormal.setText("Normal");
        final Button bSlowed = new Button(ctx);
        bSlowed.setText("Slowed");
        final Button bNight = new Button(ctx);
        bNight.setText("Sped up");
        LinearLayout.LayoutParams plp = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        presets.addView(bNormal, plp);
        presets.addView(bSlowed, plp);
        presets.addView(bNight, plp);
        root.addView(presets);

        // tempo
        final TextView tempoLbl = new TextView(ctx);
        tempoLbl.setTextSize(16f);
        tempoLbl.setPadding(0, p16, 0, 0);
        final SeekBar tempoBar = new SeekBar(ctx);
        tempoBar.setMax(Math.round((MAX - MIN) * 100f));
        root.addView(tempoLbl);
        root.addView(tempoBar);

        // pitch
        final TextView pitchLbl = new TextView(ctx);
        pitchLbl.setTextSize(16f);
        pitchLbl.setPadding(0, p16, 0, 0);
        final SeekBar pitchBar = new SeekBar(ctx);
        pitchBar.setMax(Math.round((MAX - MIN) * 100f));
        root.addView(pitchLbl);
        root.addView(pitchBar);

        final CheckBox link = new CheckBox(ctx);
        link.setText("Link tempo & pitch (nightcore / slowed)");
        link.setChecked(sLinked);
        link.setPadding(0, p8, 0, 0);
        root.addView(link);

        TextView hint = new TextView(ctx);
        hint.setTextSize(12f);
        hint.setAlpha(0.7f);
        hint.setText("Linked: faster = higher pitch, slower = lower pitch. "
                + "Untick to change tempo or pitch on its own. "
                + "Tip: long-press the button for instant nightcore on/off.");
        root.addView(hint);

        Button done = new Button(ctx);
        done.setText("Done");
        LinearLayout.LayoutParams dlp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        dlp.gravity = Gravity.RIGHT;
        dlp.topMargin = p8;
        root.addView(done, dlp);

        final Runnable refresh = new Runnable() {
            public void run() {
                tempoLbl.setText("Tempo   " + fmtSpeed(sSpeed));
                pitchLbl.setText("Pitch   " + fmtPitch(sPitch));
                tempoBar.setProgress(toProgress(sSpeed));
                pitchBar.setProgress(toProgress(sPitch));
            }
        };
        refresh.run();

        tempoBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar sb, int progress, boolean fromUser) {
                if (!fromUser) return;
                float v = fromProgress(progress);
                setValues(v, sLinked ? v : sPitch);
                tempoLbl.setText("Tempo   " + fmtSpeed(sSpeed));
                pitchLbl.setText("Pitch   " + fmtPitch(sPitch));
                if (sLinked) pitchBar.setProgress(toProgress(sPitch));
            }
            public void onStartTrackingTouch(SeekBar sb) {}
            public void onStopTrackingTouch(SeekBar sb) {}
        });
        pitchBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            public void onProgressChanged(SeekBar sb, int progress, boolean fromUser) {
                if (!fromUser) return;
                float v = fromProgress(progress);
                setValues(sLinked ? v : sSpeed, v);
                tempoLbl.setText("Tempo   " + fmtSpeed(sSpeed));
                pitchLbl.setText("Pitch   " + fmtPitch(sPitch));
                if (sLinked) tempoBar.setProgress(toProgress(sSpeed));
            }
            public void onStartTrackingTouch(SeekBar sb) {}
            public void onStopTrackingTouch(SeekBar sb) {}
        });
        link.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            public void onCheckedChanged(CompoundButton cb, boolean checked) {
                sLinked = checked;
                if (checked) setValues(sSpeed, sSpeed); else save();
                refresh.run();
            }
        });
        bNormal.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                setValues(1f, 1f);
                refresh.run();
            }
        });
        bSlowed.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                sLinked = true;
                link.setChecked(true);
                setValues(SLOWED, SLOWED);
                refresh.run();
            }
        });
        bNight.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                sLinked = true;
                link.setChecked(true);
                setValues(NIGHTCORE, NIGHTCORE);
                refresh.run();
            }
        });
        done.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                d.dismiss();
            }
        });

        d.setContentView(root);
        d.show();
    }

    // ------------------------------------------------------------------- icon

    /** Three little sliders; turns amber when a non-default setting is active. */
    static final class IconDrawable extends Drawable {
        private final Paint line = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint knob = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int size;
        private boolean active;

        IconDrawable(int size) {
            this.size = size;
            line.setStyle(Paint.Style.STROKE);
            line.setStrokeCap(Paint.Cap.ROUND);
            knob.setStyle(Paint.Style.FILL);
        }

        void setActive(boolean a) {
            if (active != a) {
                active = a;
                invalidateSelf();
            }
        }

        @Override
        public void draw(Canvas c) {
            Rect r = getBounds();
            float w = r.width();
            float h = r.height();
            int col = active ? 0xFFFFB300 : 0xDEFFFFFF;
            line.setColor(col);
            knob.setColor(col);
            line.setStrokeWidth(Math.max(2f, w / 12f));
            float[] ys = {0.2f, 0.5f, 0.8f};
            float[] ks = {0.7f, 0.3f, 0.6f};
            for (int i = 0; i < 3; i++) {
                float y = r.top + h * ys[i];
                c.drawLine(r.left + w * 0.08f, y, r.right - w * 0.08f, y, line);
                c.drawCircle(r.left + w * ks[i], y, w * 0.12f, knob);
            }
        }

        @Override public void setAlpha(int alpha) {}
        @Override public void setColorFilter(ColorFilter cf) {}
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        @Override public int getIntrinsicWidth() { return size; }
        @Override public int getIntrinsicHeight() { return size; }
    }
}
