.class public Lorg/cocos2dx/plugin/AdsWrapper;
.super Ljava/lang/Object;
.source "AdsWrapper.java"


# static fields
.field public static final ADS_TYPE_BANNER:I = 0x0

.field public static final ADS_TYPE_FULL_SCREEN:I = 0x1

.field public static final POS_BOTTOM:I = 0x4

.field public static final POS_BOTTOM_LEFT:I = 0x5

.field public static final POS_BOTTOM_RIGHT:I = 0x6

.field public static final POS_CENTER:I = 0x0

.field public static final POS_TOP:I = 0x1

.field public static final POS_TOP_LEFT:I = 0x2

.field public static final POS_TOP_RIGHT:I = 0x3

.field public static final RESULT_CODE_AdsReceived:I = 0x0

.field public static final RESULT_CODE_FullScreenViewDismissed:I = 0x2

.field public static final RESULT_CODE_FullScreenViewShown:I = 0x1

.field public static final RESULT_CODE_NetworkError:I = 0x5

.field public static final RESULT_CODE_PointsSpendFailed:I = 0x4

.field public static final RESULT_CODE_PointsSpendSucceed:I = 0x3

.field public static final RESULT_CODE_UnknownError:I = 0x6


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 30
    invoke-static {p0, p1, p2}, Lorg/cocos2dx/plugin/AdsWrapper;->nativeOnAdsResult(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Ljava/lang/String;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 30
    invoke-static {p0, p1}, Lorg/cocos2dx/plugin/AdsWrapper;->nativeOnPlayerGetPoints(Ljava/lang/String;I)V

    return-void
.end method

.method public static addAdView(Landroid/view/WindowManager;Landroid/view/View;I)V
    .locals 3
    .parameter "mWm"
    .parameter "adView"
    .parameter "pos"

    .prologue
    const/4 v2, -0x2

    .line 52
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 53
    .local v0, mLayoutParams:Landroid/view/WindowManager$LayoutParams;
    const/16 v1, 0x3e8

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 54
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 55
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 56
    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit8 v1, v1, 0x8

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 58
    packed-switch p2, :pswitch_data_0

    .line 83
    :goto_0
    invoke-interface {p0, p1, v0}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    return-void

    .line 60
    :pswitch_0
    const/16 v1, 0x11

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 63
    :pswitch_1
    const/16 v1, 0x30

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 66
    :pswitch_2
    const/16 v1, 0x33

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 69
    :pswitch_3
    const/16 v1, 0x35

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 72
    :pswitch_4
    const/16 v1, 0x50

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 75
    :pswitch_5
    const/16 v1, 0x53

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 78
    :pswitch_6
    const/16 v1, 0x55

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    goto :goto_0

    .line 58
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method private static native nativeOnAdsResult(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method private static native nativeOnPlayerGetPoints(Ljava/lang/String;I)V
.end method

.method public static onAdsResult(Lorg/cocos2dx/plugin/InterfaceAds;ILjava/lang/String;)V
    .locals 4
    .parameter "adapter"
    .parameter "code"
    .parameter "msg"

    .prologue
    .line 87
    move v0, p1

    .line 88
    .local v0, curCode:I
    move-object v1, p2

    .line 89
    .local v1, curMsg:Ljava/lang/String;
    move-object v2, p0

    .line 90
    .local v2, curObj:Lorg/cocos2dx/plugin/InterfaceAds;
    new-instance v3, Lorg/cocos2dx/plugin/AdsWrapper$1;

    invoke-direct {v3, v2, v0, v1}, Lorg/cocos2dx/plugin/AdsWrapper$1;-><init>(Lorg/cocos2dx/plugin/InterfaceAds;ILjava/lang/String;)V

    invoke-static {v3}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 98
    return-void
.end method

.method public static onPlayerGetPoints(Lorg/cocos2dx/plugin/InterfaceAds;I)V
    .locals 3
    .parameter "adapter"
    .parameter "points"

    .prologue
    .line 102
    move v1, p1

    .line 103
    .local v1, curPoints:I
    move-object v0, p0

    .line 104
    .local v0, curAdapter:Lorg/cocos2dx/plugin/InterfaceAds;
    new-instance v2, Lorg/cocos2dx/plugin/AdsWrapper$2;

    invoke-direct {v2, v0, v1}, Lorg/cocos2dx/plugin/AdsWrapper$2;-><init>(Lorg/cocos2dx/plugin/InterfaceAds;I)V

    invoke-static {v2}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 112
    return-void
.end method
