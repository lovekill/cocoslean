#include "MainLayer.h"

MainLayer::MainLayer():
pLayerColor(NULL)
{

}

void MainLayer::onEnter()
{
	CCLayer::onEnter();

	initBackground();
}

void MainLayer::onExit()
{
	CCLayer::onExit();

	setKeypadEnabled(false);

	removeChild(this->pGameLayer,true);
	removeAllChildrenWithCleanup(true);
}


void MainLayer::onEnterTransitionDidFinish()
{
	CCLayer::onEnterTransitionDidFinish();

	initGameLayer();

	setKeypadEnabled(true);
}

void MainLayer::onExitTransitionDidStart()
{
	CCLayer::onExitTransitionDidStart();
}

void MainLayer::initGameLayer()
{
	pGameLayer = new GameLayer();
	this->addChild(pGameLayer);
}

void MainLayer::initBackground()
{
	if (pLayerColor == NULL){
        UserDataManager* manager = UserDataManager::getInstance();
		pLayerColor = CCLayerColor::create(manager->getBgColor());
		this->addChild(pLayerColor);
	}

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	CCSprite* pTopBackgroundSprite = CCSprite::create(Game_Main_Resources,CCRectMake(500,0,480,100));
	CCSize topBackgroundSize = pTopBackgroundSprite->getContentSize();

	double scale = screenSize.width / topBackgroundSize.width;
	double topHeight = topBackgroundSize.height * scale;

	pTopBackgroundSprite->setScale(scale);
	pTopBackgroundSprite->setAnchorPoint(CCPointZero);
	pTopBackgroundSprite->setPosition(ccp(0,screenSize.height - topHeight));

	//this->addChild(pTopBackgroundSprite);

	CCSprite* pBottomBackgroundSprite = CCSprite::create(Game_Main_Resources,CCRectMake(500,0,480,200));

	pBottomBackgroundSprite->setScale(scale);
	pBottomBackgroundSprite->setAnchorPoint(CCPointZero);
	pBottomBackgroundSprite->setPosition(CCPointZero);

	this->addChild(pBottomBackgroundSprite);

}


void MainLayer::keyBackClicked()
{
	int tag = CCDirector::sharedDirector()->getRunningScene()->getTag();
	if(tag==29)
	{
		pGameLayer->showPauseMenu();
	}
}

void MainLayer::keyMenuClicked()
{

}