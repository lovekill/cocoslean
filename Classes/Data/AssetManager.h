#ifndef __AssetManager__
#define __AssetManager__

#include "../GameInclude.h"

class AssetObject : public CCObject
{
public:
	string key;
	CCString frame;
	bool rotated;
	CCSize contentSize;

	CCRect getRect();
	double rotateAngle();
};

class AssetManager
{
private:
	static AssetManager* instance;

	CCArray* pAssetObjectArray;

	AssetObject* getAssetObjectFromArray(string key);
public:
	AssetManager();

	static AssetManager* getInstance();

	void initData();

	AssetObject* getAssetManagerByKey(string key);
};

#endif