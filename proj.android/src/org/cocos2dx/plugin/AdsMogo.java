package org.cocos2dx.plugin;

import java.util.Hashtable;

import org.cocos2dx.lib.Cocos2dxActivity;

import org.cocos2dx.plugin.InterfaceAds;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.RelativeLayout;

public class AdsMogo implements InterfaceAds {

	
	private static Activity mContext = null;
	private WindowManager mWm = null;
	
	public AdsMogo(Context context) {
		mContext = (Activity) context;
	}
	
	@Override
	public void configDeveloperInfo(Hashtable<String, String> devInfo) {
		// TODO �Զ����ɵķ������
		
	}

	@Override
	public void showAds(int type, int sizeEnum, int pos) {
		// TODO �Զ����ɵķ������
		PluginWrapper.runOnMainThread(new Runnable() {
			
			public void run(){
				
			}
		});
		
	}

	@Override
	public void hideAds(int type) {
		// TODO �Զ����ɵķ������
		
		PluginWrapper.runOnMainThread(new Runnable(){
			
			
			public void run()
			{
				
				
			}
			
		});
		
	}

	@Override
	public void spendPoints(int points) {
		// TODO �Զ����ɵķ������
		
	}

	@Override
	public void setDebugMode(boolean debug) {
		// TODO �Զ����ɵķ������
		
	}

	@Override
	public String getSDKVersion() {
		// TODO �Զ����ɵķ������
		return "6.3.1";
	}

	@Override
	public String getPluginVersion() {
		// TODO �Զ����ɵķ������
		return "0.2.0";
	}

}
