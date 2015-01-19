#ifndef __PlayingScoreLayer__
#define  __PlayingScoreLayer__

#include "../GameInclude.h"

class BaseSprite;

class PlayingScoreLayer:public CCLayer
{
private:
	BaseSprite* pScoreSprite;
	BaseSprite* pScoreBgSprite;
	CCLabelTTF* pScoreLabel;
	CCLabelTTF* pHelpCountTargetLabel;

	CCSprite* pStarSprite;
	CCLabelTTF* pHelpCountLabel;

	void initControl();
	void deleteControl();

public:
	PlayingScoreLayer();

	virtual void onEnter();
	virtual void onExit();

	void setScoreLabel(int num);

	void setHelpCountLabel(int num);
	void setHelpCountTarget(int num);

	CCPoint getPlayingScore();
	CCPoint getStageClearScore();
	CCPoint getStarPosition();

	bool isHelpClicked(CCPoint point);
};

#endif