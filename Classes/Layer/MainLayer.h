#ifndef __MainLayer__
#define __MainLayer__

#include "../GameInclude.h"

class GameLayer;
class BaseLayer;

class MainLayer:public CCLayer
{
private:
	GameLayer* pGameLayer;
	CCLayerColor* pLayerColor;

	void initGameLayer();
	void initBackground();
public:
	MainLayer();

	virtual void onEnter();
	virtual void onExit();

	virtual void onEnterTransitionDidFinish();
	virtual void onExitTransitionDidStart();

	virtual void keyBackClicked();
	virtual void keyMenuClicked();

};

#endif