#include "LoadingLayer.h"

LoadingLayer::LoadingLayer()
{
	initBackground();
}

void LoadingLayer::onEnter()
{
	CCLayer::onEnter();

	startLoadingResources();
}

void LoadingLayer::onExit()
{
	CCLayer::onExit();
}

void LoadingLayer::initBackground()
{
	CCSprite* p = CCSprite::create(Game_Main_Resources_CCZ);
	p->setAnchorPoint(CCPointZero);
	p->setScale(0.5);
	addChild(p);

	//BaseSprite* pStageSprite = new BaseSprite(Game_Good);
	//pStageSprite->setPosition(ccp(200,200));
	//pStageSprite->setScale(3.0);
	//pStageSprite->setOpacity(255);
	//this->addChild(pStageSprite);
}

void LoadingLayer::startLoadingResources()
{
	loadingCallBack(NULL);
}

void LoadingLayer::loadingCallBack(CCObject* obj)
{
	loadingCompleted();
}

void LoadingLayer::loadingCompleted()
{
	//((CCLayerMultiplex*)m_pParent)->switchTo(0);
}