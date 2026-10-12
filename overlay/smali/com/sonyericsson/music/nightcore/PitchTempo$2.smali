.class Lcom/sonyericsson/music/nightcore/PitchTempo$2;
.super Ljava/lang/Object;
.source "PitchTempo.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonyericsson/music/nightcore/PitchTempo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 207
    .line 208
    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$100()Ljava/util/ArrayList;

    move-result-object v4

    monitor-enter v4

    .line 209
    :try_start_6
    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$100()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    move v2, v0

    move v1, v3

    :goto_12
    if-ltz v2, :cond_3a

    .line 210
    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$100()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/MediaPlayer;

    .line 211
    if-eqz v0, :cond_2c

    # invokes: Lcom/sonyericsson/music/nightcore/PitchTempo;->applyIfPlaying(Landroid/media/MediaPlayer;)Z
    invoke-static {v0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$200(Landroid/media/MediaPlayer;)Z

    move-result v0

    if-nez v0, :cond_38

    .line 212
    :cond_2c
    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sPlayers:Ljava/util/ArrayList;
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$100()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move v0, v1

    .line 209
    :goto_34
    add-int/lit8 v2, v2, -0x1

    move v1, v0

    goto :goto_12

    .line 214
    :cond_38
    const/4 v0, 0x1

    goto :goto_34

    .line 217
    :cond_3a
    monitor-exit v4
    :try_end_3b
    .catchall {:try_start_6 .. :try_end_3b} :catchall_47

    .line 218
    if-eqz v1, :cond_4a

    .line 219
    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sMain:Landroid/os/Handler;
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$300()Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 223
    :goto_46
    return-void

    .line 217
    :catchall_47
    move-exception v0

    :try_start_48
    monitor-exit v4
    :try_end_49
    .catchall {:try_start_48 .. :try_end_49} :catchall_47

    throw v0

    .line 221
    :cond_4a
    # setter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sPolling:Z
    invoke-static {v3}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$402(Z)Z

    goto :goto_46
.end method
