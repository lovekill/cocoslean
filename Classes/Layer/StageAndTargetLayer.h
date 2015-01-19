#ifndef __StageAndTargetLayer__
#define __StageAndTargetLayer__

#include "../GameInclude.h"

class BaseSprite;

class StageAndTargetLayer : public CCLayer
{
private:
	BaseSprite* pStageSprite;
	BaseSprite* pStageBgSprite;
	CCLabelTTF* pStageLabel;
	
	BaseSprite* pTargetSprite;
	BaseSprite* pTargetBgSprite;
	CCLabelTTF* pTargetLabel;

	void initControl();
	void deleteControl();

public:

	StageAndTargetLayer();

	virtual void onEnter();
	virtual void onExit();

	void setStageLabel(int num);
	void setTargetLabel(int num);
};

#endif