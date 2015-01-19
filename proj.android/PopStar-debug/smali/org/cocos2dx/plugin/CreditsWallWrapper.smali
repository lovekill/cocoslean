.class public Lorg/cocos2dx/plugin/CreditsWallWrapper;
.super Ljava/lang/Object;
.source "CreditsWallWrapper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 7
    invoke-static {p0, p1, p2}, Lorg/cocos2dx/plugin/CreditsWallWrapper;->nativeOnCreditsWallResult(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method private static native nativeOnCreditsWallResult(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method public static onCreditsWallResult(Lorg/cocos2dx/plugin/InterfaceCreditsWall;ILjava/lang/String;)V
    .locals 4
    .parameter "obj"
    .parameter "ret"
    .parameter "msg"

    .prologue
    .line 11
    move v2, p1

    .line 12
    .local v2, curRet:I
    move-object v0, p2

    .line 13
    .local v0, curMsg:Ljava/lang/String;
    move-object v1, p0

    .line 15
    .local v1, curObj:Lorg/cocos2dx/plugin/InterfaceCreditsWall;
    new-instance v3, Lorg/cocos2dx/plugin/CreditsWallWrapper$1;

    invoke-direct {v3, v1, v2, v0}, Lorg/cocos2dx/plugin/CreditsWallWrapper$1;-><init>(Lorg/cocos2dx/plugin/InterfaceCreditsWall;ILjava/lang/String;)V

    invoke-static {v3}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 28
    return-void
.end method
