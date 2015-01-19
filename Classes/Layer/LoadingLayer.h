#ifndef __LoadingLayer__
#define __LoadingLayer__

#include "../GameInclude.h"

class LoadingLayer : public CCLayer
{
private:
	int resourcesCount;
	int loadedResourcesCount;

	void initBackground();
	
	void startLoadingResources();
	void loadingCallBack(CCObject* obj);
	void loadingCompleted();

public:
	LoadingLayer();

	virtual void onEnter();
	virtual void onExit();
};

#endif