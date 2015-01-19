#ifndef __ScoreSprite__
#define __ScoreSprite__

#include "../GameInclude.h"

class AssetObject;

class BaseSprite:public CCSprite
{
private:
	AssetObject* pAssetObject;

	void initSprite();
public:

	BaseSprite(){}

	BaseSprite(string key);

	BaseSprite(const char* fileName, CCRect rect);

	CCSize getActualSize();
	void initSpriteByKey(string key);
};

#endif