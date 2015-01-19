package org.cocos2dx.plugin;

import org.cocos2dx.plugin.InterfaceCreditsWall;

import android.util.Log;

public class CreditsWallWrapper {

	public static void onCreditsWallResult(InterfaceCreditsWall obj,int ret,String msg)
	{
		final int curRet = ret;
		final String curMsg = msg;
		final InterfaceCreditsWall curObj = obj;
		
		PluginWrapper.runOnGLThread(new Runnable(){
			
			public void run()
			{
				String name = curObj.getClass().getName();
				name = name.replace('.', '/');
				
				Log.e("sdfsdfsdf", String.valueOf(curRet));
				
				nativeOnCreditsWallResult(name,curRet,curMsg);
			}
			
		});
	}
	
	private static native void nativeOnCreditsWallResult(String className,int ret,String msg);
}
