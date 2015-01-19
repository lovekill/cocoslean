#include "DialogLayer.h"

DialogLayer::DialogLayer(int dialogType)
{
	this->dialogType = dialogType;

	initDialog();
}

void DialogLayer::initDialog()
{
	switch(this->dialogType)
	{
	case 0:
		restartStageByHelp();
		break;
	case 1:
		stageHelpHasUsed();
		break;
	}
}

void DialogLayer::reInitDialog(int dialogType)
{
	this->dialogType = dialogType;

	this->removeAllChildrenWithCleanup(true);

	initDialog();
}

#pragma  region  使用帮助

void DialogLayer::restartStageByHelp()
{
	CCLayerColor* pBackground = CCLayerColor::create(ccc4(0,0,0,230));
	this->addChild(pBackground);

	CCSprite* pYesSprite = CCSprite::create("yes.png");

	CCMenuItemSprite* pYesItem = CCMenuItemSprite::create(pYesSprite,pYesSprite,pYesSprite,this,menu_selector(DialogLayer::yesClicked));
	pYesItem->setScaleX(VisibleRect::widthScale());
	pYesItem->setScaleY(VisibleRect::heightScale());

	CCSprite* pNoSprite = CCSprite::create("no.png");

	CCMenuItemSprite* pNoItem = CCMenuItemSprite::create(pNoSprite,pNoSprite,pNoSprite,this,menu_selector(DialogLayer::noClicked));
	pNoItem->setScaleX(VisibleRect::widthScale());
	pNoItem->setScaleY(VisibleRect::heightScale());

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	CCMenu* pMenu = CCMenu::create(pYesItem,pNoItem,NULL);
	pMenu->alignItemsHorizontallyWithPadding(50 * VisibleRect::widthScale());
	pMenu->setPosition(ccp(screenSize.width/2.0, screenSize.height * 2.0/5.0));

	this->addChild(pMenu);

	int helpCountTarget = UserDataManager::getInstance()->getSpendCreditsWallInPerTarget();
	int helpCount = UserDataManager::getInstance()->getHelpCount();
	char temp[100];
	sprintf(temp,"仅需10个金币即可继续打爆机！",helpCount,helpCountTarget);

	CCLabelTTF* pLabel = CCLabelTTF::create(temp,Game_Main_Font_TTF,35 * VisibleRect::widthScale(),CCSizeMake(380 * VisibleRect::widthScale(),screenSize.height/5.0),
		kCCTextAlignmentLeft,
		kCCVerticalTextAlignmentTop);
	pLabel->setPosition(ccp(screenSize.width/2.0, screenSize.height * 3.0/5.0));

	this->addChild(pLabel);
}

void DialogLayer::yesClicked(CCObject* ccObject)
{
	GameLayer* pGameLayer = dynamic_cast<GameLayer*>(this->getParent());
	pGameLayer->restartTheStage();
	pGameLayer->removeChild(this,true);
	pGameLayer->canGoback = true;
}

void DialogLayer::noClicked(CCObject* ccObject)
{
	GameLayer* pGameLayer = dynamic_cast<GameLayer*>(this->getParent());
	pGameLayer->removeChild(this,true);
	pGameLayer->canGoback = true;
	LayerTransitionManager::replaceScenceToMenuLayer();
}

#pragma  endregion 

#pragma  region 帮助使用完

void DialogLayer::stageHelpHasUsed()
{
	CCLayerColor* pBackground = CCLayerColor::create(ccc4(0,0,0,230));
	this->addChild(pBackground);

	CCSprite* pPaySprite = CCSprite::create("pay.png");

	CCMenuItemSprite* pPayItem = CCMenuItemSprite::create(pPaySprite,pPaySprite,pPaySprite,this,menu_selector(DialogLayer::payClicked));
	pPayItem->setScaleX(VisibleRect::widthScale());
	pPayItem->setScaleY(VisibleRect::heightScale());

	CCSprite* pCancelSprite = CCSprite::create("cancel.png");

	CCMenuItemSprite* pCancelItem = CCMenuItemSprite::create(pCancelSprite,pCancelSprite,pCancelSprite,this,menu_selector(DialogLayer::cancelClicked));
	pCancelItem->setScaleX(VisibleRect::widthScale());
	pCancelItem->setScaleY(VisibleRect::heightScale());

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	CCMenu* pMenu = CCMenu::create(pPayItem,pCancelItem,NULL);
	pMenu->alignItemsHorizontallyWithPadding(50);
	pMenu->setPosition(ccp(screenSize.width/2.0, screenSize.height * 2.0/5.0));

	this->addChild(pMenu);

	int needHelpCount = UserDataManager::getInstance()->getSpendCreditsWallInPerTarget();
	int helpCount = UserDataManager::getInstance()->getHelpCount();
	int getScore = 0;
	if(needHelpCount>helpCount)
		getScore = needHelpCount - helpCount;
	else
		getScore = helpCount-needHelpCount;
	char temp[100];
	sprintf(temp,"仅需10个金币即可继续打爆机！",getScore);

	CCLabelTTF* pLabel = CCLabelTTF::create(temp,Game_Main_Font_TTF,35 * VisibleRect::widthScale(),CCSizeMake(380 * VisibleRect::widthScale(),screenSize.height/5.0),
		kCCTextAlignmentLeft,
		kCCVerticalTextAlignmentTop);
	pLabel->setPosition(ccp(screenSize.width/2.0, screenSize.height * 3.0/5.0));

	this->addChild(pLabel);
}

void DialogLayer::payClicked(CCObject* ccObject)
{
	//this->removeAllChildren();
	GameLayer* pGameLayer = dynamic_cast<GameLayer*>(this->getParent());
	pGameLayer->showCreditsWallShop(10);
}

void DialogLayer::addPayInfo()
{
	CCLayerColor* pBackground = CCLayerColor::create(ccc4(0,0,0,230));
	this->addChild(pBackground);

	CCRect payRect = CCRectMake(0,0,100,30);
	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	double width = screenSize.width;
	double height = 50*VisibleRect::heightScale();

	CCSize menuSize = CCSizeMake(width,height);
	CCSize itemContentSize = CCSizeMake(80*VisibleRect::widthScale(),height);

	CCLabelTTF* pNumTTF = CCLabelTTF::create("Count",Game_Main_Font_TTF,30*VisibleRect::widthScale(),itemContentSize,kCCTextAlignmentCenter,kCCVerticalTextAlignmentCenter);
	CCMenuItemLabel* pNumItem = CCMenuItemLabel::create(pNumTTF);
	CCLabelTTF* pPriceTTF = CCLabelTTF::create("Price",Game_Main_Font_TTF,30*VisibleRect::widthScale(),itemContentSize,kCCTextAlignmentCenter,kCCVerticalTextAlignmentCenter);
	CCMenuItemLabel* pPriceItem = CCMenuItemLabel::create(pPriceTTF);
	CCLabelTTF* pPayTTF = CCLabelTTF::create("Pay",Game_Main_Font_TTF,30*VisibleRect::widthScale(),itemContentSize,kCCTextAlignmentCenter,kCCVerticalTextAlignmentCenter);
	CCMenuItemLabel* pPayItem = CCMenuItemLabel::create(pPayTTF);

	CCLabelTTF* pNum1TTF = CCLabelTTF::create("5",Game_Main_Font_TTF,30*VisibleRect::widthScale(),itemContentSize,kCCTextAlignmentCenter,kCCVerticalTextAlignmentCenter);
	CCMenuItemLabel* pNum1Item = CCMenuItemLabel::create(pNum1TTF);
	CCLabelTTF* pPrice1TTF = CCLabelTTF::create("1",Game_Main_Font_TTF,30*VisibleRect::widthScale(),itemContentSize,kCCTextAlignmentCenter,kCCVerticalTextAlignmentCenter);
	CCMenuItemLabel* pPrice1Item = CCMenuItemLabel::create(pPrice1TTF);
	CCSprite* pPaySprite1 = CCSprite::create(Game_Main_Resources,payRect);
	pPaySprite1->setContentSize(itemContentSize);
	CCMenuItemSprite* pSpriteItem1 = CCMenuItemSprite::create(pPaySprite1,pPaySprite1,pPaySprite1,this,NULL);

	CCMenu* pHeadMenu = CCMenu::create(pNumItem,pPriceItem,pPayItem,NULL);
	CCMenu* pMenu1 = CCMenu::create(pNum1Item,pPrice1Item,pSpriteItem1,NULL);

	pHeadMenu->setContentSize(menuSize);
	pMenu1->setContentSize(menuSize);

	double marginTop = screenSize.height - (screenSize.height - 2 * height)/2.0;

	pHeadMenu->setPosition(ccp(screenSize.width/2.0,marginTop));
	pMenu1->setPosition(ccp(screenSize.width/2.0,marginTop - 1* height));


	pHeadMenu->alignItemsHorizontallyWithPadding(30*VisibleRect::widthScale());
	pMenu1->alignItemsHorizontallyWithPadding(30*VisibleRect::widthScale());

	this->addChild(pHeadMenu);
	this->addChild(pMenu1);

}

void DialogLayer::cancelClicked(CCObject* ccObject)
{
	GameLayer* pGameLayer = dynamic_cast<GameLayer*>(this->getParent());

	pGameLayer->removeChild(this,true);
	pGameLayer->canGoback = true;

	LayerTransitionManager::replaceScenceToMenuLayer();
}
#pragma endregion