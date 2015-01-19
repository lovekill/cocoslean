.class public Lcom/lookwan/popstar/IAPHelper;
.super Ljava/lang/Object;
.source "IAPHelper.java"


# instance fields
.field private canRepay:[I

.field private mPayCode:[Ljava/lang/String;

.field private mPayGoldNumber:[I

.field private mPayMuch:[F

.field private mPayName:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 9
    .parameter "context"

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, 0x6

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "30000839203706"

    aput-object v2, v1, v5

    const-string v2, "30000839203705"

    aput-object v2, v1, v6

    const-string v2, "30000839203704"

    aput-object v2, v1, v7

    const-string v2, "30000839203703"

    aput-object v2, v1, v8

    const/4 v2, 0x4

    const-string v3, "30000839203702"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "30000839203701"

    aput-object v3, v1, v2

    iput-object v1, p0, Lcom/lookwan/popstar/IAPHelper;->mPayCode:[Ljava/lang/String;

    .line 11
    new-array v1, v4, [Ljava/lang/String;

    const-string v2, "250\u91d1\u5e01"

    aput-object v2, v1, v5

    const-string v2, "100\u91d1\u5e01"

    aput-object v2, v1, v6

    const-string v2, "50\u91d1\u5e01"

    aput-object v2, v1, v7

    const-string v2, "20\u91d1\u5e01"

    aput-object v2, v1, v8

    const/4 v2, 0x4

    const-string v3, "10\u91d1\u5e01"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "1\u91d1\u5e01"

    aput-object v3, v1, v2

    iput-object v1, p0, Lcom/lookwan/popstar/IAPHelper;->mPayName:[Ljava/lang/String;

    .line 14
    new-array v1, v4, [F

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/lookwan/popstar/IAPHelper;->mPayMuch:[F

    .line 16
    new-array v1, v4, [I

    fill-array-data v1, :array_1

    iput-object v1, p0, Lcom/lookwan/popstar/IAPHelper;->mPayGoldNumber:[I

    .line 18
    new-array v1, v4, [I

    fill-array-data v1, :array_2

    iput-object v1, p0, Lcom/lookwan/popstar/IAPHelper;->canRepay:[I

    .line 20
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "paycode"

    const-string v3, "array"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 21
    .local v0, coderId:I
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/lookwan/popstar/IAPHelper;->mPayCode:[Ljava/lang/String;

    .line 22
    return-void

    .line 14
    :array_0
    .array-data 0x4
        0x0t 0x0t 0xc8t 0x41t
        0x0t 0x0t 0x20t 0x41t
        0x0t 0x0t 0xa0t 0x40t
        0x0t 0x0t 0x0t 0x40t
        0x0t 0x0t 0x80t 0x3ft
        0xcdt 0xcct 0xcct 0x3dt
    .end array-data

    .line 16
    :array_1
    .array-data 0x4
        0xfat 0x0t 0x0t 0x0t
        0x64t 0x0t 0x0t 0x0t
        0x32t 0x0t 0x0t 0x0t
        0x14t 0x0t 0x0t 0x0t
        0xat 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
    .end array-data

    .line 18
    :array_2
    .array-data 0x4
        0x1t 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
    .end array-data
.end method


# virtual methods
.method public getPayCode(I)Ljava/lang/String;
    .locals 1
    .parameter "num"

    .prologue
    .line 25
    iget-object v0, p0, Lcom/lookwan/popstar/IAPHelper;->mPayCode:[Ljava/lang/String;

    array-length v0, v0

    if-le v0, p1, :cond_0

    if-ltz p1, :cond_0

    .line 27
    iget-object v0, p0, Lcom/lookwan/popstar/IAPHelper;->mPayCode:[Ljava/lang/String;

    aget-object v0, v0, p1

    .line 30
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPayGoldNumber(I)I
    .locals 1
    .parameter "num"

    .prologue
    .line 55
    iget-object v0, p0, Lcom/lookwan/popstar/IAPHelper;->mPayGoldNumber:[I

    array-length v0, v0

    if-le v0, p1, :cond_0

    if-ltz p1, :cond_0

    .line 57
    iget-object v0, p0, Lcom/lookwan/popstar/IAPHelper;->mPayGoldNumber:[I

    aget v0, v0, p1

    .line 60
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPayMuch(I)F
    .locals 1
    .parameter "num"

    .prologue
    .line 45
    iget-object v0, p0, Lcom/lookwan/popstar/IAPHelper;->mPayMuch:[F

    array-length v0, v0

    if-le v0, p1, :cond_0

    if-ltz p1, :cond_0

    .line 47
    iget-object v0, p0, Lcom/lookwan/popstar/IAPHelper;->mPayMuch:[F

    aget v0, v0, p1

    .line 50
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPayName(I)Ljava/lang/String;
    .locals 1
    .parameter "num"

    .prologue
    .line 35
    iget-object v0, p0, Lcom/lookwan/popstar/IAPHelper;->mPayName:[Ljava/lang/String;

    array-length v0, v0

    if-le v0, p1, :cond_0

    if-ltz p1, :cond_0

    .line 37
    iget-object v0, p0, Lcom/lookwan/popstar/IAPHelper;->mPayName:[Ljava/lang/String;

    aget-object v0, v0, p1

    .line 40
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRePay(I)I
    .locals 1
    .parameter "num"

    .prologue
    .line 65
    iget-object v0, p0, Lcom/lookwan/popstar/IAPHelper;->canRepay:[I

    array-length v0, v0

    if-le v0, p1, :cond_0

    if-ltz p1, :cond_0

    .line 67
    iget-object v0, p0, Lcom/lookwan/popstar/IAPHelper;->canRepay:[I

    aget v0, v0, p1

    .line 70
    :goto_0
    return v0

    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method
