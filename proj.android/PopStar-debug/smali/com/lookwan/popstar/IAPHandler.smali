.class public Lcom/lookwan/popstar/IAPHandler;
.super Landroid/os/Handler;
.source "IAPHandler.java"


# static fields
.field public static final BILL_FINISH:I = 0x2711

.field public static final INIT_FINISH:I = 0x2710

.field public static final QUERY_FINISH:I = 0x2712

.field public static final UNSUB_FINISH:I = 0x2713


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/lookwan/popstar/IAPHandler;->mContext:Landroid/content/Context;

    .line 18
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 22
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 23
    iget v0, p1, Landroid/os/Message;->what:I

    .line 25
    .local v0, what:I
    return-void
.end method
