.class final Lsafiap/framework/ui/res/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsafiap/framework/ui/res/LayoutDialog$a;


# instance fields
.field private synthetic a:Lsafiap/framework/ui/res/d;


# direct methods
.method constructor <init>(Lsafiap/framework/ui/res/d;)V
    .locals 0
    .parameter

    .prologue
    .line 317
    iput-object p1, p0, Lsafiap/framework/ui/res/e;->a:Lsafiap/framework/ui/res/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .prologue
    .line 322
    iget-object v0, p0, Lsafiap/framework/ui/res/e;->a:Lsafiap/framework/ui/res/d;

    invoke-static {v0}, Lsafiap/framework/ui/res/d;->a(Lsafiap/framework/ui/res/d;)Lsafiap/framework/ui/res/LayoutDialog$a;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 323
    iget-object v0, p0, Lsafiap/framework/ui/res/e;->a:Lsafiap/framework/ui/res/d;

    invoke-static {v0}, Lsafiap/framework/ui/res/d;->a(Lsafiap/framework/ui/res/d;)Lsafiap/framework/ui/res/LayoutDialog$a;

    move-result-object v0

    invoke-interface {v0}, Lsafiap/framework/ui/res/LayoutDialog$a;->a()V

    .line 325
    :cond_0
    return-void
.end method
