#include "HighScoreLayer.h"

HighScoreLayer::HighScoreLayer(int menuType):
	pHighScoreSprite(NULL),
	pHighScoreBgSprite(NULL),
	pHighScoreTTF(NULL),
	menuType(0),
	pMenu(NULL)
{
	this->menuType = menuType;
}

void HighScoreLayer::onEnter()
{
	CCLayer::onEnter();

	initControl();
}

void HighScoreLayer::onExit()
{
	CCLayer::onExit();


}

void HighScoreLayer::initControl()
{
	CCSize layerSize = CCSizeMake(480,this->getContentSize().height * 0.8);

	if(pHighScoreSprite == NULL)
	{
		/*pHighScoreSprite = new BaseSprite(Game_MaxScore);*/
		pHighScoreSprite = new BaseSprite(Game_Main_Resources,CCRectMake(0,550,180,50));
		this->addChild(pHighScoreSprite);
	}

	if(pHighScoreBgSprite == NULL)
	{
	/*	pHighScoreBgSprite = new BaseSprite(Game_MaxScoreBg);*/
		pHighScoreBgSprite = new BaseSprite(Game_Main_Resources,CCRectMake(0,600,220,50));
		this->addChild(pHighScoreBgSprite);
	}

	if(pHighScoreTTF == NULL)
	{
		pHighScoreTTF = CCLabelTTF::create("0",Game_Main_Font_TTF,25);
		this->addChild(pHighScoreTTF);
	}

	pHighScoreSprite->setScale(DEFAULT_SCORE_LAYER_SCALE_SIZE);
	pHighScoreBgSprite->setScale(DEFAULT_SCORE_LAYER_SCALE_SIZE);

	CCSize highScoreSpriteSize = pHighScoreSprite->getActualSize() * DEFAULT_SCORE_LAYER_SCALE_SIZE;
	CCSize highScoreBgSpriteSize = pHighScoreBgSprite->getActualSize() * DEFAULT_SCORE_LAYER_SCALE_SIZE;
	CCSize highScoreLabelSize = pHighScoreTTF->getContentSize();

	double highScoreSpriteMarginLeft = highScoreSpriteSize.width / 2.0 - 5;
	double highScoreSpriteMarginTop = layerSize.height / 2.0;

	double highScoreBgSpriteMarginLeft = highScoreSpriteMarginLeft + highScoreBgSpriteSize.width / 2.0 + highScoreSpriteSize.width / 2.0;
	double hightScoreBgSpriteMarginTop = layerSize.height / 2.0;

	double highScoreLabelMarginLeft = highScoreBgSpriteMarginLeft;
	double highScoreLabelMarginTop = layerSize.height / 2.0;

	pHighScoreSprite->setPosition(ccp(highScoreSpriteMarginLeft,highScoreSpriteMarginTop));
	pHighScoreBgSprite->setPosition(ccp(highScoreBgSpriteMarginLeft,hightScoreBgSpriteMarginTop));
	pHighScoreTTF->setPosition(ccp(highScoreLabelMarginLeft,highScoreLabelMarginTop));

	BaseSprite* pClose = new BaseSprite(Game_Pause);
	CCMenuItemSprite* pMenuItem = CCMenuItemSprite::create(pClose,pClose,pClose,this,menu_selector(HighScoreLayer::pauseButtonClick));

	CCSize menuSize = pClose->getActualSize();

	if(menuType==1)
	{
		delete pMenuItem;
		BaseSprite* pAudio;

		bool muteResult = UserDataManager::getInstance()->getMute();
		if(muteResult)
		{
			/*pAudio = new BaseSprite(Game_Sound2);*/
			pAudio = new BaseSprite(Game_Main_Resources,CCRectMake(50,650,50,50));
		}
		else{
			/*pAudio = new BaseSprite(Game_Sound);*/
			pAudio = new BaseSprite(Game_Main_Resources, CCRectMake(0,650,50,50));
		}

		menuSize = pAudio->getActualSize();

		pAudio->setContentSize(menuSize);
		pMenuItem = CCMenuItemSprite::create(pAudio,pAudio,pAudio,this,menu_selector(HighScoreLayer::musicButtonClick));
	}

	delete pMenu;
	pMenu = CCMenu::create(pMenuItem,NULL);
	pMenu->setContentSize(menuSize);
	double pMenuLeft = layerSize.width - (layerSize.width - (highScoreLabelMarginLeft+highScoreBgSpriteSize.width/2.0))/2.0;
	pMenu->setPosition(ccp(pMenuLeft,highScoreLabelMarginTop+2));
	this->addChild(pMenu);
}

void HighScoreLayer::pauseButtonClick(CCObject* pObject)
{
	ScoreLayer* pScoreLayer = dynamic_cast<ScoreLayer*>(this->getParent());
	GameLayer* pGameLayer = dynamic_cast<GameLayer*>(pScoreLayer->getParent());
	pGameLayer->showPauseMenu();
}

void HighScoreLayer::musicButtonClick(CCObject* pObject)
{
	CCMenuItemSprite* pMenuItem = dynamic_cast<CCMenuItemSprite*>(pObject);

	if(pMenuItem!=NULL)
	{
		if(UserDataManager::getInstance()->getMute())
		{
			UserDataManager::getInstance()->setMute(false);
			//BaseSprite* pAudio = new BaseSprite(Game_Sound);
			BaseSprite* pAudio = new BaseSprite(Game_Main_Resources, CCRectMake(0, 650, 50, 50));
			CCSize menuSize = pAudio->getActualSize();
	/*		pAudio->setPosition(ccp(pAudio->getActualSize().width,0));
			pAudio->setContentSize(menuSize);*/
			pMenuItem->initWithNormalSprite(pAudio,pAudio,pAudio,this,menu_selector(HighScoreLayer::musicButtonClick));
		}
		else
		{
			UserDataManager::getInstance()->setMute(true);
			//BaseSprite* pAudio = new BaseSprite(Game_Sound2);
			BaseSprite* pAudio = new BaseSprite(Game_Main_Resources, CCRectMake(50, 650, 50, 50));
			CCSize menuSize = pAudio->getActualSize();
			/*pAudio->setPosition(ccp(pAudio->getActualSize().width/2.0,0));
			pAudio->setContentSize(menuSize);*/
			pMenuItem->initWithNormalSprite(pAudio,pAudio,pAudio,this,menu_selector(HighScoreLayer::musicButtonClick));
		}

		UserDataManager::getInstance()->saveMute();
	}
}

void HighScoreLayer::fadeIn()
{
	CCActionInterval* pFadeOut = CCFadeOut::create(0);
	CCActionInterval* pFadeInS = CCFadeIn::create(10.5);
	
	CCSequence* pFadeIn = CCSequence::create(pFadeOut,pFadeInS,NULL);

	pMenu->runAction(pFadeIn);
	pHighScoreSprite->runAction(pFadeIn);
	pHighScoreBgSprite->runAction(pFadeIn);
	pHighScoreTTF->runAction(pFadeIn);
}

void HighScoreLayer::deleteControl()
{
	this->removeChild(pHighScoreSprite,true);
	this->removeChild(pHighScoreBgSprite,true);
	this->removeChild(pHighScoreTTF,true);
}

void HighScoreLayer::setHighScoreLabel(int num)
{
	char temp[20];
	sprintf(temp,"%d",num);
	pHighScoreTTF->setString(temp);
}

void HighScoreLayer::enableClick(bool isEnable){

	if (pMenu != NULL){
		pMenu->setTouchEnabled(isEnable);
	}

}