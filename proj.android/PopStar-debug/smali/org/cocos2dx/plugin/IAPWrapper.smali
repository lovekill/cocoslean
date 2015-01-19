.class public Lorg/cocos2dx/plugin/IAPWrapper;
.super Ljava/lang/Object;
.source "IAPWrapper.java"


# static fields
.field public static final PAYRESULT_CANCEL:I = 0x2

.field public static final PAYRESULT_FAIL:I = 0x1

.field public static final PAYRESULT_SUCCESS:I = 0x0

.field public static final PAYRESULT_TIMEOUT:I = 0x3


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
    invoke-static {p0, p1, p2}, Lorg/cocos2dx/plugin/IAPWrapper;->nativeOnPayResult(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method private static native nativeOnPayResult(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method public static onPayResult(Lorg/cocos2dx/plugin/InterfaceIAP;ILjava/lang/String;)V
    .locals 4
    .parameter "obj"
    .parameter "ret"
    .parameter "msg"

    .prologue
    .line 33
    move v2, p1

    .line 34
    .local v2, curRet:I
    move-object v0, p2

    .line 35
    .local v0, curMsg:Ljava/lang/String;
    move-object v1, p0

    .line 36
    .local v1, curObj:Lorg/cocos2dx/plugin/InterfaceIAP;
    new-instance v3, Lorg/cocos2dx/plugin/IAPWrapper$1;

    invoke-direct {v3, v1, v2, v0}, Lorg/cocos2dx/plugin/IAPWrapper$1;-><init>(Lorg/cocos2dx/plugin/InterfaceIAP;ILjava/lang/String;)V

    invoke-static {v3}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 44
    return-void
.end method
