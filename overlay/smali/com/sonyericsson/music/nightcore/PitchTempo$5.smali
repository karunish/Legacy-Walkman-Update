.class Lcom/sonyericsson/music/nightcore/PitchTempo$5;
.super Ljava/lang/Object;
.source "PitchTempo.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonyericsson/music/nightcore/PitchTempo;->makeButton(Landroid/content/Context;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 293
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .registers 7

    .prologue
    const/4 v4, 0x1

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v3, 0x3fa00000    # 1.25f

    .line 295
    # invokes: Lcom/sonyericsson/music/nightcore/PitchTempo;->isDefault()Z
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$600()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 296
    # setter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sLinked:Z
    invoke-static {v4}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$702(Z)Z

    .line 297
    invoke-static {v3, v3}, Lcom/sonyericsson/music/nightcore/PitchTempo;->setValues(FF)V

    .line 298
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Nightcore  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    # invokes: Lcom/sonyericsson/music/nightcore/PitchTempo;->fmtSpeed(F)Ljava/lang/String;
    invoke-static {v3}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$800(F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/sonyericsson/music/nightcore/PitchTempo;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$900(Landroid/content/Context;Ljava/lang/String;)V

    .line 303
    :goto_2f
    return v4

    .line 300
    :cond_30
    invoke-static {v1, v1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->setValues(FF)V

    .line 301
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Normal speed"

    # invokes: Lcom/sonyericsson/music/nightcore/PitchTempo;->toast(Landroid/content/Context;Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$900(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_2f
.end method
