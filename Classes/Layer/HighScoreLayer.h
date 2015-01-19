#ifndef __HighScoreLayer__
#define __HighScoreLayer__

#include "../GameInclude.h"

class BaseSprite;

class HighScoreLayer:public CCLayer
{
private:
	BaseSprite* pHighScoreSprite;
	BaseSprite* pHighScoreBgSprite;
	CCLabelTTF* pHighScoreTTF;
	CCMenu* pMenu;

	int menuType;

	void initControl();
	void deleteControl();

	void pauseButtonClick(CCObject* pObject);
	void musicButtonClick(CCObject* pObject);
public:

	HighScoreLayer(int menuType=0);

	virtual void onEnter();
	virtual void onExit();

	void setHighScoreLabel(int num);

	void fadeIn();

	void enableClick(bool isEnable);
};

#endif