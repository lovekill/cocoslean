.class public Lorg/cocos2dx/lib/Cocos2dxEditText;
.super Landroid/widget/EditText;
.source "Cocos2dxEditText.java"


# instance fields
.field private mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 47
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 55
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    return-void
.end method


# virtual methods
.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "pKeyCode"
    .parameter "pKeyEvent"

    .prologue
    .line 72
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 75
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 76
    iget-object v0, p0, Lorg/cocos2dx/lib/Cocos2dxEditText;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    invoke-virtual {v0}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->requestFocus()Z

    .line 79
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public setCocos2dxGLSurfaceView(Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;)V
    .locals 0
    .parameter "pCocos2dxGLSurfaceView"

    .prologue
    .line 63
    iput-object p1, p0, Lorg/cocos2dx/lib/Cocos2dxEditText;->mCocos2dxGLSurfaceView:Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    .line 64
    return-void
.end method
