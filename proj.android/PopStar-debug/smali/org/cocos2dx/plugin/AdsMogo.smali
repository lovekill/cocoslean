.class public Lorg/cocos2dx/plugin/AdsMogo;
.super Ljava/lang/Object;
.source "AdsMogo.java"

# interfaces
.implements Lorg/cocos2dx/plugin/InterfaceAds;


# static fields
.field private static mContext:Landroid/app/Activity;


# instance fields
.field private mWm:Landroid/view/WindowManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/4 v0, 0x0

    sput-object v0, Lorg/cocos2dx/plugin/AdsMogo;->mContext:Landroid/app/Activity;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cocos2dx/plugin/AdsMogo;->mWm:Landroid/view/WindowManager;

    .line 23
    check-cast p1, Landroid/app/Activity;

    .end local p1
    sput-object p1, Lorg/cocos2dx/plugin/AdsMogo;->mContext:Landroid/app/Activity;

    .line 24
    return-void
.end method


# virtual methods
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
    .line 30
    .local p1, devInfo:Ljava/util/Hashtable;,"Ljava/util/Hashtable<Ljava/lang/String;Ljava/lang/String;>;"
    return-void
.end method

.method public getPluginVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    const-string v0, "0.2.0"

    return-object v0
.end method

.method public getSDKVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    const-string v0, "6.3.1"

    return-object v0
.end method

.method public hideAds(I)V
    .locals 1
    .parameter "type"

    .prologue
    .line 48
    new-instance v0, Lorg/cocos2dx/plugin/AdsMogo$2;

    invoke-direct {v0, p0}, Lorg/cocos2dx/plugin/AdsMogo$2;-><init>(Lorg/cocos2dx/plugin/AdsMogo;)V

    invoke-static {v0}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 59
    return-void
.end method

.method public setDebugMode(Z)V
    .locals 0
    .parameter "debug"

    .prologue
    .line 71
    return-void
.end method

.method public showAds(III)V
    .locals 1
    .parameter "type"
    .parameter "sizeEnum"
    .parameter "pos"

    .prologue
    .line 35
    new-instance v0, Lorg/cocos2dx/plugin/AdsMogo$1;

    invoke-direct {v0, p0}, Lorg/cocos2dx/plugin/AdsMogo$1;-><init>(Lorg/cocos2dx/plugin/AdsMogo;)V

    invoke-static {v0}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnMainThread(Ljava/lang/Runnable;)V

    .line 42
    return-void
.end method

.method public spendPoints(I)V
    .locals 0
    .parameter "points"

    .prologue
    .line 65
    return-void
.end method
