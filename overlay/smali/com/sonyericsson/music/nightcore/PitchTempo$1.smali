.class Lcom/sonyericsson/music/nightcore/PitchTempo$1;
.super Ljava/lang/Object;
.source "PitchTempo.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonyericsson/music/nightcore/PitchTempo;->warnOnce()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 193
    :try_start_0
    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sCtx:Landroid/content/Context;
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$000()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_14

    .line 194
    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sCtx:Landroid/content/Context;
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$000()Landroid/content/Context;

    move-result-object v0

    const-string v1, "This speed/pitch isn\'t supported on this device"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 195
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_14} :catch_15

    .line 200
    :cond_14
    :goto_14
    return-void

    .line 197
    :catch_15
    move-exception v0

    goto :goto_14
.end method
