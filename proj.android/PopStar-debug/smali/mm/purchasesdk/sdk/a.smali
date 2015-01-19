.class public Lmm/purchasesdk/sdk/a;
.super Ljava/lang/Object;


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lmm/purchasesdk/sdk/a;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    sput-object v0, Lmm/purchasesdk/sdk/a;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static a(Ljava/lang/String;Ljava/lang/String;Lmm/purchasesdk/core/protocol/MessengerInfo;)I
    .locals 7

    const/16 v0, 0x4b0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    sget-object v1, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    const-string v2, "checkAPK 1"

    invoke-static {v1, v2}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v1

    invoke-virtual {v1}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const-string v1, "utf-8"

    invoke-interface {v3, v2, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v2

    const/4 v1, 0x0

    :goto_0
    const/4 v4, 0x1

    if-eq v2, v4, :cond_4

    packed-switch v2, :pswitch_data_0

    :cond_0
    :goto_1
    :pswitch_0
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    goto :goto_0

    :pswitch_1
    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v4, "ProgramId"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    sget-object v4, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "aProgramId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    :catch_0
    move-exception v1

    sget-object v2, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    const-string v3, "failed to read mmiap.xml excepiton. "

    invoke-static {v2, v3, v1}, Lmm/purchasesdk/core/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    :goto_2
    return v0

    :cond_1
    :try_start_1
    const-string v4, "Provider"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    sget-object v4, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "aProvider = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v1

    sget-object v2, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    const-string v3, "failed to read mmiap.xml. io excetion "

    invoke-static {v2, v3, v1}, Lmm/purchasesdk/core/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_2

    :cond_2
    :try_start_2
    const-string v4, "Mark"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "aMark = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_3
    const-string v4, "channel"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v3}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lmm/purchasesdk/sdk/a;->a:Ljava/lang/String;

    sget-object v2, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "achannel = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lmm/purchasesdk/sdk/a;->a:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v2, Lmm/purchasesdk/sdk/a;->a:Ljava/lang/String;

    invoke-virtual {p2, v2}, Lmm/purchasesdk/core/protocol/MessengerInfo;->setChannelID(Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_4
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    sget-object v1, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    const-string v2, "md5data error: "

    invoke-static {v1, v2}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    const/16 v0, 0x4b4

    goto/16 :goto_2

    :cond_5
    const/16 v0, 0x4b2

    goto/16 :goto_2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static a(Landroid/content/Context;Lmm/purchasesdk/core/protocol/MessengerInfo;)Ljava/lang/Boolean;
    .locals 8

    const/16 v7, 0x4b9

    const/16 v4, 0x44f

    const/4 v6, 0x1

    const/4 v5, 0x0

    sget-object v0, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    const-string v1, "checkAuth"

    invoke-static {v0, v1}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x3e9

    invoke-static {v0}, Lmm/purchasesdk/core/PurchaseCode;->setStatusCode(I)V

    invoke-virtual {p1}, Lmm/purchasesdk/core/protocol/MessengerInfo;->getProgramID()Ljava/lang/String;

    move-result-object v0

    const-string v1, "100000000000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lmm/purchasesdk/core/protocol/MessengerInfo;->isPaycodeStyle()I

    move-result v0

    if-ne v0, v6, :cond_0

    invoke-static {p1}, Lmm/purchasesdk/sdk/a;->a(Lmm/purchasesdk/core/protocol/MessengerInfo;)Lmm/purchasesdk/core/billing/ProductInfo;

    move-result-object v0

    invoke-virtual {p1, v0}, Lmm/purchasesdk/core/protocol/MessengerInfo;->setProductInfo(Lmm/purchasesdk/core/billing/ProductInfo;)V

    const-string v0, "0000000000"

    invoke-virtual {p1, v0}, Lmm/purchasesdk/core/protocol/MessengerInfo;->setChannelID(Ljava/lang/String;)V

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "0000000000"

    invoke-virtual {p1, v0}, Lmm/purchasesdk/core/protocol/MessengerInfo;->setChannelID(Ljava/lang/String;)V

    invoke-static {v7}, Lmm/purchasesdk/core/PurchaseCode;->setStatusCode(I)V

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    :cond_1
    invoke-static {}, Lmm/purchasesdk/fingerprint/IdentifyApp;->getPurchseCore()Lmm/purchasesdk/core/IPurchase;

    move-result-object v0

    invoke-interface {v0, p0}, Lmm/purchasesdk/core/IPurchase;->getChannelID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const/4 v0, 0x0

    if-nez v1, :cond_2

    sget-object v0, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    const-string v1, "read mmiap.xml false "

    invoke-static {v0, v1}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v4}, Lmm/purchasesdk/core/PurchaseCode;->setStatusCode(I)V

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lmm/purchasesdk/core/protocol/MessengerInfo;->getProgramID()Ljava/lang/String;

    move-result-object v2

    const-string v3, "100000000000"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    invoke-static {v1}, Lmm/purchasesdk/sdk/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-gtz v2, :cond_4

    :cond_3
    invoke-static {v4}, Lmm/purchasesdk/core/PurchaseCode;->setStatusCode(I)V

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Lmm/purchasesdk/core/protocol/MessengerInfo;->getProgramID()Ljava/lang/String;

    move-result-object v2

    const-string v3, "100000000000"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    sget-object v2, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "md5data signContent MD5 is: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-static {v4}, Lmm/purchasesdk/fingerprint/IdentifyApp;->md5([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lmm/purchasesdk/fingerprint/IdentifyApp;->md5([B)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0, p1}, Lmm/purchasesdk/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;Lmm/purchasesdk/core/protocol/MessengerInfo;)I

    move-result v0

    const/16 v2, 0x4b2

    if-eq v2, v0, :cond_5

    sget-object v1, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    const-string v2, "MD5 error: "

    invoke-static {v1, v2}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lmm/purchasesdk/core/PurchaseCode;->setStatusCode(I)V

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto/16 :goto_0

    :cond_5
    invoke-virtual {p1}, Lmm/purchasesdk/core/protocol/MessengerInfo;->getPaycode()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1, p1}, Lmm/purchasesdk/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;Lmm/purchasesdk/core/protocol/MessengerInfo;)Lmm/purchasesdk/core/billing/ProductInfo;

    move-result-object v0

    if-nez v0, :cond_6

    invoke-static {v7}, Lmm/purchasesdk/core/PurchaseCode;->setStatusCode(I)V

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto/16 :goto_0

    :cond_6
    invoke-virtual {p1, v0}, Lmm/purchasesdk/core/protocol/MessengerInfo;->setProductInfo(Lmm/purchasesdk/core/billing/ProductInfo;)V

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto/16 :goto_0
.end method

.method public static a(Landroid/content/Context;Lmm/purchasesdk/core/protocol/MessengerInfo;)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    invoke-static {}, Lmm/purchasesdk/fingerprint/IdentifyApp;->getPurchseCore()Lmm/purchasesdk/core/IPurchase;

    move-result-object v1

    invoke-interface {v1, p0}, Lmm/purchasesdk/core/IPurchase;->getChannelID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v2

    invoke-virtual {v2}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const-string v1, "utf-8"

    invoke-interface {v2, v3, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    :goto_0
    const/4 v3, 0x1

    if-eq v1, v3, :cond_1

    packed-switch v1, :pswitch_data_0

    :cond_0
    :goto_1
    :pswitch_0
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    goto :goto_0

    :pswitch_1
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v3, "channel"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lmm/purchasesdk/sdk/a;->a:Ljava/lang/String;
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    :catch_0
    move-exception v1

    sget-object v2, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    const-string v3, "failed to read mmiap.xml excepiton. "

    invoke-static {v2, v3, v1}, Lmm/purchasesdk/core/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    sput-object v0, Lmm/purchasesdk/sdk/a;->a:Ljava/lang/String;

    :goto_2
    return-object v0

    :catch_1
    move-exception v1

    sget-object v2, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    const-string v3, "failed to read mmiap.xml. io excetion "

    invoke-static {v2, v3, v1}, Lmm/purchasesdk/core/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    sput-object v0, Lmm/purchasesdk/sdk/a;->a:Ljava/lang/String;

    goto :goto_2

    :cond_1
    sget-object v0, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LOCAL ChannelID:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lmm/purchasesdk/sdk/a;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lmm/purchasesdk/sdk/a;->a:Ljava/lang/String;

    goto :goto_2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const-string v0, "<ProgramId>"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const-string v1, "<Mark>"

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v0, :cond_0

    if-gez v1, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "md5data signContent is: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "md5data signContentlength  is: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    const-string v1, " "

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    goto :goto_0
.end method

.method private static a(Ljava/lang/String;Ljava/lang/String;Lmm/purchasesdk/core/protocol/MessengerInfo;)Lmm/purchasesdk/core/billing/ProductInfo;
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0, p1, p2}, Lmm/purchasesdk/sdk/a;->b(Ljava/lang/String;Ljava/lang/String;Lmm/purchasesdk/core/protocol/MessengerInfo;)Lmm/purchasesdk/core/billing/ProductInfo;
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljavax/xml/parsers/ParserConfigurationException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Lorg/xml/sax/SAXException;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method private static a(Lmm/purchasesdk/core/protocol/MessengerInfo;)Lmm/purchasesdk/core/billing/ProductInfo;
    .locals 9

    const v8, -0x9a00

    const/high16 v4, -0x100

    new-instance v0, Lmm/purchasesdk/core/billing/ProductInfo;

    invoke-direct {v0}, Lmm/purchasesdk/core/billing/ProductInfo;-><init>()V

    new-instance v1, Lmm/purchasesdk/core/ui/ViewItemInfo;

    invoke-direct {v1}, Lmm/purchasesdk/core/ui/ViewItemInfo;-><init>()V

    const-string v2, "appname"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v2, "\u5e94\u7528\u540d\u79f0\uff1a"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mKey:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lmm/purchasesdk/core/protocol/MessengerInfo;->getAppID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    iput v4, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValueColor:I

    iget-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lmm/purchasesdk/core/billing/ProductInfo;->addKey(Ljava/lang/String;)V

    iget-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lmm/purchasesdk/core/billing/ProductInfo;->addValue(Ljava/lang/String;Lmm/purchasesdk/core/ui/ViewItemInfo;)V

    new-instance v1, Lmm/purchasesdk/core/ui/ViewItemInfo;

    invoke-direct {v1}, Lmm/purchasesdk/core/ui/ViewItemInfo;-><init>()V

    const-string v2, "provider"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v2, "\u63d0\u4f9b\u5546\uff1a"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mKey:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lmm/purchasesdk/core/protocol/MessengerInfo;->getAppID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    iput v4, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValueColor:I

    iget-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lmm/purchasesdk/core/billing/ProductInfo;->addKey(Ljava/lang/String;)V

    iget-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lmm/purchasesdk/core/billing/ProductInfo;->addValue(Ljava/lang/String;Lmm/purchasesdk/core/ui/ViewItemInfo;)V

    new-instance v1, Lmm/purchasesdk/core/ui/ViewItemInfo;

    invoke-direct {v1}, Lmm/purchasesdk/core/ui/ViewItemInfo;-><init>()V

    const-string v2, "itemname"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v2, "\u5546\u54c1\uff1a"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mKey:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lmm/purchasesdk/core/protocol/MessengerInfo;->getPaycode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    iput v4, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValueColor:I

    iget-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lmm/purchasesdk/core/billing/ProductInfo;->addKey(Ljava/lang/String;)V

    iget-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lmm/purchasesdk/core/billing/ProductInfo;->addValue(Ljava/lang/String;Lmm/purchasesdk/core/ui/ViewItemInfo;)V

    new-instance v1, Lmm/purchasesdk/core/ui/ViewItemInfo;

    invoke-direct {v1}, Lmm/purchasesdk/core/ui/ViewItemInfo;-><init>()V

    const-string v2, "itemprice"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v2, "\u5355\u4ef7\uff1a"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mKey:Ljava/lang/String;

    const-string v2, "0.1\u5143"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    iput v8, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValueColor:I

    iget-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lmm/purchasesdk/core/billing/ProductInfo;->addKey(Ljava/lang/String;)V

    iget-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lmm/purchasesdk/core/billing/ProductInfo;->addValue(Ljava/lang/String;Lmm/purchasesdk/core/ui/ViewItemInfo;)V

    new-instance v1, Lmm/purchasesdk/core/ui/ViewItemInfo;

    invoke-direct {v1}, Lmm/purchasesdk/core/ui/ViewItemInfo;-><init>()V

    const-string v2, "itemcount"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v2, "\u6570\u91cf\uff1a"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mKey:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lmm/purchasesdk/core/protocol/MessengerInfo;->getOrderCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    iput v8, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValueColor:I

    iget-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lmm/purchasesdk/core/billing/ProductInfo;->addKey(Ljava/lang/String;)V

    iget-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lmm/purchasesdk/core/billing/ProductInfo;->addValue(Ljava/lang/String;Lmm/purchasesdk/core/ui/ViewItemInfo;)V

    new-instance v1, Lmm/purchasesdk/core/ui/ViewItemInfo;

    invoke-direct {v1}, Lmm/purchasesdk/core/ui/ViewItemInfo;-><init>()V

    const-string v2, "totalprice"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v2, "\u652f\u4ed8\u91d1\u989d:"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mKey:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lmm/purchasesdk/core/protocol/MessengerInfo;->getOrderCount()I

    move-result v3

    int-to-double v4, v3

    const-wide v6, 0x3fb999999999999aL

    mul-double/2addr v4, v6

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\u5143"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    iput v8, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValueColor:I

    iget-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lmm/purchasesdk/core/billing/ProductInfo;->addKey(Ljava/lang/String;)V

    iget-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Lmm/purchasesdk/core/billing/ProductInfo;->addValue(Ljava/lang/String;Lmm/purchasesdk/core/ui/ViewItemInfo;)V

    return-object v0
.end method

.method private static a(Lorg/w3c/dom/Element;Ljava/lang/String;I)Lmm/purchasesdk/core/ui/ViewItemInfo;
    .locals 3

    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0, p2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    const/4 v1, 0x0

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Lmm/purchasesdk/fingerprint/IdentifyApp;->decryptPapaya(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lmm/purchasesdk/core/ui/ViewItemInfo;

    invoke-direct {v1}, Lmm/purchasesdk/core/ui/ViewItemInfo;-><init>()V

    const-string v2, "Provider"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "provider"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v2, "\u63d0\u4f9b\u5546:"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mKey:Ljava/lang/String;

    iput-object v0, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    :cond_0
    :goto_1
    return-object v1

    :cond_1
    const-string v2, "AppName"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "appname"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v2, "\u5e94\u7528\u540d\u79f0:"

    iput-object v2, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mKey:Ljava/lang/String;

    iput-object v0, v1, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    goto :goto_1

    :cond_2
    move-object v0, v1

    goto :goto_0
.end method

.method private static a(Lmm/purchasesdk/core/billing/ProductInfo;FLmm/purchasesdk/core/protocol/MessengerInfo;)V
    .locals 4

    const v3, -0x9a00

    new-instance v0, Lmm/purchasesdk/core/ui/ViewItemInfo;

    invoke-direct {v0}, Lmm/purchasesdk/core/ui/ViewItemInfo;-><init>()V

    const-string v1, "itemcount"

    iput-object v1, v0, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v1, "\u6570\u91cf\uff1a"

    iput-object v1, v0, Lmm/purchasesdk/core/ui/ViewItemInfo;->mKey:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lmm/purchasesdk/core/protocol/MessengerInfo;->getOrderCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    iput v3, v0, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValueColor:I

    iget-object v1, v0, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lmm/purchasesdk/core/billing/ProductInfo;->addKey(Ljava/lang/String;)V

    iget-object v1, v0, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lmm/purchasesdk/core/billing/ProductInfo;->addValue(Ljava/lang/String;Lmm/purchasesdk/core/ui/ViewItemInfo;)V

    new-instance v0, Lmm/purchasesdk/core/ui/ViewItemInfo;

    invoke-direct {v0}, Lmm/purchasesdk/core/ui/ViewItemInfo;-><init>()V

    const-string v1, "totalprice"

    iput-object v1, v0, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v1, "\u652f\u4ed8\u91d1\u989d:"

    iput-object v1, v0, Lmm/purchasesdk/core/ui/ViewItemInfo;->mKey:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Lmm/purchasesdk/core/protocol/MessengerInfo;->getOrderCount()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\u5143"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    iput v3, v0, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValueColor:I

    iget-object v1, v0, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lmm/purchasesdk/core/billing/ProductInfo;->addKey(Ljava/lang/String;)V

    iget-object v1, v0, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lmm/purchasesdk/core/billing/ProductInfo;->addValue(Ljava/lang/String;Lmm/purchasesdk/core/ui/ViewItemInfo;)V

    return-void
.end method

.method private static b(Ljava/lang/String;Ljava/lang/String;Lmm/purchasesdk/core/protocol/MessengerInfo;)Lmm/purchasesdk/core/billing/ProductInfo;
    .locals 12

    const/4 v3, 0x0

    const/high16 v11, 0x42c8

    const/4 v2, 0x0

    sget-object v0, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    const-string v1, "enter parseProductInfo"

    invoke-static {v0, v1}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v5, Lmm/purchasesdk/core/billing/ProductInfo;

    invoke-direct {v5}, Lmm/purchasesdk/core/billing/ProductInfo;-><init>()V

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/InputStream;)Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v6

    const-string v0, "appname"

    const-string v1, "AppName"

    invoke-static {v6, v1, v2}, Lmm/purchasesdk/sdk/a;->a(Lorg/w3c/dom/Element;Ljava/lang/String;I)Lmm/purchasesdk/core/ui/ViewItemInfo;

    move-result-object v1

    invoke-virtual {v5, v0, v1}, Lmm/purchasesdk/core/billing/ProductInfo;->addValue(Ljava/lang/String;Lmm/purchasesdk/core/ui/ViewItemInfo;)V

    const-string v0, "appname"

    invoke-virtual {v5, v0}, Lmm/purchasesdk/core/billing/ProductInfo;->addKey(Ljava/lang/String;)V

    const-string v0, "provider"

    const-string v1, "Provider"

    invoke-static {v6, v1, v2}, Lmm/purchasesdk/sdk/a;->a(Lorg/w3c/dom/Element;Ljava/lang/String;I)Lmm/purchasesdk/core/ui/ViewItemInfo;

    move-result-object v1

    invoke-virtual {v5, v0, v1}, Lmm/purchasesdk/core/billing/ProductInfo;->addValue(Ljava/lang/String;Lmm/purchasesdk/core/ui/ViewItemInfo;)V

    const-string v0, "provider"

    invoke-virtual {v5, v0}, Lmm/purchasesdk/core/billing/ProductInfo;->addKey(Ljava/lang/String;)V

    const-string v0, "ProductInfo"

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v7

    const/4 v4, 0x0

    move v1, v2

    :goto_0
    invoke-interface {v7}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    if-ge v1, v0, :cond_4

    const-string v0, "paycode"

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v8

    if-eqz v8, :cond_6

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-static {v0}, Lmm/purchasesdk/fingerprint/IdentifyApp;->decryptPapaya(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v8, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "paycode ="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v8, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "apaycode ="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "ProductInfo"

    invoke-interface {v6, v0}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    const-string v1, "Item"

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    sget-object v0, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "nodes.getLength() = "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v1, v4

    :goto_2
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    if-ge v2, v0, :cond_2

    invoke-interface {v3, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    check-cast v0, Lorg/w3c/dom/Element;

    const-string v4, "id"

    invoke-interface {v0, v4}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "name"

    invoke-interface {v0, v6}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "value"

    invoke-interface {v0, v7}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v7, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "id = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v7, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "name = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v7, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "value = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v7, Lmm/purchasesdk/core/ui/ViewItemInfo;

    invoke-direct {v7}, Lmm/purchasesdk/core/ui/ViewItemInfo;-><init>()V

    invoke-static {v4}, Lmm/purchasesdk/fingerprint/IdentifyApp;->decryptPapaya(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v6}, Lmm/purchasesdk/fingerprint/IdentifyApp;->decryptPapaya(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ":"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mKey:Ljava/lang/String;

    invoke-static {v0}, Lmm/purchasesdk/fingerprint/IdentifyApp;->decryptPapaya(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    sget-object v0, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "info.mID = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "info.mKey = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mKey:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "info.mValue = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v4, "itemprice"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    const-string v1, "\u5206"

    const-string v4, ""

    invoke-virtual {v0, v1, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/Integer;

    invoke-direct {v1, v0}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Integer;->floatValue()F

    move-result v4

    div-float/2addr v4, v11

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "\u5143"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Integer;->floatValue()F

    move-result v0

    div-float/2addr v0, v11

    sget-object v1, Lmm/purchasesdk/sdk/a;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Price = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v6, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValue:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lmm/purchasesdk/core/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_3
    iget-object v1, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v4, "totalprice"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v4, "itemcount"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v4, "itemprice"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    const-string v4, "renttime"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const v1, -0x9a00

    iput v1, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValueColor:I

    :goto_4
    iget-object v1, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v5, v1}, Lmm/purchasesdk/core/billing/ProductInfo;->addKey(Ljava/lang/String;)V

    iget-object v1, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mID:Ljava/lang/String;

    invoke-virtual {v5, v1, v7}, Lmm/purchasesdk/core/billing/ProductInfo;->addValue(Ljava/lang/String;Lmm/purchasesdk/core/ui/ViewItemInfo;)V

    add-int/lit8 v2, v2, 0x1

    move v1, v0

    goto/16 :goto_2

    :cond_1
    const/high16 v1, -0x100

    iput v1, v7, Lmm/purchasesdk/core/ui/ViewItemInfo;->mValueColor:I

    goto :goto_4

    :cond_2
    invoke-static {v5, v1, p2}, Lmm/purchasesdk/sdk/a;->a(Lmm/purchasesdk/core/billing/ProductInfo;FLmm/purchasesdk/core/protocol/MessengerInfo;)V

    move-object v3, v5

    :goto_5
    return-object v3

    :cond_3
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto/16 :goto_0

    :cond_4
    const/16 v0, 0x4ba

    invoke-static {v0}, Lmm/purchasesdk/core/PurchaseCode;->setStatusCode(I)V

    goto :goto_5

    :cond_5
    move v0, v1

    goto :goto_3

    :cond_6
    move-object v0, v3

    goto/16 :goto_1
.end method
