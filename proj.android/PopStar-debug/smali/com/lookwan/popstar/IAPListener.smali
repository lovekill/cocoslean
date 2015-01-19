.class public Lcom/lookwan/popstar/IAPListener;
.super Ljava/lang/Object;
.source "IAPListener.java"

# interfaces
.implements Lmm/purchasesdk/OnPurchaseListener;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const-string v0, "IAPListener"

    iput-object v0, p0, Lcom/lookwan/popstar/IAPListener;->TAG:Ljava/lang/String;

    .line 17
    iput-object p1, p0, Lcom/lookwan/popstar/IAPListener;->mContext:Landroid/content/Context;

    .line 18
    return-void
.end method


# virtual methods
.method public onAfterApply()V
    .locals 0

    .prologue
    .line 22
    return-void
.end method

.method public onAfterDownload()V
    .locals 0

    .prologue
    .line 27
    return-void
.end method

.method public onBeforeApply()V
    .locals 0

    .prologue
    .line 32
    return-void
.end method

.method public onBeforeDownload()V
    .locals 0

    .prologue
    .line 37
    return-void
.end method

.method public onBillingFinish(ILjava/util/HashMap;)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    .line 42
    return-void
.end method

.method public onInitFinish(I)V
    .locals 3
    .parameter "arg0"

    .prologue
    .line 46
    const-string v0, "PopStar"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onInitFinish-->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lmm/purchasesdk/core/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public onQueryFinish(ILjava/util/HashMap;)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    .line 53
    return-void
.end method

.method public onUnsubscribeFinish(I)V
    .locals 0
    .parameter "arg0"

    .prologue
    .line 58
    return-void
.end method
