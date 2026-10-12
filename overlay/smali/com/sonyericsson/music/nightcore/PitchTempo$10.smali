.class Lcom/sonyericsson/music/nightcore/PitchTempo$10;
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
    .line 495
    iput-object p1, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$10;->val$refresh:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .prologue
    const/high16 v0, 0x3f800000    # 1.0f

    .line 497
    invoke-static {v0, v0}, Lcom/sonyericsson/music/nightcore/PitchTempo;->setValues(FF)V

    .line 498
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$10;->val$refresh:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 499
    return-void
.end method
