.class public Lcom/ccit/mmwlan/vo/IPDress_ForPad;
.super Ljava/lang/Object;
.source "IPDress_ForPad.java"


# instance fields
.field private strApplySecCertIP:Ljava/lang/String;

.field private strDeviceOuthIp:Ljava/lang/String;

.field private strGetDeviceName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getStrApplySecCertIP()Ljava/lang/String;
    .locals 1

    .prologue
    .line 10
    iget-object v0, p0, Lcom/ccit/mmwlan/vo/IPDress_ForPad;->strApplySecCertIP:Ljava/lang/String;

    return-object v0
.end method

.method public getStrDeviceOuthIp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/ccit/mmwlan/vo/IPDress_ForPad;->strDeviceOuthIp:Ljava/lang/String;

    return-object v0
.end method

.method public getStrGetDeviceName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/ccit/mmwlan/vo/IPDress_ForPad;->strGetDeviceName:Ljava/lang/String;

    return-object v0
.end method

.method public setStrApplySecCertIP(Ljava/lang/String;)V
    .locals 0
    .parameter "strApplySecCertIP"

    .prologue
    .line 20
    iput-object p1, p0, Lcom/ccit/mmwlan/vo/IPDress_ForPad;->strApplySecCertIP:Ljava/lang/String;

    .line 21
    return-void
.end method

.method public setStrDeviceOuthIp(Ljava/lang/String;)V
    .locals 0
    .parameter "strDeviceOuthIp"

    .prologue
    .line 34
    iput-object p1, p0, Lcom/ccit/mmwlan/vo/IPDress_ForPad;->strDeviceOuthIp:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public setStrGetDeviceName(Ljava/lang/String;)V
    .locals 0
    .parameter "strGetDeviceName"

    .prologue
    .line 48
    iput-object p1, p0, Lcom/ccit/mmwlan/vo/IPDress_ForPad;->strGetDeviceName:Ljava/lang/String;

    .line 49
    return-void
.end method
