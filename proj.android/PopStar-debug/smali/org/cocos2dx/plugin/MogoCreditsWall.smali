.class public Lorg/cocos2dx/plugin/MogoCreditsWall;
.super Ljava/lang/Object;
.source "MogoCreditsWall.java"

# interfaces
.implements Lorg/cocos2dx/plugin/InterfaceCreditsWall;


# static fields
.field public static final FISRT:Ljava/lang/String; = "first_point"

.field private static mAdapter:Lorg/cocos2dx/plugin/MogoCreditsWall;

.field private static mContext:Landroid/app/Activity;


# instance fields
.field mEditor:Landroid/content/SharedPreferences$Editor;

.field mSharedPreferences:Landroid/content/SharedPreferences;

.field res:Landroid/content/res/Resources;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 20
    sput-object v0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mContext:Landroid/app/Activity;

    .line 21
    sput-object v0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mAdapter:Lorg/cocos2dx/plugin/MogoCreditsWall;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v0, p1

    .line 27
    check-cast v0, Landroid/app/Activity;

    sput-object v0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mContext:Landroid/app/Activity;

    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lorg/cocos2dx/plugin/MogoCreditsWall;->res:Landroid/content/res/Resources;

    .line 29
    sput-object p0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mAdapter:Lorg/cocos2dx/plugin/MogoCreditsWall;

    .line 30
    sget-object v0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mContext:Landroid/app/Activity;

    const-string v1, "cach_data"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mSharedPreferences:Landroid/content/SharedPreferences;

    .line 32
    iget-object v0, p0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mSharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mEditor:Landroid/content/SharedPreferences$Editor;

    .line 33
    return-void
.end method

.method static synthetic access$000()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 18
    sget-object v0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mContext:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$100(Lorg/cocos2dx/plugin/MogoCreditsWall;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 18
    invoke-direct {p0}, Lorg/cocos2dx/plugin/MogoCreditsWall;->getFirstPoint()Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lorg/cocos2dx/plugin/MogoCreditsWall;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 18
    invoke-direct {p0}, Lorg/cocos2dx/plugin/MogoCreditsWall;->setFirstPoint()V

    return-void
.end method

.method private getFirstPoint()Z
    .locals 3

    .prologue
    .line 41
    iget-object v0, p0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mSharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "first_point"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private setFirstPoint()V
    .locals 3

    .prologue
    .line 36
    iget-object v0, p0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "first_point"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 37
    iget-object v0, p0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 38
    return-void
.end method

.method public static updateOfferValue(J)V
    .locals 2
    .parameter "arg0"

    .prologue
    .line 186
    sget-object v0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mAdapter:Lorg/cocos2dx/plugin/MogoCreditsWall;

    if-eqz v0, :cond_0

    .line 187
    sget-object v0, Lorg/cocos2dx/plugin/MogoCreditsWall;->mAdapter:Lorg/cocos2dx/plugin/MogoCreditsWall;

    invoke-virtual {v0, p0, p1}, Lorg/cocos2dx/plugin/MogoCreditsWall;->updateOffer(J)V

    .line 189
    :cond_0
    return-void
.end method


# virtual methods
.method public addCreditsWall(I)V
    .locals 0
    .parameter "num"

    .prologue
    .line 57
    .line 58
    return-void
.end method

.method public configDeveloperInfo(Ljava/util/Hashtable;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p1, cpInfo:Ljava/util/Hashtable;,"Ljava/util/Hashtable<Ljava/lang/String;Ljava/lang/String;>;"
    return-void
.end method

.method public removeCreditsWall(I)V
    .locals 0
    .parameter "num"

    .prologue
    .line 62
    return-void
.end method

.method public showAdviceDialog()V
    .locals 1

    .prologue
    .line 170
    new-instance v0, Lorg/cocos2dx/plugin/MogoCreditsWall$2;

    invoke-direct {v0, p0}, Lorg/cocos2dx/plugin/MogoCreditsWall$2;-><init>(Lorg/cocos2dx/plugin/MogoCreditsWall;)V

    invoke-static {v0}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 178
    return-void
.end method

.method public showCreditsWallShop(I)V
    .locals 2
    .parameter "points"

    .prologue
    .line 65
    const-string v0, "showCreditswallShop"

    const-string v1, "start pay"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    new-instance v0, Lorg/cocos2dx/plugin/MogoCreditsWall$1;

    invoke-direct {v0, p0, p1}, Lorg/cocos2dx/plugin/MogoCreditsWall$1;-><init>(Lorg/cocos2dx/plugin/MogoCreditsWall;I)V

    invoke-static {v0}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 166
    return-void
.end method

.method public showOffer()V
    .locals 0

    .prologue
    .line 50
    return-void
.end method

.method public updateOffer(J)V
    .locals 3
    .parameter "arg0"

    .prologue
    .line 181
    long-to-int v0, p1

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lorg/cocos2dx/plugin/CreditsWallWrapper;->onCreditsWallResult(Lorg/cocos2dx/plugin/InterfaceCreditsWall;ILjava/lang/String;)V

    .line 183
    return-void
.end method
