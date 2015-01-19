#include "MenuLayer.h"

MenuLayer::MenuLayer():
pSpriteLogo(NULL),
	pMenu(NULL),
	pHighScoreLayer(NULL),
	pAdviceAndOffer(NULL),
	pCreditsWall(NULL),
	pLayerColor(NULL),
	protocol(NULL)
{
	initCreditsWall();

	if (pLayerColor == NULL){
        UserDataManager* manager = UserDataManager::getInstance();
		pLayerColor = CCLayerColor::create(manager->getBgColor());
		this->addChild(pLayerColor);
	}

}

void MenuLayer::onEnter()
{
	
	CCLayer::onEnter();

	marginTop = 60 * VisibleRect::heightScale();
	pAudioManager = new AudioManager();
	pAudioManager->preLoadAudio();
	UserDataManager::getInstance()->initData();

	//initMenuScene();

	scheduleOnce(schedule_selector(MenuLayer::initMenuScene),1/60.0);

	setKeypadEnabled(true);

}

void MenuLayer::onExit()
{
	CCLayer::onExit();

	setKeypadEnabled(false);
	this->unschedule(schedule_selector(MenuLayer::showExplosionParticle));

	delete pAudioManager;
	removeChild(this->pParticleBatchNode,true);
	removeChild(this->pHighScoreLayer,true);
	removeChild(this->pMenu,true);
	removeChild(this->pAdviceAndOffer,true);
}

void MenuLayer::initMenuScene(float dt)
{
	initMenuLogo();
	initMenuBotton();
	initBackground();
	showHighScoreLayer();
	initAdviceAndOfferButton();

	pParticleBatchNode = CCParticleBatchNode::create(Game_Main_Resources);
	this->addChild(pParticleBatchNode);

}

void MenuLayer::showParticle(float dt)
{

}

void MenuLayer::initMenuLogo()
{
	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	if(pSpriteLogo == NULL)
	{
		pSpriteLogo = CCSprite::create(Game_Main_Resources,CCRectMake(0,0,450,300));
	}

	CCSize spriteLogoSize = pSpriteLogo->getContentSize();
}

void MenuLayer::initMenuBotton()
{
	CCMenuItemSprite* pLogoItem = CCMenuItemSprite::create(pSpriteLogo,pSpriteLogo,pSpriteLogo,this,NULL);
	pLogoItem->setScaleX(VisibleRect::widthScale());
	pLogoItem->setScaleY(VisibleRect::heightScale());

	//BaseSprite* pNewGameSprite = new BaseSprite(Game_NewGame);
	//pNewGameSprite->autorelease();
	//pNewGameSprite->setContentSize(pNewGameSprite->getActualSize());
	//pNewGameSprite->setPosition(ccp(pNewGameSprite->getActualSize().width,0));
	
	BaseSprite* pNewGameSprite = new BaseSprite(Game_Main_Resources,CCRectMake(0,346,275,68));
	pNewGameSprite->autorelease();

	CCMenuItemSprite* pNewGameItem = CCMenuItemSprite::create(pNewGameSprite,pNewGameSprite,pNewGameSprite,this,menu_selector(MenuLayer::newGameClicked));
	pNewGameItem->setScaleX(VisibleRect::widthScale());
	pNewGameItem->setScaleY(VisibleRect::heightScale());

	BaseSprite* pContinueGameSprite;
	if (UserDataManager::getInstance()->getCanContinue()){
		/*pContinueGameSprite = new BaseSprite(Game_Resume);*/
		pContinueGameSprite = new BaseSprite(Game_Main_Resources,CCRectMake(0,411,275,68));
	}
	else
	{
		//pContinueGameSprite = new BaseSprite(Game_Resume2);
		pContinueGameSprite = new BaseSprite(Game_Main_Resources, CCRectMake(500, 650, 275, 68));

	}

	pContinueGameSprite->autorelease();
	CCMenuItemSprite* pContinueGameItem = CCMenuItemSprite::create(pContinueGameSprite,pContinueGameSprite,pContinueGameSprite,this,menu_selector(MenuLayer::continueGameClicked));
	pContinueGameItem->setScaleX(VisibleRect::widthScale());
	pContinueGameItem->setScaleY(VisibleRect::heightScale());

	/*BaseSprite* pExitSprite = new BaseSprite(Game_ExitGame);*/
	BaseSprite* pExitSprite = new BaseSprite(Game_Main_Resources,CCRectMake(0,480,275,68));
	CCMenuItemSprite* pExitItem = CCMenuItemSprite::create(pExitSprite,pExitSprite,pExitSprite,this,menu_selector(MenuLayer::gameExit));
	pExitItem->setScaleX(VisibleRect::widthScale());
	pExitItem->setScaleY(VisibleRect::heightScale());

	if(pMenu == NULL)
	{
		pMenu = CCMenu::create(pLogoItem,pNewGameItem,pContinueGameItem,pExitItem,NULL);
		this->addChild(pMenu,100);
	}

	pMenu->alignItemsVerticallyWithPadding(40*VisibleRect::heightScale());

	CCPoint logoPosition = pSpriteLogo->getPosition();
	CCSize logoSize = pSpriteLogo->getContentSize();

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	double pMenuHeight = 620*VisibleRect::heightScale();

	pMenu->setContentSize(CCSizeMake(screenSize.width,pMenuHeight));
	pMenu->setPosition(ccp(screenSize.width / 2.0 , screenSize.height/2.0 - pMenuHeight/2.0 - marginTop + screenSize.height/2.0));


	CCPoint newGamePosition = pNewGameItem->getPosition();
	pNewGameItem->setPosition(ccp(newGamePosition.x,screenSize.height));
	pNewGameItem->runAction(CCEaseElasticOut::create(CCMoveTo::create(1.5, newGamePosition), 0.35f));

	CCPoint continuePosition = pContinueGameItem->getPosition();
	pContinueGameItem->setPosition(ccp(continuePosition.x,screenSize.height));
	pContinueGameItem->runAction(CCEaseElasticOut::create(CCMoveTo::create(1.0, continuePosition), 0.35f));

	CCPoint exitPosition = pExitItem->getPosition();
	pExitItem->setPosition(ccp(exitPosition.x,screenSize.height));
	pExitItem->runAction(CCEaseElasticOut::create(CCMoveTo::create(0.8, exitPosition), 0.35f));
}

void MenuLayer::showHighScoreLayer()
{
	if(pHighScoreLayer == NULL)
	{
		pHighScoreLayer =new HighScoreLayer(1);
		this->addChild(pHighScoreLayer);
	}
	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	pHighScoreLayer->setScaleX(VisibleRect::widthScale());
	pHighScoreLayer->setScaleY(VisibleRect::heightScale());

	double eachLayerHeight = 14 * VisibleRect::heightScale();// 28 * VisibleRect::heightScale();
	pHighScoreLayer->setContentSize(CCSizeMake(screenSize.width , eachLayerHeight));

	double left = (screenSize.width * VisibleRect::widthScale() - screenSize.width)/2.0;
	double top = screenSize.height - marginTop - eachLayerHeight * 2/3.0;
	pHighScoreLayer->setPosition(ccp(left,screenSize.height + 50 * VisibleRect::heightScale() ));

	CCActionInterval* pMoveTo = CCMoveTo::create(0.4,ccp(left,top));
	CCSequence* pSequence = CCSequence::create(CCDelayTime::create(0.8),pMoveTo,NULL);
	pHighScoreLayer->runAction(pSequence);

	pHighScoreLayer->setHighScoreLabel(UserDataManager::getInstance()->getMaxScore());

}

void MenuLayer::newGameClicked(CCObject* ccObject)
{
	UserDataManager::getInstance()->setContinue(false);

	LayerTransitionManager::replaceScenceToMainLayer();
}

void MenuLayer::continueGameClicked(CCObject* ccObject)
{
	if(UserDataManager::getInstance()->getCanContinue())
	{
		UserDataManager::getInstance()->setContinue(true);
		LayerTransitionManager::replaceScenceToMainLayer();
	}
}

void MenuLayer::initBackground()
{
	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	CCSprite* pTopBackgroundSprite = CCSprite::create(Game_Main_Resources,CCRectMake(500,0,480,100));
	CCSize topBackgroundSize = pTopBackgroundSprite->getContentSize();

	double scale = screenSize.width / topBackgroundSize.width;
	double topHeight = topBackgroundSize.height * scale;

	pTopBackgroundSprite->setScale(scale);
	pTopBackgroundSprite->setAnchorPoint(CCPointZero);
	pTopBackgroundSprite->setPosition(ccp(0,screenSize.height - topHeight));

	/*this->addChild(pTopBackgroundSprite);*/

	CCSprite* pBottomBackgroundSprite = CCSprite::create(Game_Main_Resources,CCRectMake(500,0,480,200));

	pBottomBackgroundSprite->setScale(scale);
	pBottomBackgroundSprite->setAnchorPoint(CCPointZero);
	pBottomBackgroundSprite->setPosition(CCPointZero);

	this->addChild(pBottomBackgroundSprite);

}

void MenuLayer::showExplosionParticle(float dt)
{
	CCParticleSystemQuad* pParticleSystem = CCParticleExplosion::create();
	pParticleSystem->setTextureWithRect(this->pParticleBatchNode->getTexture(),CCRectMake(900,600,29,29));
	this->pParticleBatchNode->addChild(pParticleSystem);
	pParticleSystem->setAutoRemoveOnFinish(true);
	pParticleSystem->setStartSize(15 * VisibleRect::widthScale());
	pParticleSystem->setEndSize(2 * VisibleRect::widthScale());
	pParticleSystem->setLife(1.0);
	pParticleSystem->setTotalParticles(100);

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	double left = double(rand()%int(screenSize.width));
	double top = screenSize.height/2.0 + double(rand()%int(screenSize.height/2.0));

	pParticleSystem->setPosition(ccp(left,top));

	pAudioManager->playFireAudio();
}

void MenuLayer::keyBackClicked()
{
	int tag = CCDirector::sharedDirector()->getRunningScene()->getTag();
	if(tag==1)
	{
		CCDirector::sharedDirector()->end();
	}
}

void MenuLayer::gameExit(CCObject* ccObject)
{
	CCDirector::sharedDirector()->end();
	//CCLog("exit") ;
	//this->protocol->exit();
}

void MenuLayer::keyMenuClicked()
{

}

void MenuLayer::initAdviceAndOfferButton()
{
	if(pAdviceAndOffer == NULL)
	{
		CCSprite* pAdvice = CCSprite::create(Game_Advice);
		CCMenuItemSprite* pAdviceItem = CCMenuItemSprite::create(pAdvice,pAdvice,pAdvice,this,menu_selector(MenuLayer::adviceClicked));
		pAdviceItem->setScaleX(VisibleRect::widthScale());
		pAdviceItem->setScaleY(VisibleRect::heightScale());

		CCSprite* pOffer = CCSprite::create(Game_Offer);
		CCMenuItemSprite* pOfferItem = CCMenuItemSprite::create(pOffer,pOffer,pOffer,this,menu_selector(MenuLayer::offerClicked));
		pOfferItem->setScaleX(VisibleRect::widthScale());
		pOfferItem->setScaleY(VisibleRect::heightScale());

		pAdviceAndOffer = CCMenu::create(pOfferItem, pAdviceItem, NULL);
		pAdviceAndOffer->alignItemsHorizontallyWithPadding(10);

		CCSize screenSize = CCDirector::sharedDirector()->getWinSize();
		double height = pAdvice->getContentSize().height * VisibleRect::heightScale()+2;
		double width = pAdvice->getContentSize().width * VisibleRect::widthScale() + 14;

		pAdviceAndOffer->setContentSize(CCSizeMake(width,height));
		pAdviceAndOffer->setAnchorPoint(CCPointZero);
		pAdviceAndOffer->setPosition(ccp(screenSize.width - width,height/2.0));

		this->addChild(pAdviceAndOffer);
	}
}

void MenuLayer::adviceClicked(CCObject* ccObject)
{
	//if(this->pCreditsWall!=NULL)
	//{
	//	this->pCreditsWall->showAdviceDialog();
	
//}

	enableClick(false);

	ShopLayer* pShopLayer = ShopLayer::create();
	pShopLayer->setShopProtocol(this->pCreditsWall);
	this->addChild(pShopLayer, 10000);

}

void MenuLayer::offerClicked(CCObject* ccObject)
{

	showAboutLayer();

	//if(this->pCreditsWall!=NULL)
	//{
	//	this->pCreditsWall->showCreditsWallShop(50);
	//}
}

void MenuLayer::initCreditsWall()
{
	this->pCreditsWall = dynamic_cast<cocos2d::plugin::ProtocolCreditsWall*>(PluginManager::getInstance()->loadPlugin("MogoCreditsWall"));

	MenuCreditsLisener* m_MYListerner = new MenuCreditsLisener();
	m_MYListerner->setGameLayer(this);
	this->pCreditsWall->setCreditsWallListener(m_MYListerner);
}

void MenuLayer::showAboutLayer(){

	enableClick(false);

	AboutLayer* pAboutLayer = AboutLayer::create();

	this->addChild(pAboutLayer, 10000);

}

void MenuLayer::enableClick(bool isEnable){

	if (pHighScoreLayer != NULL){
		pHighScoreLayer->enableClick(isEnable);
	}

	if (isEnable){

		if (pMenu != NULL){
			pMenu->setTouchEnabled(true);
		}

		if (pAdviceAndOffer != NULL){
			pAdviceAndOffer->setTouchEnabled(true);
		}

	}
	else {

		if (pMenu != NULL){
			pMenu->setTouchEnabled(false);
		}

		if (pAdviceAndOffer != NULL){
			pAdviceAndOffer->setTouchEnabled(false);
		}

	}

}

void MenuLayer::saveData(int coinCount){

	UserDataManager::getInstance()->addCoin(coinCount);
}

void MenuCreditsLisener::onCreditsWallResult(const char* msg, int ret)
{
	cocos2d::plugin::PluginUtils::outputLog("onCreditsWallResult", msg);
	(dynamic_cast<MenuLayer*>(this->pGameLayer))->saveData(ret);
}

void MenuCreditsLisener::setGameLayer(CCNode* pGameLayer)
{
	this->pGameLayer = pGameLayer;
}