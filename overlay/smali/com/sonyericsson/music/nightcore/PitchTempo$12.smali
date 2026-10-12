.class Lcom/sonyericsson/music/nightcore/PitchTempo$12;
.super Ljava/lang/Object;
.source "PitchTempo.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonyericsson/music/nightcore/PitchTempo;->showDialog(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$link:Landroid/widget/CheckBox;

.field final synthetic val$refresh:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/widget/CheckBox;Ljava/lang/Runnable;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 509
    iput-object p1, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$12;->val$link:Landroid/widget/CheckBox;

    iput-object p2, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$12;->val$refresh:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .prologue
    const/4 v2, 0x1

    const/high16 v1, 0x3fa00000    # 1.25f

    .line 511
    # setter for: Lcom/sonyericsson/music/nightcore/PitchTempo;->sLinked:Z
    invoke-static {v2}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$702(Z)Z

    .line 512
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$12;->val$link:Landroid/widget/CheckBox;

    invoke-virtual {v0, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 513
    invoke-static {v1, v1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->setValues(FF)V

    .line 514
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$12;->val$refresh:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 515
    return-void
.end method
