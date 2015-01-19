#include "BaseSprite.h"

BaseSprite::BaseSprite(string key) :
pAssetObject(NULL)
{
	pAssetObject = AssetManager::getInstance()->getAssetManagerByKey(key);
	initSprite();
}

void BaseSprite::initSprite()
{
	this->initWithFile(Game_Main_Resources_CCZ,pAssetObject->getRect());
	this->setRotation(pAssetObject->rotateAngle());
}

void BaseSprite::initSpriteByKey(string key)
{
	pAssetObject = AssetManager::getInstance()->getAssetManagerByKey(key);
	this->setTextureRect(pAssetObject->getRect());
}

CCSize BaseSprite::getActualSize()
{
	if (pAssetObject != NULL){

		return pAssetObject->contentSize;
	}
	else {

		return getContentSize();
	}
}

BaseSprite::BaseSprite(const char* fileName, CCRect rect):
pAssetObject(NULL)
{

	this->initWithFile(fileName, rect);

}