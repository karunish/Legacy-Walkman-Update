.class public Lcom/sonymobile/settings/illumination/Illumination;
.super Ljava/lang/Object;

.field public static final MUSIC_BEAT_URI:Landroid/net/Uri;

.method static constructor <clinit>()V
    .locals 1
    const-string v0, "content://com.sonymobile.illumination/music_beat"
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v0
    sput-object v0, Lcom/sonymobile/settings/illumination/Illumination;->MUSIC_BEAT_URI:Landroid/net/Uri;
    return-void
.end method

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method
