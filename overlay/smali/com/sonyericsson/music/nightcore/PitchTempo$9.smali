.class Lcom/sonyericsson/music/nightcore/PitchTempo$9;
.super Ljava/lang/Object;
.source "PitchTempo.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonyericsson/music/nightcore/PitchTempo;->showDialog(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$refresh:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 488
    iput-object p1, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$9;->val$refresh:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5

    .prologue
    .line 490
    # setter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sLinked:Z
    invoke-static {p2}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$702(Z)Z

    .line 491
    if-eqz p2, :cond_16

    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sSpeed:F
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$1000()F

    move-result v0

    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sSpeed:F
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$1000()F

    move-result v1

    invoke-static {v0, v1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->setValues(FF)V

    .line 492
    :goto_10
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$9;->val$refresh:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 493
    return-void

    .line 491
    :cond_16
    # invokes: Lcom/sonyericsson/music/nightcore/PitchTempo;->save()V
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$1500()V

    goto :goto_10
.end method
