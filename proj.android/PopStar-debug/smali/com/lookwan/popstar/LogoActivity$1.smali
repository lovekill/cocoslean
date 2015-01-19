.class Lcom/lookwan/popstar/LogoActivity$1;
.super Ljava/lang/Object;
.source "LogoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lookwan/popstar/LogoActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lookwan/popstar/LogoActivity;


# direct methods
.method constructor <init>(Lcom/lookwan/popstar/LogoActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 17
    iput-object p1, p0, Lcom/lookwan/popstar/LogoActivity$1;->this$0:Lcom/lookwan/popstar/LogoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 22
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/lookwan/popstar/LogoActivity$1;->this$0:Lcom/lookwan/popstar/LogoActivity;

    const-class v2, Lcom/lookwan/popstar/PopStar;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 23
    .local v0, intent:Landroid/content/Intent;
    iget-object v1, p0, Lcom/lookwan/popstar/LogoActivity$1;->this$0:Lcom/lookwan/popstar/LogoActivity;

    invoke-virtual {v1, v0}, Lcom/lookwan/popstar/LogoActivity;->startActivity(Landroid/content/Intent;)V

    .line 24
    iget-object v1, p0, Lcom/lookwan/popstar/LogoActivity$1;->this$0:Lcom/lookwan/popstar/LogoActivity;

    invoke-virtual {v1}, Lcom/lookwan/popstar/LogoActivity;->finish()V

    .line 26
    return-void
.end method
