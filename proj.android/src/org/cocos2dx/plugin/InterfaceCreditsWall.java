package org.cocos2dx.plugin;

import java.util.Hashtable;

public interface InterfaceCreditsWall {
	public final int PluginType = 5;
	
	public void configDeveloperInfo(Hashtable<String,String> cpInfo);
	public void showOffer();
	public void addCreditsWall(int num);
	public void removeCreditsWall(int num);
}
