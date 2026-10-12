.class final Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "PitchTempo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonyericsson/music/nightcore/PitchTempo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "IconDrawable"
.end annotation


# instance fields
.field private active:Z

.field private final knob:Landroid/graphics/Paint;

.field private final line:Landroid/graphics/Paint;

.field private final size:I


# direct methods
.method constructor <init>(I)V
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 536
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 531
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->line:Landroid/graphics/Paint;

    .line 532
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->knob:Landroid/graphics/Paint;

    .line 537
    iput p1, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->size:I

    .line 538
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->line:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 539
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->line:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 540
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->knob:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 541
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 16

    .prologue
    const v13, 0x3da3d70a    # 0.08f

    const/4 v12, 0x3

    .line 552
    invoke-virtual {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v7

    .line 553
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v8, v0

    .line 554
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v9, v0

    .line 555
    iget-boolean v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->active:Z

    if-eqz v0, :cond_6f

    const/16 v0, -0x4d00

    .line 556
    :goto_18
    iget-object v1, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->line:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 557
    iget-object v1, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->knob:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 558
    iget-object v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->line:Landroid/graphics/Paint;

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v2, 0x41400000    # 12.0f

    div-float v2, v8, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 559
    new-array v10, v12, [F

    fill-array-data v10, :array_74

    .line 560
    new-array v11, v12, [F

    fill-array-data v11, :array_7e

    .line 561
    const/4 v0, 0x0

    move v6, v0

    :goto_3d
    if-ge v6, v12, :cond_73

    .line 562
    iget v0, v7, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    aget v1, v10, v6

    mul-float/2addr v1, v9

    add-float v2, v0, v1

    .line 563
    iget v0, v7, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    mul-float v1, v8, v13

    add-float/2addr v1, v0

    iget v0, v7, Landroid/graphics/Rect;->right:I

    int-to-float v0, v0

    mul-float v3, v8, v13

    sub-float v3, v0, v3

    iget-object v5, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->line:Landroid/graphics/Paint;

    move-object v0, p1

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 564
    iget v0, v7, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    aget v1, v11, v6

    mul-float/2addr v1, v8

    add-float/2addr v0, v1

    const v1, 0x3df5c28f    # 0.12f

    mul-float/2addr v1, v8

    iget-object v3, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->knob:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 561
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_3d

    .line 555
    :cond_6f
    const v0, -0x21000001

    goto :goto_18

    .line 566
    :cond_73
    return-void

    .line 559
    :array_74
    .array-data 4
        0x3e4ccccd    # 0.2f
        0x3f000000    # 0.5f
        0x3f4ccccd    # 0.8f
    .end array-data

    .line 560
    :array_7e
    .array-data 4
        0x3f333333    # 0.7f
        0x3e99999a    # 0.3f
        0x3f19999a    # 0.6f
    .end array-data
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 572
    iget v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->size:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 571
    iget v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->size:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 570
    const/4 v0, -0x3

    return v0
.end method

.method setActive(Z)V
    .registers 3

    .prologue
    .line 544
    iget-boolean v0, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->active:Z

    if-eq v0, p1, :cond_9

    .line 545
    iput-boolean p1, p0, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->active:Z

    .line 546
    invoke-virtual {p0}, Lcom/sonyericsson/music/nightcore/PitchTempo$IconDrawable;->invalidateSelf()V

    .line 548
    :cond_9
    return-void
.end method

.method public setAlpha(I)V
    .registers 2

    .prologue
    .line 568
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    .prologue
    .line 569
    return-void
.end method
