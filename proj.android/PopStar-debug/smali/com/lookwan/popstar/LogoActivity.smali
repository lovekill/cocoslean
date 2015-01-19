.class public Lcom/lookwan/popstar/LogoActivity;
.super Landroid/app/Activity;
.source "LogoActivity.java"


# instance fields
.field handler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 10
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lookwan/popstar/LogoActivity;->handler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "savedInstanceState"

    .prologue
    .line 14
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 15
    invoke-virtual {p0}, Lcom/lookwan/popstar/LogoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "logo_layout"

    const-string v2, "layout"

    invoke-virtual {p0}, Lcom/lookwan/popstar/LogoActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/lookwan/popstar/LogoActivity;->setContentView(I)V

    .line 17
    iget-object v0, p0, Lcom/lookwan/popstar/LogoActivity;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/lookwan/popstar/LogoActivity$1;

    invoke-direct {v1, p0}, Lcom/lookwan/popstar/LogoActivity$1;-><init>(Lcom/lookwan/popstar/LogoActivity;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 29
    return-void
.end method
