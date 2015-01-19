.class Lorg/cocos2dx/plugin/MogoCreditsWall$1;
.super Ljava/lang/Object;
.source "MogoCreditsWall.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/plugin/MogoCreditsWall;->showCreditsWallShop(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cocos2dx/plugin/MogoCreditsWall;

.field final synthetic val$points:I


# direct methods
.method constructor <init>(Lorg/cocos2dx/plugin/MogoCreditsWall;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 66
    iput-object p1, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1;->this$0:Lorg/cocos2dx/plugin/MogoCreditsWall;

    iput p2, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1;->val$points:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 69
    new-instance v0, Lcom/lookwan/popstar/IAPHelper;

    invoke-static {}, Lorg/cocos2dx/plugin/MogoCreditsWall;->access$000()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/lookwan/popstar/IAPHelper;-><init>(Landroid/content/Context;)V

    .line 70
    .local v0, iapHelper:Lcom/lookwan/popstar/IAPHelper;
    iget v2, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1;->val$points:I

    const/4 v3, 0x5

    if-ne v2, v3, :cond_1

    iget-object v2, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1;->this$0:Lorg/cocos2dx/plugin/MogoCreditsWall;

    #calls: Lorg/cocos2dx/plugin/MogoCreditsWall;->getFirstPoint()Z
    invoke-static {v2}, Lorg/cocos2dx/plugin/MogoCreditsWall;->access$100(Lorg/cocos2dx/plugin/MogoCreditsWall;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 71
    invoke-static {}, Lorg/cocos2dx/plugin/MogoCreditsWall;->access$000()Landroid/app/Activity;

    move-result-object v2

    const-string v3, "\u6b64\u5546\u54c1\u4ec5\u80fd\u8d2d\u4e70\u4e00\u6b21\uff0c\u8bf7\u8d2d\u4e70\u5176\u4ed6\u5546\u54c1\uff01"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 164
    :cond_0
    :goto_0
    return-void

    .line 76
    :cond_1
    iget v2, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1;->val$points:I

    invoke-virtual {v0, v2}, Lcom/lookwan/popstar/IAPHelper;->getPayGoldNumber(I)I

    move-result v1

    .line 78
    .local v1, payGoldNumber:I
    sget-object v2, Lcom/lookwan/popstar/PopStar;->purchase:Lmm/purchasesdk/Purchase;

    if-eqz v2, :cond_0

    .line 82
    :try_start_0
    const-string v2, "TAGS"

    const-string v3, "runOnMainThread"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    sget-object v2, Lcom/lookwan/popstar/PopStar;->purchase:Lmm/purchasesdk/Purchase;

    invoke-static {}, Lorg/cocos2dx/plugin/MogoCreditsWall;->access$000()Landroid/app/Activity;

    move-result-object v3

    iget v4, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1;->val$points:I

    invoke-virtual {v0, v4}, Lcom/lookwan/popstar/IAPHelper;->getPayCode(I)Ljava/lang/String;

    move-result-object v4

    iget v5, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1;->val$points:I

    invoke-virtual {v0, v5}, Lcom/lookwan/popstar/IAPHelper;->getRePay(I)I

    move-result v5

    new-instance v6, Lorg/cocos2dx/plugin/MogoCreditsWall$1$1;

    invoke-direct {v6, p0, v1}, Lorg/cocos2dx/plugin/MogoCreditsWall$1$1;-><init>(Lorg/cocos2dx/plugin/MogoCreditsWall$1;I)V

    invoke-virtual {v2, v3, v4, v5, v6}, Lmm/purchasesdk/Purchase;->order(Landroid/content/Context;Ljava/lang/String;ILmm/purchasesdk/OnPurchaseListener;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 151
    :catch_0
    move-exception v2

    goto :goto_0
.end method
