/****************************************************************************
Copyright (c) 2010-2011 cocos2d-x.org

http://www.cocos2d-x.org

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
****************************************************************************/
package com.lookwan.popstar;

import mm.purchasesdk.Purchase;

import mm.purchasesdk.core.utils.LogUtil;
import org.cocos2dx.lib.Cocos2dxActivity;
import org.cocos2dx.lib.Cocos2dxGLSurfaceView;
import org.cocos2dx.plugin.PluginWrapper;

import android.os.Bundle;
import android.content.res.Resources;
import android.util.Log ;

public class PopStar extends Cocos2dxActivity{
	
	public static Purchase purchase;
	
	private IAPListener mListener;
	
	private static final String APPID ="300008392037";
	private static final String APPKEY = "30BB1BAE7A84DE74";
	
    protected void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);	
		

		mListener = new IAPListener(getApplicationContext());
		
		purchase = Purchase.getInstance();
	    Resources res = getResources();	
        int app_id = res.getIdentifier("app_id","string",getPackageName());
        int app_key = res.getIdentifier("app_key","string",getPackageName());
		try{
			LogUtil.e("PopStart",getString(app_id)+"|"+getString(app_key));
			purchase.setAppInfo(getString(app_id), getString(app_key));
			purchase.init(this,mListener);
			
		}catch(Exception ex){
			Log.e("PopStar",ex.getMessage());
			ex.printStackTrace();
		}
		
	}

    public Cocos2dxGLSurfaceView onCreateView() {
    	
    	Cocos2dxGLSurfaceView glSurfaceView = new Cocos2dxGLSurfaceView(this);

    	glSurfaceView.setEGLConfigChooser(5, 6, 5, 0, 16, 8);
    	
		PluginWrapper.init(this); 
		PluginWrapper.setGLSurfaceView(Cocos2dxGLSurfaceView.getInstance());
    	
    	return glSurfaceView;
    }

    static {
        System.loadLibrary("cocos2dcpp");
    }     
}
