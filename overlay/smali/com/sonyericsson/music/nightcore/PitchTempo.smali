.class public final Lcom/sonyericsson/music/nightcore/PitchTempo;
.super Ljava/lang/Object;
.source "PitchTempo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;
    }
.end annotation


# static fields
.field private static final K_LINK:Ljava/lang/String; = "linked"

.field private static final K_PITCH:Ljava/lang/String; = "pitch"

.field private static final K_SPEED:Ljava/lang/String; = "speed"

.field private static final MAX:F = 2.0f

.field public static final MENU_ID:I = 0x70697463

.field private static final MIN:F = 0.5f

.field private static final NIGHTCORE:F = 1.25f

.field private static final PREFS:Ljava/lang/String; = "pitch_tempo"

.field private static final SLOWED:F = 0.85f

.field private static final TAG:Ljava/lang/String; = "pitch_tempo_button"

.field private static sButton:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ImageButton;",
            ">;"
        }
    .end annotation
.end field

.field private static sCtx:Landroid/content/Context;

.field private static volatile sLinked:Z

.field private static final sMain:Landroid/os/Handler;

.field private static sMenuIcon:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sPitch:F

.field private static final sPlayers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/media/MediaPlayer;",
            ">;>;"
        }
    .end annotation
.end field

.field private static sPolling:Z

.field private static volatile sSpeed:F

.field private static final sTick:Ljava/lang/Runnable;

.field private static sWarned:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/high16 v0, 0x3f800000    # 1.0f

    .line 51
    sput v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sSpeed:F

    .line 52
    sput v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPitch:F

    .line 53
    const/4 v0, 0x1

    sput-boolean v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sLinked:Z

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    .line 62
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sMain:Landroid/os/Handler;

    .line 205
    new-instance v0, Lcom/sonyericsson/music/nightcore/PitchTempo$2;

    invoke-direct {v0}, Lcom/sonyericsson/music/nightcore/PitchTempo$2;-><init>()V

    sput-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sTick:Ljava/lang/Runnable;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/content/Context;
    .registers 1

    .prologue
    .line 38
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sCtx:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100()Ljava/util/ArrayList;
    .registers 1

    .prologue
    .line 38
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1000()F
    .registers 1

    .prologue
    .line 38
    sget v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sSpeed:F

    return v0
.end method

.method static synthetic access$1100()F
    .registers 1

    .prologue
    .line 38
    sget v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPitch:F

    return v0
.end method

.method static synthetic access$1200(F)Ljava/lang/String;
    .registers 2

    .prologue
    .line 38
    invoke-static {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->fmtPitch(F)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1300(F)I
    .registers 2

    .prologue
    .line 38
    invoke-static {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->toProgress(F)I

    move-result v0

    return v0
.end method

.method static synthetic access$1400(I)F
    .registers 2

    .prologue
    .line 38
    invoke-static {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->fromProgress(I)F

    move-result v0

    return v0
.end method

.method static synthetic access$1500()V
    .registers 0

    .prologue
    .line 38
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->save()V

    return-void
.end method

.method static synthetic access$200(Landroid/media/MediaPlayer;)Z
    .registers 2

    .prologue
    .line 38
    invoke-static {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->applyIfPlaying(Landroid/media/MediaPlayer;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300()Landroid/os/Handler;
    .registers 1

    .prologue
    .line 38
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sMain:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$402(Z)Z
    .registers 1

    .prologue
    .line 38
    sput-boolean p0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPolling:Z

    return p0
.end method

.method static synthetic access$500(Landroid/view/View;I)V
    .registers 2

    .prologue
    .line 38
    invoke-static {p0, p1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->tryAttach(Landroid/view/View;I)V

    return-void
.end method

.method static synthetic access$600()Z
    .registers 1

    .prologue
    .line 38
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->isDefault()Z

    move-result v0

    return v0
.end method

.method static synthetic access$700()Z
    .registers 1

    .prologue
    .line 38
    sget-boolean v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sLinked:Z

    return v0
.end method

.method static synthetic access$702(Z)Z
    .registers 1

    .prologue
    .line 38
    sput-boolean p0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sLinked:Z

    return p0
.end method

.method static synthetic access$800(F)Ljava/lang/String;
    .registers 2

    .prologue
    .line 38
    invoke-static {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->fmtSpeed(F)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Landroid/content/Context;Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 38
    invoke-static {p0, p1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static addMenu(Landroid/view/Menu;)V
    .registers 7

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 339
    if-nez p0, :cond_5

    .line 353
    :goto_4
    return-void

    .line 340
    :cond_5
    const v2, 0x70697463

    :try_start_8
    invoke-interface {p0, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 341
    if-nez v2, :cond_19

    .line 342
    const/4 v2, 0x0

    const v3, 0x70697463

    const/4 v4, 0x0

    const-string v5, "Pitch & tempo"

    invoke-interface {p0, v2, v3, v4, v5}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v2

    .line 344
    :cond_19
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    .line 345
    new-instance v4, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;

    const/high16 v5, 0x41c00000    # 24.0f

    mul-float/2addr v3, v5

    const/high16 v5, 0x3f000000    # 0.5f

    add-float/2addr v3, v5

    float-to-int v3, v3

    invoke-direct {v4, v3}, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;-><init>(I)V

    .line 346
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->isDefault()Z

    move-result v3

    if-nez v3, :cond_49

    :goto_35
    invoke-virtual {v4, v0}, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->setActive(Z)V

    .line 347
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sMenuIcon:Ljava/lang/ref/WeakReference;

    .line 348
    invoke-interface {v2, v4}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 349
    const/4 v0, 0x1

    invoke-interface {v2, v0}, Landroid/view/MenuItem;->setShowAsAction(I)V
    :try_end_46
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_46} :catch_47

    goto :goto_4

    .line 350
    :catch_47
    move-exception v0

    goto :goto_4

    :cond_49
    move v0, v1

    .line 346
    goto :goto_35
.end method

.method private static applyAll()V
    .registers 3

    .prologue
    .line 179
    sget-object v2, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    monitor-enter v2

    .line 180
    :try_start_3
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    move v1, v0

    :goto_c
    if-ltz v1, :cond_2d

    .line 181
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/MediaPlayer;

    .line 182
    if-eqz v0, :cond_24

    invoke-static {v0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->applyIfPlaying(Landroid/media/MediaPlayer;)Z

    move-result v0

    if-nez v0, :cond_29

    :cond_24
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 180
    :cond_29
    add-int/lit8 v0, v1, -0x1

    move v1, v0

    goto :goto_c

    .line 184
    :cond_2d
    monitor-exit v2

    .line 185
    return-void

    .line 184
    :catchall_2f
    move-exception v0

    monitor-exit v2
    :try_end_31
    .catchall {:try_start_3 .. :try_end_31} :catchall_2f

    throw v0
.end method

.method private static applyIfPlaying(Landroid/media/MediaPlayer;)Z
    .registers 7

    .prologue
    const v5, 0x3b03126f    # 0.002f

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 150
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-ge v0, v3, :cond_c

    .line 174
    :cond_b
    :goto_b
    return v1

    .line 152
    :cond_c
    :try_start_c
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 153
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getPlaybackParams()Landroid/media/PlaybackParams;
    :try_end_15
    .catch Ljava/lang/IllegalStateException; {:try_start_c .. :try_end_15} :catch_4e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_15} :catch_56
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_15} :catch_5b

    move-result-object v0

    .line 156
    :try_start_16
    invoke-virtual {v0}, Landroid/media/PlaybackParams;->getSpeed()F

    move-result v3

    sget v4, Lcom/sonyericsson/music/nightcore/PitchTempo;->sSpeed:F

    sub-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpg-float v3, v3, v5

    if-gez v3, :cond_51

    .line 157
    invoke-virtual {v0}, Landroid/media/PlaybackParams;->getPitch()F

    move-result v0

    sget v3, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPitch:F

    sub-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F
    :try_end_2f
    .catch Ljava/lang/IllegalStateException; {:try_start_16 .. :try_end_2f} :catch_53
    .catch Ljava/lang/IllegalArgumentException; {:try_start_16 .. :try_end_2f} :catch_56
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_2f} :catch_5b

    move-result v0

    cmpg-float v0, v0, v5

    if-gez v0, :cond_51

    move v0, v1

    .line 161
    :goto_35
    if-nez v0, :cond_b

    .line 162
    :try_start_37
    new-instance v0, Landroid/media/PlaybackParams;

    invoke-direct {v0}, Landroid/media/PlaybackParams;-><init>()V

    .line 163
    sget v3, Lcom/sonyericsson/music/nightcore/PitchTempo;->sSpeed:F

    invoke-virtual {v0, v3}, Landroid/media/PlaybackParams;->setSpeed(F)Landroid/media/PlaybackParams;

    .line 164
    sget v3, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPitch:F

    invoke-virtual {v0, v3}, Landroid/media/PlaybackParams;->setPitch(F)Landroid/media/PlaybackParams;

    .line 165
    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Landroid/media/PlaybackParams;->setAudioFallbackMode(I)Landroid/media/PlaybackParams;

    .line 166
    invoke-virtual {p0, v0}, Landroid/media/MediaPlayer;->setPlaybackParams(Landroid/media/PlaybackParams;)V
    :try_end_4d
    .catch Ljava/lang/IllegalStateException; {:try_start_37 .. :try_end_4d} :catch_4e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_37 .. :try_end_4d} :catch_56
    .catch Ljava/lang/Throwable; {:try_start_37 .. :try_end_4d} :catch_5b

    goto :goto_b

    .line 168
    :catch_4e
    move-exception v0

    move v1, v2

    .line 169
    goto :goto_b

    :cond_51
    move v0, v2

    .line 157
    goto :goto_35

    .line 158
    :catch_53
    move-exception v0

    move v0, v2

    .line 159
    goto :goto_35

    .line 170
    :catch_56
    move-exception v0

    .line 171
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->warnOnce()V

    goto :goto_b

    .line 173
    :catch_5b
    move-exception v0

    goto :goto_b
.end method

.method public static attach(Landroid/view/View;)V
    .registers 2

    .prologue
    .line 237
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0, v0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->tryAttach(Landroid/view/View;I)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_4} :catch_5

    .line 241
    :goto_4
    return-void

    .line 238
    :catch_5
    move-exception v0

    goto :goto_4
.end method

.method private static clamp(F)F
    .registers 4

    .prologue
    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v0, 0x3f000000    # 0.5f

    .line 82
    cmpl-float v2, p0, p0

    if-eqz v2, :cond_b

    const/high16 p0, 0x3f800000    # 1.0f

    .line 83
    :cond_a
    :goto_a
    return p0

    :cond_b
    cmpg-float v2, p0, v0

    if-gez v2, :cond_11

    move p0, v0

    goto :goto_a

    :cond_11
    cmpl-float v0, p0, v1

    if-lez v0, :cond_a

    move p0, v1

    goto :goto_a
.end method

.method private static dp(Landroid/content/Context;F)I
    .registers 4

    .prologue
    .line 268
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private static ensurePoll()V
    .registers 4

    .prologue
    .line 227
    sget-boolean v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPolling:Z

    if-eqz v0, :cond_5

    .line 230
    :goto_4
    return-void

    .line 228
    :cond_5
    const/4 v0, 0x1

    sput-boolean v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPolling:Z

    .line 229
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sMain:Landroid/os/Handler;

    sget-object v1, Lcom/sonyericsson/music/nightcore/PitchTempo;->sTick:Ljava/lang/Runnable;

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_4
.end method

.method private static fmtPitch(F)Ljava/lang/String;
    .registers 8

    .prologue
    .line 374
    const-wide/high16 v0, 0x4028000000000000L    # 12.0

    float-to-double v2, p0

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    mul-double/2addr v0, v2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    div-double/2addr v0, v2

    .line 375
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%.2f\u00d7  (%+.1f semitones)"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    aput-object v0, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static fmtSpeed(F)Ljava/lang/String;
    .registers 6

    .prologue
    .line 370
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%.2f\u00d7"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static fromProgress(I)F
    .registers 5

    .prologue
    const/high16 v0, 0x3f800000    # 1.0f

    .line 383
    const/high16 v1, 0x3f000000    # 0.5f

    int-to-float v2, p0

    const/high16 v3, 0x42c80000    # 100.0f

    div-float/2addr v2, v3

    add-float/2addr v1, v2

    .line 384
    sub-float v2, v1, v0

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const v3, 0x3ca3d70a    # 0.02f

    cmpg-float v2, v2, v3

    if-gez v2, :cond_17

    .line 385
    :goto_16
    return v0

    :cond_17
    move v0, v1

    goto :goto_16
.end method

.method public static init(Landroid/content/Context;)V
    .registers 4

    .prologue
    .line 70
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 71
    if-eqz v0, :cond_7

    move-object p0, v0

    :cond_7
    sput-object p0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sCtx:Landroid/content/Context;

    .line 72
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sCtx:Landroid/content/Context;

    const-string v1, "pitch_tempo"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 73
    const-string v1, "speed"

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v1

    invoke-static {v1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->clamp(F)F

    move-result v1

    sput v1, Lcom/sonyericsson/music/nightcore/PitchTempo;->sSpeed:F

    .line 74
    const-string v1, "pitch"

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v1

    invoke-static {v1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->clamp(F)F

    move-result v1

    sput v1, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPitch:F

    .line 75
    const-string v1, "linked"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sLinked:Z
    :try_end_37
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_37} :catch_38

    .line 79
    :goto_37
    return-void

    .line 76
    :catch_38
    move-exception v0

    goto :goto_37
.end method

.method private static isDefault()Z
    .registers 3

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    const v1, 0x3ba3d70a    # 0.005f

    .line 87
    sget v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sSpeed:F

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1d

    sget v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPitch:F

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1d

    const/4 v0, 0x1

    :goto_1c
    return v0

    :cond_1d
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method private static makeButton(Landroid/content/Context;)Landroid/view/View;
    .registers 7

    .prologue
    const/4 v0, 0x0

    .line 272
    new-instance v1, Landroid/widget/ImageButton;

    invoke-direct {v1, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 273
    const-string v2, "pitch_tempo_button"

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setTag(Ljava/lang/Object;)V

    .line 274
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "action_button_highlight"

    const-string v4, "drawable"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 275
    if-eqz v2, :cond_63

    .line 276
    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    .line 280
    :goto_20
    new-instance v2, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;

    const/high16 v3, 0x41c00000    # 24.0f

    invoke-static {p0, v3}, Lcom/sonyericsson/music/nightcore/PitchTempo;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-direct {v2, v3}, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;-><init>(I)V

    .line 281
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->isDefault()Z

    move-result v3

    if-nez v3, :cond_32

    const/4 v0, 0x1

    :cond_32
    invoke-virtual {v2, v0}, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->setActive(Z)V

    .line 282
    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 283
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 284
    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {p0, v0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->dp(Landroid/content/Context;F)I

    move-result v0

    .line 285
    invoke-virtual {v1, v0, v0, v0, v0}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 286
    const-string v0, "Pitch and tempo"

    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 287
    new-instance v0, Lcom/sonyericsson/music/nightcore/PitchTempo$4;

    invoke-direct {v0}, Lcom/sonyericsson/music/nightcore/PitchTempo$4;-><init>()V

    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 293
    new-instance v0, Lcom/sonyericsson/music/nightcore/PitchTempo$5;

    invoke-direct {v0}, Lcom/sonyericsson/music/nightcore/PitchTempo$5;-><init>()V

    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 306
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sButton:Ljava/lang/ref/WeakReference;

    .line 307
    return-object v1

    .line 278
    :cond_63
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setBackgroundColor(I)V

    goto :goto_20
.end method

.method public static onMenu(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 4

    .prologue
    .line 357
    if-eqz p1, :cond_13

    :try_start_2
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x70697463

    if-ne v0, v1, :cond_13

    if-eqz p0, :cond_13

    .line 358
    invoke-static {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->showDialog(Landroid/content/Context;)V
    :try_end_10
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_10} :catch_12

    .line 359
    const/4 v0, 0x1

    .line 364
    :goto_11
    return v0

    .line 361
    :catch_12
    move-exception v0

    .line 364
    :cond_13
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public static onNext(Landroid/media/MediaPlayer;)V
    .registers 2

    .prologue
    .line 125
    :try_start_0
    invoke-static {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->register(Landroid/media/MediaPlayer;)V

    .line 126
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->ensurePoll()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_6} :catch_7

    .line 130
    :goto_6
    return-void

    .line 127
    :catch_7
    move-exception v0

    goto :goto_6
.end method

.method public static onStarted(Landroid/media/MediaPlayer;)V
    .registers 2

    .prologue
    .line 114
    :try_start_0
    invoke-static {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->register(Landroid/media/MediaPlayer;)V

    .line 115
    invoke-static {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->applyIfPlaying(Landroid/media/MediaPlayer;)Z

    .line 116
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->ensurePoll()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_9} :catch_a

    .line 120
    :goto_9
    return-void

    .line 117
    :catch_a
    move-exception v0

    goto :goto_9
.end method

.method private static refreshButton()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 312
    :try_start_3
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sMenuIcon:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_42

    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sMenuIcon:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;

    move-object v4, v0

    .line 313
    :goto_10
    if-eqz v4, :cond_1c

    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->isDefault()Z

    move-result v0

    if-nez v0, :cond_44

    move v0, v1

    :goto_19
    invoke-virtual {v4, v0}, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->setActive(Z)V
    :try_end_1c
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_1c} :catch_4c

    .line 318
    :cond_1c
    :goto_1c
    :try_start_1c
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sButton:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_46

    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sButton:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 319
    :goto_28
    if-eqz v0, :cond_41

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    instance-of v3, v3, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;

    if-eqz v3, :cond_41

    .line 320
    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;

    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->isDefault()Z

    move-result v3

    if-nez v3, :cond_48

    :goto_3e
    invoke-virtual {v0, v1}, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->setActive(Z)V
    :try_end_41
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_41} :catch_4a

    .line 325
    :cond_41
    :goto_41
    return-void

    :cond_42
    move-object v4, v3

    .line 312
    goto :goto_10

    :cond_44
    move v0, v2

    .line 313
    goto :goto_19

    :cond_46
    move-object v0, v3

    .line 318
    goto :goto_28

    :cond_48
    move v1, v2

    .line 320
    goto :goto_3e

    .line 322
    :catch_4a
    move-exception v0

    goto :goto_41

    .line 314
    :catch_4c
    move-exception v0

    goto :goto_1c
.end method

.method private static register(Landroid/media/MediaPlayer;)V
    .registers 4

    .prologue
    .line 133
    if-nez p0, :cond_3

    .line 146
    :goto_2
    return-void

    .line 134
    :cond_3
    sget-object v2, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    monitor-enter v2

    .line 135
    :try_start_6
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    move v1, v0

    :goto_f
    if-ltz v1, :cond_31

    .line 136
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/MediaPlayer;

    .line 137
    if-nez v0, :cond_2a

    .line 138
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 135
    :cond_26
    add-int/lit8 v0, v1, -0x1

    move v1, v0

    goto :goto_f

    .line 139
    :cond_2a
    if-ne v0, p0, :cond_26

    .line 140
    monitor-exit v2

    goto :goto_2

    .line 145
    :catchall_2e
    move-exception v0

    monitor-exit v2
    :try_end_30
    .catchall {:try_start_6 .. :try_end_30} :catchall_2e

    throw v0

    .line 143
    :cond_31
    :try_start_31
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 144
    :goto_3b
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x8

    if-le v0, v1, :cond_4c

    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_3b

    .line 145
    :cond_4c
    monitor-exit v2
    :try_end_4d
    .catchall {:try_start_31 .. :try_end_4d} :catchall_2e

    goto :goto_2
.end method

.method private static save()V
    .registers 3

    .prologue
    .line 92
    :try_start_0
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sCtx:Landroid/content/Context;

    if-nez v0, :cond_5

    .line 99
    :goto_4
    return-void

    .line 93
    :cond_5
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sCtx:Landroid/content/Context;

    const-string v1, "pitch_tempo"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "speed"

    sget v2, Lcom/sonyericsson/music/nightcore/PitchTempo;->sSpeed:F

    .line 94
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "pitch"

    sget v2, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPitch:F

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "linked"

    sget-boolean v2, Lcom/sonyericsson/music/nightcore/PitchTempo;->sLinked:Z

    .line 95
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_2d
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_2d} :catch_2e

    goto :goto_4

    .line 96
    :catch_2e
    move-exception v0

    goto :goto_4
.end method

.method static setValues(FF)V
    .registers 3

    .prologue
    .line 102
    invoke-static {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->clamp(F)F

    move-result v0

    sput v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sSpeed:F

    .line 103
    invoke-static {p1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->clamp(F)F

    move-result v0

    sput v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sPitch:F

    .line 104
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->save()V

    .line 105
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->applyAll()V

    .line 106
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->refreshButton()V

    .line 107
    return-void
.end method

.method static showDialog(Landroid/content/Context;)V
    .registers 15

    .prologue
    const/high16 v11, 0x43160000    # 150.0f

    const/4 v13, -0x2

    const/high16 v10, 0x41800000    # 16.0f

    const/4 v12, 0x0

    .line 389
    new-instance v0, Landroid/app/Dialog;

    const v1, 0x103012e

    invoke-direct {v0, p0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 390
    const-string v1, "Pitch & tempo"

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 392
    invoke-static {p0, v10}, Lcom/sonyericsson/music/nightcore/PitchTempo;->dp(Landroid/content/Context;F)I

    move-result v1

    .line 393
    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {p0, v2}, Lcom/sonyericsson/music/nightcore/PitchTempo;->dp(Landroid/content/Context;F)I

    move-result v2

    .line 394
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 395
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 396
    invoke-virtual {v3, v1, v2, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 399
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 400
    invoke-virtual {v4, v12}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 401
    new-instance v5, Landroid/widget/Button;

    invoke-direct {v5, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 402
    const-string v6, "Normal"

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 403
    new-instance v6, Landroid/widget/Button;

    invoke-direct {v6, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 404
    const-string v7, "Slowed"

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 405
    new-instance v7, Landroid/widget/Button;

    invoke-direct {v7, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 406
    const-string v8, "Sped up"

    invoke-virtual {v7, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 407
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v8, v12, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 409
    invoke-virtual {v4, v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 410
    invoke-virtual {v4, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 411
    invoke-virtual {v4, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 412
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 415
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 416
    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 417
    invoke-virtual {v4, v12, v1, v12, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 418
    new-instance v8, Landroid/widget/SeekBar;

    invoke-direct {v8, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 419
    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/SeekBar;->setMax(I)V

    .line 420
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 421
    invoke-virtual {v3, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 424
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 425
    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 426
    invoke-virtual {v9, v12, v1, v12, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 427
    new-instance v1, Landroid/widget/SeekBar;

    invoke-direct {v1, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    .line 428
    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v10

    invoke-virtual {v1, v10}, Landroid/widget/SeekBar;->setMax(I)V

    .line 429
    invoke-virtual {v3, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 430
    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 432
    new-instance v10, Landroid/widget/CheckBox;

    invoke-direct {v10, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 433
    const-string v11, "Link tempo & pitch (nightcore / slowed)"

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 434
    sget-boolean v11, Lcom/sonyericsson/music/nightcore/PitchTempo;->sLinked:Z

    invoke-virtual {v10, v11}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 435
    invoke-virtual {v10, v12, v2, v12, v12}, Landroid/widget/CheckBox;->setPadding(IIII)V

    .line 436
    invoke-virtual {v3, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 438
    new-instance v11, Landroid/widget/TextView;

    invoke-direct {v11, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 439
    const/high16 v12, 0x41400000    # 12.0f

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setTextSize(F)V

    .line 440
    const v12, 0x3f333333    # 0.7f

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setAlpha(F)V

    .line 441
    const-string v12, "Linked: faster = higher pitch, slower = lower pitch. Untick to change tempo or pitch on its own. Tip: long-press the button for instant nightcore on/off."

    invoke-virtual {v11, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 444
    invoke-virtual {v3, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 446
    new-instance v11, Landroid/widget/Button;

    invoke-direct {v11, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 447
    const-string v12, "Done"

    invoke-virtual {v11, v12}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 448
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v12, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 450
    const/4 v13, 0x5

    iput v13, v12, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 451
    iput v2, v12, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 452
    invoke-virtual {v3, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 454
    new-instance v2, Lcom/sonyericsson/music/nightcore/PitchTempo$6;

    invoke-direct {v2, v4, v9, v8, v1}, Lcom/sonyericsson/music/nightcore/PitchTempo$6;-><init>(Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/SeekBar;Landroid/widget/SeekBar;)V

    .line 462
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 464
    new-instance v12, Lcom/sonyericsson/music/nightcore/PitchTempo$7;

    invoke-direct {v12, v4, v9, v1}, Lcom/sonyericsson/music/nightcore/PitchTempo$7;-><init>(Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/SeekBar;)V

    invoke-virtual {v8, v12}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 476
    new-instance v12, Lcom/sonyericsson/music/nightcore/PitchTempo$8;

    invoke-direct {v12, v4, v9, v8}, Lcom/sonyericsson/music/nightcore/PitchTempo$8;-><init>(Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/SeekBar;)V

    invoke-virtual {v1, v12}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 488
    new-instance v1, Lcom/sonyericsson/music/nightcore/PitchTempo$9;

    invoke-direct {v1, v2}, Lcom/sonyericsson/music/nightcore/PitchTempo$9;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v10, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 495
    new-instance v1, Lcom/sonyericsson/music/nightcore/PitchTempo$10;

    invoke-direct {v1, v2}, Lcom/sonyericsson/music/nightcore/PitchTempo$10;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v5, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 501
    new-instance v1, Lcom/sonyericsson/music/nightcore/PitchTempo$11;

    invoke-direct {v1, v10, v2}, Lcom/sonyericsson/music/nightcore/PitchTempo$11;-><init>(Landroid/widget/CheckBox;Ljava/lang/Runnable;)V

    invoke-virtual {v6, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 509
    new-instance v1, Lcom/sonyericsson/music/nightcore/PitchTempo$12;

    invoke-direct {v1, v10, v2}, Lcom/sonyericsson/music/nightcore/PitchTempo$12;-><init>(Landroid/widget/CheckBox;Ljava/lang/Runnable;)V

    invoke-virtual {v7, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 517
    new-instance v1, Lcom/sonyericsson/music/nightcore/PitchTempo$13;

    invoke-direct {v1, v0}, Lcom/sonyericsson/music/nightcore/PitchTempo$13;-><init>(Landroid/app/Dialog;)V

    invoke-virtual {v11, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 523
    invoke-virtual {v0, v3}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 524
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 525
    return-void
.end method

.method private static toProgress(F)I
    .registers 3

    .prologue
    .line 379
    invoke-static {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->clamp(F)F

    move-result v0

    const/high16 v1, 0x3f000000    # 0.5f

    sub-float/2addr v0, v1

    const/high16 v1, 0x42c80000    # 100.0f

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 329
    const/4 v0, 0x0

    :try_start_1
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_8} :catch_9

    .line 333
    :goto_8
    return-void

    .line 330
    :catch_9
    move-exception v0

    goto :goto_8
.end method

.method private static tryAttach(Landroid/view/View;I)V
    .registers 7

    .prologue
    .line 244
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 245
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v2, "player_like_button"

    const-string v3, "id"

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 246
    if-eqz v0, :cond_3b

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 247
    :goto_1a
    if-eqz v0, :cond_3d

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_3d

    .line 248
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 249
    const-string v2, "pitch_tempo_button"

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_3a

    .line 250
    invoke-static {v1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->makeButton(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 265
    :cond_3a
    :goto_3a
    return-void

    .line 246
    :cond_3b
    const/4 v0, 0x0

    goto :goto_1a

    .line 254
    :cond_3d
    const/16 v0, 0x28

    if-ge p1, v0, :cond_3a

    .line 255
    new-instance v0, Lcom/sonyericsson/music/nightcore/PitchTempo$3;

    invoke-direct {v0, p0, p1}, Lcom/sonyericsson/music/nightcore/PitchTempo$3;-><init>(Landroid/view/View;I)V

    const-wide/16 v2, 0xfa

    invoke-virtual {p0, v0, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_3a
.end method

.method private static warnOnce()V
    .registers 2

    .prologue
    .line 188
    sget-boolean v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sWarned:Z

    if-eqz v0, :cond_5

    .line 202
    :goto_4
    return-void

    .line 189
    :cond_5
    const/4 v0, 0x1

    sput-boolean v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sWarned:Z

    .line 190
    sget-object v0, Lcom/sonyericsson/music/nightcore/PitchTempo;->sMain:Landroid/os/Handler;

    new-instance v1, Lcom/sonyericsson/music/nightcore/PitchTempo$1;

    invoke-direct {v1}, Lcom/sonyericsson/music/nightcore/PitchTempo$1;-><init>()V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_4
.end method
