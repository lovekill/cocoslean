.class public Lorg/cocos2dx/plugin/SocialWrapper;
.super Ljava/lang/Object;
.source "SocialWrapper.java"


# static fields
.field public static final SHARERESULT_CANCEL:I = 0x2

.field public static final SHARERESULT_FAIL:I = 0x1

.field public static final SHARERESULT_SUCCESS:I = 0x0

.field public static final SHARERESULT_TIMEOUT:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 26
    invoke-static {p0, p1, p2}, Lorg/cocos2dx/plugin/SocialWrapper;->nativeOnShareResult(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method private static native nativeOnShareResult(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method public static onShareResult(Lorg/cocos2dx/plugin/InterfaceSocial;ILjava/lang/String;)V
    .locals 4
    .parameter "obj"
    .parameter "ret"
    .parameter "msg"

    .prologue
    .line 33
    move v2, p1

    .line 34
    .local v2, curRet:I
    move-object v1, p2

    .line 35
    .local v1, curMsg:Ljava/lang/String;
    move-object v0, p0

    .line 36
    .local v0, curAdapter:Lorg/cocos2dx/plugin/InterfaceSocial;
    new-instance v3, Lorg/cocos2dx/plugin/SocialWrapper$1;

    invoke-direct {v3, v0, v2, v1}, Lorg/cocos2dx/plugin/SocialWrapper$1;-><init>(Lorg/cocos2dx/plugin/InterfaceSocial;ILjava/lang/String;)V

    invoke-static {v3}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 44
    return-void
.end method
