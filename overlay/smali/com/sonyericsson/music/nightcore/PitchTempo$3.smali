.class Lcom/sonyericsson/music/nightcore/PitchTempo$3;
.super Ljava/lang/Object;
.source "PitchTempo.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonyericsson/music/nightcore/PitchTempo;->tryAttach(Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$attempt:I

.field final synthetic val$root:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 255
    iput-object p1, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$3;->val$root:Landroid/view/View;

    iput p2, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$3;->val$attempt:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 258
    :try_start_0
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$3;->val$root:Landroid/view/View;

    iget v1, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$3;->val$attempt:I

    add-int/lit8 v1, v1, 0x1

    # invokes: Lcom/sonyericsson/music/nightcore/PitchTempo;->tryAttach(Landroid/view/View;I)V
    invoke-static {v0, v1}, Lcom/sonyericsson/music/nightcore/PitchTempo;->access$500(Landroid/view/View;I)V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_9} :catch_a

    .line 262
    :goto_9
    return-void

    .line 259
    :catch_a
    move-exception v0

    goto :goto_9
.end method
