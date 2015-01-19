.class Lorg/cocos2dx/plugin/MogoCreditsWall$1$1;
.super Ljava/lang/Object;
.source "MogoCreditsWall.java"

# interfaces
.implements Lmm/purchasesdk/OnPurchaseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/plugin/MogoCreditsWall$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/cocos2dx/plugin/MogoCreditsWall$1;

.field final synthetic val$payGoldNumber:I


# direct methods
.method constructor <init>(Lorg/cocos2dx/plugin/MogoCreditsWall$1;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 87
    iput-object p1, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1$1;->this$1:Lorg/cocos2dx/plugin/MogoCreditsWall$1;

    iput p2, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1$1;->val$payGoldNumber:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAfterApply()V
    .locals 0

    .prologue
    .line 148
    return-void
.end method

.method public onAfterDownload()V
    .locals 0

    .prologue
    .line 143
    return-void
.end method

.method public onBeforeApply()V
    .locals 0

    .prologue
    .line 138
    return-void
.end method

.method public onBeforeDownload()V
    .locals 0

    .prologue
    .line 133
    return-void
.end method

.method public onBillingFinish(ILjava/util/HashMap;)V
    .locals 7
    .parameter "code"
    .parameter "arg1"

    .prologue
    const/4 v6, 0x0

    .line 109
    const-string v1, "TAGS"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "runOnMainThread : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    const/16 v1, 0x66

    if-eq p1, v1, :cond_0

    const/16 v1, 0x68

    if-eq p1, v1, :cond_0

    const/16 v1, 0x3e9

    if-ne p1, v1, :cond_1

    .line 115
    :cond_0
    iget-object v1, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1$1;->this$1:Lorg/cocos2dx/plugin/MogoCreditsWall$1;

    iget-object v1, v1, Lorg/cocos2dx/plugin/MogoCreditsWall$1;->this$0:Lorg/cocos2dx/plugin/MogoCreditsWall;

    iget v2, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1$1;->val$payGoldNumber:I

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lorg/cocos2dx/plugin/MogoCreditsWall;->updateOffer(J)V

    .line 116
    invoke-static {}, Lorg/cocos2dx/plugin/MogoCreditsWall;->access$000()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1$1;->this$1:Lorg/cocos2dx/plugin/MogoCreditsWall$1;

    iget-object v2, v2, Lorg/cocos2dx/plugin/MogoCreditsWall$1;->this$0:Lorg/cocos2dx/plugin/MogoCreditsWall;

    iget-object v2, v2, Lorg/cocos2dx/plugin/MogoCreditsWall;->res:Landroid/content/res/Resources;

    const-string v3, "pay_success_title"

    const-string v4, "string"

    invoke-static {}, Lorg/cocos2dx/plugin/MogoCreditsWall;->access$000()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1$1;->val$payGoldNumber:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, result:Ljava/lang/String;
    invoke-static {}, Lorg/cocos2dx/plugin/MogoCreditsWall;->access$000()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v0, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 124
    iget-object v1, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1$1;->this$1:Lorg/cocos2dx/plugin/MogoCreditsWall$1;

    iget v1, v1, Lorg/cocos2dx/plugin/MogoCreditsWall$1;->val$points:I

    const/4 v2, 0x5

    if-ne v1, v2, :cond_1

    .line 125
    iget-object v1, p0, Lorg/cocos2dx/plugin/MogoCreditsWall$1$1;->this$1:Lorg/cocos2dx/plugin/MogoCreditsWall$1;

    iget-object v1, v1, Lorg/cocos2dx/plugin/MogoCreditsWall$1;->this$0:Lorg/cocos2dx/plugin/MogoCreditsWall;

    #calls: Lorg/cocos2dx/plugin/MogoCreditsWall;->setFirstPoint()V
    invoke-static {v1}, Lorg/cocos2dx/plugin/MogoCreditsWall;->access$200(Lorg/cocos2dx/plugin/MogoCreditsWall;)V

    .line 128
    .end local v0           #result:Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public onInitFinish(I)V
    .locals 0
    .parameter "arg0"

    .prologue
    .line 103
    return-void
.end method

.method public onQueryFinish(ILjava/util/HashMap;)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    .line 98
    return-void
.end method

.method public onUnsubscribeFinish(I)V
    .locals 0
    .parameter "arg0"

    .prologue
    .line 92
    return-void
.end method
