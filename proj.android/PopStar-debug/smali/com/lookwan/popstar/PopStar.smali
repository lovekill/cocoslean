.class public Lcom/lookwan/popstar/PopStar;
.super Lorg/cocos2dx/lib/Cocos2dxActivity;
.source "PopStar.java"


# static fields
.field private static final APPID:Ljava/lang/String; = "300008392037"

.field private static final APPKEY:Ljava/lang/String; = "30BB1BAE7A84DE74"

.field public static purchase:Lmm/purchasesdk/Purchase;


# instance fields
.field private mListener:Lcom/lookwan/popstar/IAPListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 83
    const-string v0, "cocos2dcpp"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/cocos2dx/lib/Cocos2dxActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    .line 47
    invoke-super {p0, p1}, Lorg/cocos2dx/lib/Cocos2dxActivity;->onCreate(Landroid/os/Bundle;)V

    .line 49
    new-instance v2, Lcom/lookwan/popstar/IAPHandler;

    invoke-virtual {p0}, Lcom/lookwan/popstar/PopStar;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/lookwan/popstar/IAPHandler;-><init>(Landroid/content/Context;)V

    .line 51
    .local v2, iapHandler:Lcom/lookwan/popstar/IAPHandler;
    new-instance v4, Lcom/lookwan/popstar/IAPListener;

    invoke-virtual {p0}, Lcom/lookwan/popstar/PopStar;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/lookwan/popstar/IAPListener;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/lookwan/popstar/PopStar;->mListener:Lcom/lookwan/popstar/IAPListener;

    .line 53
    invoke-static {}, Lmm/purchasesdk/Purchase;->getInstance()Lmm/purchasesdk/Purchase;

    move-result-object v4

    sput-object v4, Lcom/lookwan/popstar/PopStar;->purchase:Lmm/purchasesdk/Purchase;

    .line 54
    invoke-virtual {p0}, Lcom/lookwan/popstar/PopStar;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 55
    .local v3, res:Landroid/content/res/Resources;
    const-string v4, "app_id"

    const-string v5, "string"

    invoke-virtual {p0}, Lcom/lookwan/popstar/PopStar;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 56
    .local v0, app_id:I
    const-string v4, "app_key"

    const-string v5, "string"

    invoke-virtual {p0}, Lcom/lookwan/popstar/PopStar;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 58
    .local v1, app_key:I
    :try_start_0
    const-string v4, "PopStart"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Lcom/lookwan/popstar/PopStar;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "|"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0, v1}, Lcom/lookwan/popstar/PopStar;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lmm/purchasesdk/core/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    sget-object v4, Lcom/lookwan/popstar/PopStar;->purchase:Lmm/purchasesdk/Purchase;

    invoke-virtual {p0, v0}, Lcom/lookwan/popstar/PopStar;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v1}, Lcom/lookwan/popstar/PopStar;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lmm/purchasesdk/Purchase;->setAppInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    sget-object v4, Lcom/lookwan/popstar/PopStar;->purchase:Lmm/purchasesdk/Purchase;

    new-instance v5, Lcom/lookwan/popstar/IAPListener;

    invoke-direct {v5, p0}, Lcom/lookwan/popstar/IAPListener;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, p0, v5}, Lmm/purchasesdk/Purchase;->init(Landroid/content/Context;Lmm/purchasesdk/OnPurchaseListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    :goto_0
    return-void

    .line 64
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public onCreateView()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    .locals 7

    .prologue
    const/4 v1, 0x5

    .line 72
    new-instance v0, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-direct {v0, p0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 74
    .local v0, glSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;
    const/4 v2, 0x6

    const/4 v4, 0x0

    const/16 v5, 0x10

    const/16 v6, 0x8

    move v3, v1

    invoke-virtual/range {v0 .. v6}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->setEGLConfigChooser(IIIIII)V

    .line 76
    invoke-static {p0}, Lorg/cocos2dx/plugin/PluginWrapper;->init(Landroid/content/Context;)V

    .line 77
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getInstance()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    move-result-object v1

    invoke-static {v1}, Lorg/cocos2dx/plugin/PluginWrapper;->setGLSurfaceView(Landroid/opengl/GLSurfaceView;)V

    .line 79
    return-object v0
.end method
