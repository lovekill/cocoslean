#include "AssetManager.h"

AssetManager* AssetManager::instance = 0;

AssetManager* AssetManager::getInstance()
{
	if(instance == 0)
		instance = new AssetManager();

	return instance;
}

AssetManager::AssetManager():
	pAssetObjectArray(NULL)
{

}

void AssetManager::initData()
{
	if(pAssetObjectArray == NULL)
	{
		pAssetObjectArray = new CCArray();

		//string plistFullPath = CCFileUtils::sharedFileUtils()->fullPathForFilename("batch.plist");

		//CCDictionary* plistDict = CCDictionary::createWithContentsOfFile("batch.plist");
		//CCDictionary* levelDict = dynamic_cast<CCDictionary*>(plistDict->objectForKey("frames"));

		//for(int i=0;i<levelDict->allKeys()->count();i++)
		//{
		//	AssetObject* pAssetObject = new AssetObject();

		//	pAssetObject->key = levelDict-
		//}
	}
}

AssetObject* AssetManager::getAssetObjectFromArray(string key)
{
	for(int i=0;i<pAssetObjectArray->count();i++)
	{
		AssetObject* pAssetObject = dynamic_cast<AssetObject*>(pAssetObjectArray->objectAtIndex(i));
		if(pAssetObject->key == key)
			return pAssetObject;
	}

	return NULL;
}

AssetObject* AssetManager::getAssetManagerByKey(string key)
{
	if(pAssetObjectArray == NULL)
		pAssetObjectArray = new CCArray();

	AssetObject* pAssetObject = getAssetObjectFromArray(key);

	if(pAssetObject!=NULL)
		return pAssetObject;
	else
	{
		pAssetObject = new AssetObject();
		pAssetObject->key = key;

		CCDictionary* plistDict = CCDictionary::createWithContentsOfFile("batch.plist");
		CCDictionary* levelDict = dynamic_cast<CCDictionary*>(plistDict->objectForKey("frames"));
		CCDictionary* assetObjectDict = dynamic_cast<CCDictionary*>(levelDict->objectForKey(key));

		const CCString* pCString = assetObjectDict->valueForKey("frame");
		pAssetObject->frame = *pCString;
		pAssetObject->rotated = assetObjectDict->valueForKey("rotated")->boolValue();
		pAssetObject->contentSize = CCSizeFromString(assetObjectDict->valueForKey("sourceSize")->getCString());
		pAssetObjectArray->addObject(pAssetObject);
	}

	return pAssetObject;
}




CCRect AssetObject::getRect()
{
	CCRect rect = CCRectFromString(this->frame.getCString());

	if(this->rotated)
	{
		rect = CCRectMake(rect.origin.x,rect.origin.y,rect.size.height,rect.size.width);
	}
	return rect;
}

double AssetObject::rotateAngle()
{
	if(this->rotated)
		return -90.0;
	else
		return 0.0;
}