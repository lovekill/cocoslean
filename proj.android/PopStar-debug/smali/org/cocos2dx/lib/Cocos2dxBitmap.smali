.class public Lorg/cocos2dx/lib/Cocos2dxBitmap;
.super Ljava/lang/Object;
.source "Cocos2dxBitmap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;
    }
.end annotation


# static fields
.field private static final HORIZONTALALIGN_CENTER:I = 0x3

.field private static final HORIZONTALALIGN_LEFT:I = 0x1

.field private static final HORIZONTALALIGN_RIGHT:I = 0x2

.field private static final VERTICALALIGN_BOTTOM:I = 0x2

.field private static final VERTICALALIGN_CENTER:I = 0x3

.field private static final VERTICALALIGN_TOP:I = 0x1

.field private static sContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 505
    return-void
.end method

.method private static computeTextProperty(Ljava/lang/String;IILandroid/graphics/Paint;)Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;
    .locals 12
    .parameter "pString"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "pPaint"

    .prologue
    .line 236
    invoke-virtual {p3}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v1

    .line 237
    .local v1, fm:Landroid/graphics/Paint$FontMetricsInt;
    iget v9, v1, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget v10, v1, Landroid/graphics/Paint$FontMetricsInt;->top:I

    sub-int/2addr v9, v10

    int-to-double v10, v9

    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v10

    double-to-int v2, v10

    .line 238
    .local v2, h:I
    const/4 v7, 0x0

    .line 240
    .local v7, maxContentWidth:I
    invoke-static {p0, p1, p2, p3}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->splitString(Ljava/lang/String;IILandroid/graphics/Paint;)[Ljava/lang/String;

    move-result-object v6

    .line 243
    .local v6, lines:[Ljava/lang/String;
    if-eqz p1, :cond_1

    .line 244
    move v7, p1

    .line 257
    :cond_0
    new-instance v9, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;

    invoke-direct {v9, v7, v2, v6}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;-><init>(II[Ljava/lang/String;)V

    return-object v9

    .line 247
    :cond_1
    const/4 v8, 0x0

    .line 248
    .local v8, temp:I
    move-object v0, v6

    .local v0, arr$:[Ljava/lang/String;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v5, v0, v3

    .line 249
    .local v5, line:Ljava/lang/String;
    const/4 v9, 0x0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {p3, v5, v9, v10}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v9

    invoke-static {v9}, Landroid/util/FloatMath;->ceil(F)F

    move-result v9

    float-to-int v8, v9

    .line 251
    if-le v8, v7, :cond_2

    .line 252
    move v7, v8

    .line 248
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private static computeX(Ljava/lang/String;II)I
    .locals 1
    .parameter "pText"
    .parameter "pMaxWidth"
    .parameter "pHorizontalAlignment"

    .prologue
    .line 262
    const/4 v0, 0x0

    .line 264
    .local v0, ret:I
    packed-switch p2, :pswitch_data_0

    .line 276
    :goto_0
    return v0

    .line 266
    :pswitch_0
    div-int/lit8 v0, p1, 0x2

    .line 267
    goto :goto_0

    .line 269
    :pswitch_1
    move v0, p1

    .line 270
    goto :goto_0

    .line 264
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static computeY(Landroid/graphics/Paint$FontMetricsInt;III)I
    .locals 3
    .parameter "pFontMetricsInt"
    .parameter "pConstrainHeight"
    .parameter "pTotalHeight"
    .parameter "pVerticalAlignment"

    .prologue
    .line 282
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v0, v1

    .line 284
    .local v0, y:I
    if-le p1, p2, :cond_0

    .line 285
    packed-switch p3, :pswitch_data_0

    .line 301
    :cond_0
    :goto_0
    return v0

    .line 287
    :pswitch_0
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v0, v1

    .line 288
    goto :goto_0

    .line 290
    :pswitch_1
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v1, v1

    sub-int v2, p1, p2

    div-int/lit8 v2, v2, 0x2

    add-int v0, v1, v2

    .line 292
    goto :goto_0

    .line 294
    :pswitch_2
    iget v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    neg-int v1, v1

    sub-int v2, p1, p2

    add-int v0, v1, v2

    .line 295
    goto :goto_0

    .line 285
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static createTextBitmap(Ljava/lang/String;Ljava/lang/String;IIII)V
    .locals 18
    .parameter "pString"
    .parameter "pFontName"
    .parameter "pFontSize"
    .parameter "pAlignment"
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 97
    const/high16 v3, 0x3f80

    const/high16 v4, 0x3f80

    const/high16 v5, 0x3f80

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/high16 v14, 0x3f80

    const/high16 v15, 0x3f80

    const/high16 v16, 0x3f80

    const/high16 v17, 0x3f80

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    invoke-static/range {v0 .. v17}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->createTextBitmapShadowStroke(Ljava/lang/String;Ljava/lang/String;IFFFIIIZFFFZFFFF)V

    .line 102
    return-void
.end method

.method public static createTextBitmapShadowStroke(Ljava/lang/String;Ljava/lang/String;IFFFIIIZFFFZFFFF)V
    .locals 36
    .parameter "pString"
    .parameter "pFontName"
    .parameter "pFontSize"
    .parameter "fontTintR"
    .parameter "fontTintG"
    .parameter "fontTintB"
    .parameter "pAlignment"
    .parameter "pWidth"
    .parameter "pHeight"
    .parameter "shadow"
    .parameter "shadowDX"
    .parameter "shadowDY"
    .parameter "shadowBlur"
    .parameter "stroke"
    .parameter "strokeR"
    .parameter "strokeG"
    .parameter "strokeB"
    .parameter "strokeSize"

    .prologue
    .line 111
    and-int/lit8 v13, p6, 0xf

    .line 112
    .local v13, horizontalAlignment:I
    shr-int/lit8 v28, p6, 0x4

    and-int/lit8 v25, v28, 0xf

    .line 114
    .local v25, verticalAlignment:I
    invoke-static/range {p0 .. p0}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->refactorString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 115
    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v13}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->newPaint(Ljava/lang/String;II)Landroid/graphics/Paint;

    move-result-object v19

    .line 118
    .local v19, paint:Landroid/graphics/Paint;
    const/16 v28, 0xff

    const-wide v30, 0x406fe00000000000L

    move/from16 v0, p3

    float-to-double v0, v0

    move-wide/from16 v32, v0

    mul-double v30, v30, v32

    move-wide/from16 v0, v30

    double-to-int v0, v0

    move/from16 v29, v0

    const-wide v30, 0x406fe00000000000L

    move/from16 v0, p4

    float-to-double v0, v0

    move-wide/from16 v32, v0

    mul-double v30, v30, v32

    move-wide/from16 v0, v30

    double-to-int v0, v0

    move/from16 v30, v0

    const-wide v32, 0x406fe00000000000L

    move/from16 v0, p5

    float-to-double v0, v0

    move-wide/from16 v34, v0

    mul-double v32, v32, v34

    move-wide/from16 v0, v32

    double-to-int v0, v0

    move/from16 v31, v0

    move-object/from16 v0, v19

    move/from16 v1, v28

    move/from16 v2, v29

    move/from16 v3, v30

    move/from16 v4, v31

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 120
    move-object/from16 v0, p0

    move/from16 v1, p7

    move/from16 v2, p8

    move-object/from16 v3, v19

    invoke-static {v0, v1, v2, v3}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeTextProperty(Ljava/lang/String;IILandroid/graphics/Paint;)Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;

    move-result-object v24

    .line 121
    .local v24, textProperty:Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;
    if-nez p8, :cond_2

    #getter for: Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->mTotalHeight:I
    invoke-static/range {v24 .. v24}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$000(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v10

    .line 124
    .local v10, bitmapTotalHeight:I
    :goto_0
    const/4 v8, 0x0

    .line 125
    .local v8, bitmapPaddingX:F
    const/4 v9, 0x0

    .line 126
    .local v9, bitmapPaddingY:F
    const/16 v21, 0x0

    .line 127
    .local v21, renderTextDeltaX:F
    const/16 v22, 0x0

    .line 129
    .local v22, renderTextDeltaY:F
    if-eqz p9, :cond_1

    .line 131
    const v23, -0x828283

    .line 132
    .local v23, shadowColor:I
    move-object/from16 v0, v19

    move/from16 v1, p12

    move/from16 v2, p10

    move/from16 v3, p11

    move/from16 v4, v23

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 134
    invoke-static/range {p10 .. p10}, Ljava/lang/Math;->abs(F)F

    move-result v8

    .line 135
    invoke-static/range {p11 .. p11}, Ljava/lang/Math;->abs(F)F

    move-result v9

    .line 137
    move/from16 v0, p10

    float-to-double v0, v0

    move-wide/from16 v28, v0

    const-wide/16 v30, 0x0

    cmpg-double v28, v28, v30

    if-gez v28, :cond_0

    .line 139
    move/from16 v21, v8

    .line 142
    :cond_0
    move/from16 v0, p11

    float-to-double v0, v0

    move-wide/from16 v28, v0

    const-wide/16 v30, 0x0

    cmpg-double v28, v28, v30

    if-gez v28, :cond_1

    .line 144
    move/from16 v22, v9

    .line 148
    .end local v23           #shadowColor:I
    :cond_1
    #getter for: Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->mMaxWidth:I
    invoke-static/range {v24 .. v24}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$100(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v28

    float-to-int v0, v8

    move/from16 v29, v0

    add-int v28, v28, v29

    float-to-int v0, v9

    move/from16 v29, v0

    add-int v29, v29, v10

    sget-object v30, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static/range {v28 .. v30}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 151
    .local v7, bitmap:Landroid/graphics/Bitmap;
    new-instance v11, Landroid/graphics/Canvas;

    invoke-direct {v11, v7}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 154
    .local v11, canvas:Landroid/graphics/Canvas;
    invoke-virtual/range {v19 .. v19}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v12

    .line 156
    .local v12, fontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;
    const/16 v26, 0x0

    .line 157
    .local v26, x:I
    #getter for: Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->mTotalHeight:I
    invoke-static/range {v24 .. v24}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$000(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v28

    move/from16 v0, p8

    move/from16 v1, v28

    move/from16 v2, v25

    invoke-static {v12, v0, v1, v2}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeY(Landroid/graphics/Paint$FontMetricsInt;III)I

    move-result v27

    .line 159
    .local v27, y:I
    #getter for: Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->mLines:[Ljava/lang/String;
    invoke-static/range {v24 .. v24}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$200(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)[Ljava/lang/String;

    move-result-object v17

    .line 161
    .local v17, lines:[Ljava/lang/String;
    move-object/from16 v6, v17

    .local v6, arr$:[Ljava/lang/String;
    array-length v15, v6

    .local v15, len$:I
    const/4 v14, 0x0

    .local v14, i$:I
    :goto_1
    if-ge v14, v15, :cond_3

    aget-object v16, v6, v14

    .line 163
    .local v16, line:Ljava/lang/String;
    #getter for: Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->mMaxWidth:I
    invoke-static/range {v24 .. v24}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$100(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v28

    move-object/from16 v0, v16

    move/from16 v1, v28

    invoke-static {v0, v1, v13}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeX(Ljava/lang/String;II)I

    move-result v26

    .line 164
    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v28, v0

    add-float v28, v28, v21

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v29, v0

    add-float v29, v29, v22

    move-object/from16 v0, v16

    move/from16 v1, v28

    move/from16 v2, v29

    move-object/from16 v3, v19

    invoke-virtual {v11, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 165
    #getter for: Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->mHeightPerLine:I
    invoke-static/range {v24 .. v24}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$300(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v28

    add-int v27, v27, v28

    .line 161
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .end local v6           #arr$:[Ljava/lang/String;
    .end local v7           #bitmap:Landroid/graphics/Bitmap;
    .end local v8           #bitmapPaddingX:F
    .end local v9           #bitmapPaddingY:F
    .end local v10           #bitmapTotalHeight:I
    .end local v11           #canvas:Landroid/graphics/Canvas;
    .end local v12           #fontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;
    .end local v14           #i$:I
    .end local v15           #len$:I
    .end local v16           #line:Ljava/lang/String;
    .end local v17           #lines:[Ljava/lang/String;
    .end local v21           #renderTextDeltaX:F
    .end local v22           #renderTextDeltaY:F
    .end local v26           #x:I
    .end local v27           #y:I
    :cond_2
    move/from16 v10, p8

    .line 121
    goto/16 :goto_0

    .line 170
    .restart local v6       #arr$:[Ljava/lang/String;
    .restart local v7       #bitmap:Landroid/graphics/Bitmap;
    .restart local v8       #bitmapPaddingX:F
    .restart local v9       #bitmapPaddingY:F
    .restart local v10       #bitmapTotalHeight:I
    .restart local v11       #canvas:Landroid/graphics/Canvas;
    .restart local v12       #fontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;
    .restart local v14       #i$:I
    .restart local v15       #len$:I
    .restart local v17       #lines:[Ljava/lang/String;
    .restart local v21       #renderTextDeltaX:F
    .restart local v22       #renderTextDeltaY:F
    .restart local v26       #x:I
    .restart local v27       #y:I
    :cond_3
    if-eqz p13, :cond_4

    .line 172
    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v13}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->newPaint(Ljava/lang/String;II)Landroid/graphics/Paint;

    move-result-object v20

    .line 173
    .local v20, paintStroke:Landroid/graphics/Paint;
    sget-object v28, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 174
    const/high16 v28, 0x3f00

    mul-float v28, v28, p17

    move-object/from16 v0, v20

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 175
    const/16 v28, 0xff

    move/from16 v0, p14

    float-to-int v0, v0

    move/from16 v29, v0

    move/from16 v0, v29

    mul-int/lit16 v0, v0, 0xff

    move/from16 v29, v0

    move/from16 v0, p15

    float-to-int v0, v0

    move/from16 v30, v0

    move/from16 v0, v30

    mul-int/lit16 v0, v0, 0xff

    move/from16 v30, v0

    move/from16 v0, p16

    float-to-int v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    mul-int/lit16 v0, v0, 0xff

    move/from16 v31, v0

    move-object/from16 v0, v20

    move/from16 v1, v28

    move/from16 v2, v29

    move/from16 v3, v30

    move/from16 v4, v31

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 177
    const/16 v26, 0x0

    .line 178
    #getter for: Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->mTotalHeight:I
    invoke-static/range {v24 .. v24}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$000(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v28

    move/from16 v0, p8

    move/from16 v1, v28

    move/from16 v2, v25

    invoke-static {v12, v0, v1, v2}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeY(Landroid/graphics/Paint$FontMetricsInt;III)I

    move-result v27

    .line 179
    #getter for: Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->mLines:[Ljava/lang/String;
    invoke-static/range {v24 .. v24}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$200(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)[Ljava/lang/String;

    move-result-object v18

    .line 181
    .local v18, lines2:[Ljava/lang/String;
    move-object/from16 v6, v18

    array-length v15, v6

    const/4 v14, 0x0

    :goto_2
    if-ge v14, v15, :cond_4

    aget-object v16, v6, v14

    .line 183
    .restart local v16       #line:Ljava/lang/String;
    #getter for: Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->mMaxWidth:I
    invoke-static/range {v24 .. v24}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$100(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v28

    move-object/from16 v0, v16

    move/from16 v1, v28

    invoke-static {v0, v1, v13}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->computeX(Ljava/lang/String;II)I

    move-result v26

    .line 184
    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v28, v0

    add-float v28, v28, v21

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v29, v0

    add-float v29, v29, v22

    move-object/from16 v0, v16

    move/from16 v1, v28

    move/from16 v2, v29

    move-object/from16 v3, v20

    invoke-virtual {v11, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 185
    #getter for: Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->mHeightPerLine:I
    invoke-static/range {v24 .. v24}, Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;->access$300(Lorg/cocos2dx/lib/Cocos2dxBitmap$TextProperty;)I

    move-result v28

    add-int v27, v27, v28

    .line 181
    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    .line 191
    .end local v16           #line:Ljava/lang/String;
    .end local v18           #lines2:[Ljava/lang/String;
    .end local v20           #paintStroke:Landroid/graphics/Paint;
    :cond_4
    invoke-static {v7}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->initNativeObject(Landroid/graphics/Bitmap;)V

    .line 192
    return-void
.end method

.method private static divideStringWithMaxWidth(Ljava/lang/String;ILandroid/graphics/Paint;)Ljava/util/LinkedList;
    .locals 8
    .parameter "pString"
    .parameter "pMaxWidth"
    .parameter "pPaint"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Landroid/graphics/Paint;",
            ")",
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 364
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 365
    .local v0, charLength:I
    const/4 v3, 0x0

    .line 366
    .local v3, start:I
    const/4 v5, 0x0

    .line 367
    .local v5, tempWidth:I
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 370
    .local v4, strList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    const/4 v1, 0x1

    .local v1, i:I
    :goto_0
    if-gt v1, v0, :cond_4

    .line 371
    invoke-virtual {p2, p0, v3, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v6

    invoke-static {v6}, Landroid/util/FloatMath;->ceil(F)F

    move-result v6

    float-to-int v5, v6

    .line 373
    if-lt v5, p1, :cond_3

    .line 374
    const/4 v6, 0x0

    invoke-virtual {p0, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    .line 377
    .local v2, lastIndexOfSpace:I
    const/4 v6, -0x1

    if-eq v2, v6, :cond_0

    if-le v2, v3, :cond_0

    .line 379
    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 380
    add-int/lit8 v1, v2, 0x1

    .line 393
    :goto_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x20

    if-ne v6, v7, :cond_2

    .line 394
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 383
    :cond_0
    if-le v5, p1, :cond_1

    .line 384
    add-int/lit8 v6, v1, -0x1

    invoke-virtual {p0, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 386
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 388
    :cond_1
    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 397
    :cond_2
    move v3, v1

    .line 370
    .end local v2           #lastIndexOfSpace:I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 402
    :cond_4
    if-ge v3, v0, :cond_5

    .line 403
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 406
    :cond_5
    return-object v4
.end method

.method private static getFontSizeAccordingHeight(I)I
    .locals 8
    .parameter "height"

    .prologue
    .line 464
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 465
    .local v3, paint:Landroid/graphics/Paint;
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 467
    .local v0, bounds:Landroid/graphics/Rect;
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 468
    const/4 v2, 0x1

    .line 469
    .local v2, incr_text_size:I
    const/4 v1, 0x0

    .line 471
    .local v1, found_desired_size:Z
    :goto_0
    if-nez v1, :cond_1

    .line 473
    int-to-float v5, v2

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 474
    const-string v4, "SghMNy"

    .line 475
    .local v4, text:Ljava/lang/String;
    const/4 v5, 0x0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v3, v4, v5, v6, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 477
    add-int/lit8 v2, v2, 0x1

    .line 479
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v5

    sub-int v5, p0, v5

    const/4 v6, 0x2

    if-gt v5, v6, :cond_0

    .line 480
    const/4 v1, 0x1

    .line 482
    :cond_0
    const-string v5, "font size"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "incr size:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 484
    .end local v4           #text:Ljava/lang/String;
    :cond_1
    return v2
.end method

.method private static getPixels(Landroid/graphics/Bitmap;)[B
    .locals 4
    .parameter "pBitmap"

    .prologue
    .line 451
    if-eqz p0, :cond_0

    .line 452
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    mul-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x4

    new-array v1, v2, [B

    .line 454
    .local v1, pixels:[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 455
    .local v0, buf:Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 456
    invoke-virtual {p0, v0}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 460
    .end local v0           #buf:Ljava/nio/ByteBuffer;
    .end local v1           #pixels:[B
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getStringWithEllipsis(Ljava/lang/String;FF)Ljava/lang/String;
    .locals 2
    .parameter "pString"
    .parameter "width"
    .parameter "fontSize"

    .prologue
    .line 489
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 490
    const-string v1, ""

    .line 497
    :goto_0
    return-object v1

    .line 493
    :cond_0
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 494
    .local v0, paint:Landroid/text/TextPaint;
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 495
    invoke-virtual {v0, p2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 497
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {p0, v0, p1, v1}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private static initNativeObject(Landroid/graphics/Bitmap;)V
    .locals 3
    .parameter "pBitmap"

    .prologue
    .line 441
    invoke-static {p0}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->getPixels(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    .line 442
    .local v0, pixels:[B
    if-nez v0, :cond_0

    .line 448
    :goto_0
    return-void

    .line 446
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-static {v1, v2, v0}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->nativeInitBitmapDC(II[B)V

    goto :goto_0
.end method

.method private static native nativeInitBitmapDC(II[B)V
.end method

.method private static newPaint(Ljava/lang/String;II)Landroid/graphics/Paint;
    .locals 7
    .parameter "pFontName"
    .parameter "pFontSize"
    .parameter "pHorizontalAlignment"

    .prologue
    const/4 v6, 0x0

    .line 196
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 197
    .local v1, paint:Landroid/graphics/Paint;
    const/4 v3, -0x1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 198
    int-to-float v3, p1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 199
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 202
    const-string v3, ".ttf"

    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 204
    :try_start_0
    sget-object v3, Lorg/cocos2dx/lib/Cocos2dxBitmap;->sContext:Landroid/content/Context;

    invoke-static {v3, p0}, Lorg/cocos2dx/lib/Cocos2dxTypefaces;->get(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    .line 206
    .local v2, typeFace:Landroid/graphics/Typeface;
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 218
    .end local v2           #typeFace:Landroid/graphics/Typeface;
    :goto_0
    packed-switch p2, :pswitch_data_0

    .line 227
    sget-object v3, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 231
    :goto_1
    return-object v1

    .line 207
    :catch_0
    move-exception v0

    .line 208
    .local v0, e:Ljava/lang/Exception;
    const-string v3, "Cocos2dxBitmap"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "error to create ttf type face: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    invoke-static {p0, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_0

    .line 215
    .end local v0           #e:Ljava/lang/Exception;
    :cond_0
    invoke-static {p0, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_0

    .line 220
    :pswitch_0
    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_1

    .line 223
    :pswitch_1
    sget-object v3, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_1

    .line 218
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static refactorString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "pString"

    .prologue
    .line 411
    const-string v3, ""

    invoke-virtual {p0, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    .line 412
    const-string v3, " "

    .line 437
    :goto_0
    return-object v3

    .line 419
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 420
    .local v2, strBuilder:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 421
    .local v1, start:I
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 422
    .local v0, index:I
    :goto_1
    const/4 v3, -0x1

    if-eq v0, v3, :cond_2

    .line 423
    if-eqz v0, :cond_1

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v3

    const/16 v4, 0xa

    if-ne v3, v4, :cond_3

    .line 424
    :cond_1
    const-string v3, " "

    invoke-virtual {v2, v1, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    add-int/lit8 v1, v0, 0x2

    .line 430
    :goto_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-gt v1, v3, :cond_2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-ne v0, v3, :cond_4

    .line 437
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 427
    :cond_3
    add-int/lit8 v1, v0, 0x1

    goto :goto_2

    .line 434
    :cond_4
    const-string v3, "\n"

    invoke-virtual {v2, v3, v1}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_1
.end method

.method public static setContext(Landroid/content/Context;)V
    .locals 0
    .parameter "pContext"

    .prologue
    .line 72
    sput-object p0, Lorg/cocos2dx/lib/Cocos2dxBitmap;->sContext:Landroid/content/Context;

    .line 73
    return-void
.end method

.method private static splitString(Ljava/lang/String;IILandroid/graphics/Paint;)[Ljava/lang/String;
    .locals 16
    .parameter "pString"
    .parameter "pMaxWidth"
    .parameter "pMaxHeight"
    .parameter "pPaint"

    .prologue
    .line 310
    const-string v14, "\\n"

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 311
    .local v10, lines:[Ljava/lang/String;
    const/4 v12, 0x0

    .line 312
    .local v12, ret:[Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v3

    .line 313
    .local v3, fm:Landroid/graphics/Paint$FontMetricsInt;
    iget v14, v3, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iget v15, v3, Landroid/graphics/Paint$FontMetricsInt;->top:I

    sub-int/2addr v14, v15

    int-to-double v14, v14

    invoke-static {v14, v15}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v14

    double-to-int v4, v14

    .line 314
    .local v4, heightPerLine:I
    div-int v11, p2, v4

    .line 316
    .local v11, maxLines:I
    if-eqz p1, :cond_4

    .line 317
    new-instance v13, Ljava/util/LinkedList;

    invoke-direct {v13}, Ljava/util/LinkedList;-><init>()V

    .line 318
    .local v13, strList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    move-object v2, v10

    .local v2, arr$:[Ljava/lang/String;
    array-length v7, v2

    .local v7, len$:I
    const/4 v6, 0x0

    .local v6, i$:I
    :goto_0
    if-ge v6, v7, :cond_0

    aget-object v8, v2, v6

    .line 323
    .local v8, line:Ljava/lang/String;
    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v14

    invoke-static {v14}, Landroid/util/FloatMath;->ceil(F)F

    move-result v14

    float-to-int v9, v14

    .line 325
    .local v9, lineWidth:I
    move/from16 v0, p1

    if-le v9, v0, :cond_1

    .line 326
    move/from16 v0, p1

    move-object/from16 v1, p3

    invoke-static {v8, v0, v1}, Lorg/cocos2dx/lib/Cocos2dxBitmap;->divideStringWithMaxWidth(Ljava/lang/String;ILandroid/graphics/Paint;)Ljava/util/LinkedList;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 333
    :goto_1
    if-lez v11, :cond_2

    invoke-virtual {v13}, Ljava/util/LinkedList;->size()I

    move-result v14

    if-lt v14, v11, :cond_2

    .line 339
    .end local v8           #line:Ljava/lang/String;
    .end local v9           #lineWidth:I
    :cond_0
    if-lez v11, :cond_3

    invoke-virtual {v13}, Ljava/util/LinkedList;->size()I

    move-result v14

    if-le v14, v11, :cond_3

    .line 340
    :goto_2
    invoke-virtual {v13}, Ljava/util/LinkedList;->size()I

    move-result v14

    if-le v14, v11, :cond_3

    .line 341
    invoke-virtual {v13}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    goto :goto_2

    .line 329
    .restart local v8       #line:Ljava/lang/String;
    .restart local v9       #lineWidth:I
    :cond_1
    invoke-virtual {v13, v8}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 318
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 345
    .end local v8           #line:Ljava/lang/String;
    .end local v9           #lineWidth:I
    :cond_3
    invoke-virtual {v13}, Ljava/util/LinkedList;->size()I

    move-result v14

    new-array v12, v14, [Ljava/lang/String;

    .line 346
    invoke-virtual {v13, v12}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 359
    .end local v2           #arr$:[Ljava/lang/String;
    .end local v6           #i$:I
    .end local v7           #len$:I
    .end local v13           #strList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    :goto_3
    return-object v12

    .line 347
    :cond_4
    if-eqz p2, :cond_6

    array-length v14, v10

    if-le v14, v11, :cond_6

    .line 349
    new-instance v13, Ljava/util/LinkedList;

    invoke-direct {v13}, Ljava/util/LinkedList;-><init>()V

    .line 350
    .restart local v13       #strList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    const/4 v5, 0x0

    .local v5, i:I
    :goto_4
    if-ge v5, v11, :cond_5

    .line 351
    aget-object v14, v10, v5

    invoke-virtual {v13, v14}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 350
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 353
    :cond_5
    invoke-virtual {v13}, Ljava/util/LinkedList;->size()I

    move-result v14

    new-array v12, v14, [Ljava/lang/String;

    .line 354
    invoke-virtual {v13, v12}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    goto :goto_3

    .line 356
    .end local v5           #i:I
    .end local v13           #strList:Ljava/util/LinkedList;,"Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_6
    move-object v12, v10

    goto :goto_3
.end method
