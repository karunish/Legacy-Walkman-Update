.class Lcom/sonyericsson/music/nightcore/PitchTempo$6;
.super Ljava/lang/Object;
.source "PitchTempo.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonyericsson/music/nightcore/PitchTempo;->showDialog(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$pitchBar:Landroid/widget/SeekBar;

.field final synthetic val$pitchLbl:Landroid/widget/TextView;

.field final synthetic val$tempoBar:Landroid/widget/SeekBar;

.field final synthetic val$tempoLbl:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/SeekBar;Landroid/widget/SeekBar;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 454
    iput-object p1, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$6;->val$tempoLbl:Landroid/widget/TextView;

    iput-object p2, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$6;->val$pitchLbl:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$6;->val$tempoBar:Landroid/widget/SeekBar;

    iput-object p4, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$6;->val$pitchBar:Landroid/widget/SeekBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 456
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$6;->val$tempoLbl:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Tempo   "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sSpeed:F
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$1000()F

    move-result v2

    # invokes: Lcom/sonyericsson/music/nightcore/PitchTempo;->fmtSpeed(F)Ljava/lang/String;
    invoke-static {v2}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$800(F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 457
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$6;->val$pitchLbl:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Pitch   "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sPitch:F
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$1100()F

    move-result v2

    # invokes: Lcom/sonyericsson/music/nightcore/PitchTempo;->fmtPitch(F)Ljava/lang/String;
    invoke-static {v2}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$1200(F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 458
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$6;->val$tempoBar:Landroid/widget/SeekBar;

    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sSpeed:F
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$1000()F

    move-result v1

    # invokes: Lcom/sonyericsson/music/nightcore/PitchTempo;->toProgress(F)I
    invoke-static {v1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$1300(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 459
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$6;->val$pitchBar:Landroid/widget/SeekBar;

    # getter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sPitch:F
    invoke-static {}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$1100()F

    move-result v1

    # invokes: Lcom/sonyericsson/music/nightcore/PitchTempo;->toProgress(F)I
    invoke-static {v1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$1300(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 460
    return-void
.end method
