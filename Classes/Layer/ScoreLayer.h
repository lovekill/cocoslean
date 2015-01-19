#ifndef __ScoreLayer__
#define __ScoreLayer__

#include "../GameInclude.h"

class HighScoreLayer;
class PlayingScoreLayer;
class StageAndTargetLayer;

class ScoreLayer:public CCLayer
{
private:
	CCLabelTTF* pHighScoreLabel;
	CCLabelTTF* pStageLabel;
	CCLabelTTF* pTargetLabel;
	CCLabelTTF* pScoreLabel;

	CCLabelTTF* pTipLabel;

	HighScoreLayer* pHighScoreLayer;
	PlayingScoreLayer* pPlayingScoreLayer;
	StageAndTargetLayer* pStageAndTargetLayer;

	void initLabel();
	string getString(int num);
public:

	virtual void onEnter();
	virtual void onExit();

	void setHighScoreLabel(int num);
	void setStageLabel(int num);
	void setTargetLabel(int num);
	void setScoreLabel(int num);
	void setHelpCountLabel(int num);

	void showTipLabel(char* tipStr);
	void disappearTipLabel();

	CCPoint getPlayingScorePoint();
	CCPoint getStageClearSpritePoint();
	CCPoint getStarPosition();

	void setHelpCountTarget(int num);

	bool onPlayingScoreHelpClicked(CCPoint point);

};

#endif