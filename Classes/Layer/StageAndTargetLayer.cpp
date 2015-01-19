#include "StageAndTargetLayer.h"

StageAndTargetLayer::StageAndTargetLayer():
	pStageLabel(NULL),
	pStageSprite(NULL),
	pStageBgSprite(NULL),
	pTargetSprite(NULL),
	pTargetBgSprite(NULL),
	pTargetLabel(NULL)
{

}


void StageAndTargetLayer::onEnter()
{
	CCLayer::onEnter();

	initControl();
}

void StageAndTargetLayer::onExit()
{
	CCLayer::onExit();

	deleteControl();
}

void StageAndTargetLayer::initControl()
{
	CCSize layerSize = CCSizeMake(480,this->getContentSize().height * 0.8);

	if(pStageSprite == NULL)
	{
		/*pStageSprite = new BaseSprite(Game_Stage);*/
		pStageSprite = new BaseSprite(Game_Main_Resources,CCRectMake(0,770,108,45));
		this->addChild(pStageSprite);
	}

	if(pStageBgSprite == NULL)
	{
		//pStageBgSprite = new BaseSprite(Game_StageBg);
		pStageBgSprite = new BaseSprite(Game_Main_Resources,CCRectMake(222,600,72,50));
		this->addChild(pStageBgSprite);
	}

	if(pStageLabel == NULL)
	{
		pStageLabel = CCLabelTTF::create("",Game_Main_Font_TTF,25);
		this->addChild(pStageLabel);
	}

	if(pTargetSprite == NULL)
	{
		/*pTargetSprite = new BaseSprite(Game_Target);*/
		pTargetSprite = new BaseSprite(Game_Main_Resources,CCRectMake(130,770,108,45));
		this->addChild(pTargetSprite);
	}

	if(pTargetBgSprite == NULL)
	{
	/*	pTargetBgSprite = new BaseSprite(Game_TargetBg);*/
		pTargetBgSprite = new BaseSprite(Game_Main_Resources,CCRectMake(315,600,136,50));
		this->addChild(pTargetBgSprite);
	}

	if(pTargetLabel == NULL)
	{
		pTargetLabel = CCLabelTTF::create("",Game_Main_Font_TTF,25);
		this->addChild(pTargetLabel);
	}

	pStageSprite->setScale(DEFAULT_SCORE_LAYER_SCALE_SIZE);
	pStageBgSprite->setScale(DEFAULT_SCORE_LAYER_SCALE_SIZE);
	pTargetSprite->setScale(DEFAULT_SCORE_LAYER_SCALE_SIZE);
	pTargetBgSprite->setScale(DEFAULT_SCORE_LAYER_SCALE_SIZE);

	CCSize stageSpriteSize = pStageSprite->getActualSize() * DEFAULT_SCORE_LAYER_SCALE_SIZE;
	CCSize stageBgSpriteSize = pStageBgSprite->getActualSize() * DEFAULT_SCORE_LAYER_SCALE_SIZE;
	CCSize stageLabelSize = pStageLabel->getContentSize();

	CCSize targetSpriteSize = pTargetSprite->getActualSize() * DEFAULT_SCORE_LAYER_SCALE_SIZE;
	CCSize targetBgSpriteSize = pTargetBgSprite->getActualSize() * DEFAULT_SCORE_LAYER_SCALE_SIZE;
	CCSize targetLabelSize = pTargetLabel->getContentSize();

	double stageSpriteMarginLeft = stageSpriteSize.width * 2 / 3.0;
	double stageSpriteMarginTop = layerSize.height / 2.0;

	double stageBgSpriteMarginLeft = stageSpriteMarginLeft + stageBgSpriteSize.width/2.0 + stageSpriteSize.width / 2.0;
	double stageBgSpriteMarginTop = layerSize.height/2.0;

	double stageLabelMarginLeft = stageBgSpriteMarginLeft;
	double stageLabelMarginTop = layerSize.height/2.0;

	double targetSpriteMarginLeft = stageBgSpriteMarginLeft + stageBgSpriteSize.width / 2.0 + targetSpriteSize.width / 2.0;
	double targetSpriteMarginTop = layerSize.height/2.0;

	double targetBgSpriteMarginLeft = targetSpriteMarginLeft + targetBgSpriteSize.width / 2.0 + targetSpriteSize.width / 2.0;
	double targetBgSpriteMarginTop = layerSize.height/2.0;

	double targetLabelMarginLeft = targetBgSpriteMarginLeft;
	double targetLabelMarginTop = layerSize.height/2.0;

	pStageSprite->setPosition(ccp(stageSpriteMarginLeft,stageSpriteMarginTop));
	pStageBgSprite->setPosition(ccp(stageBgSpriteMarginLeft,stageBgSpriteMarginTop));
	pStageLabel->setPosition(ccp(stageLabelMarginLeft,stageLabelMarginTop));

	pTargetSprite->setPosition(ccp(targetSpriteMarginLeft,targetSpriteMarginTop));
	pTargetBgSprite->setPosition(ccp(targetBgSpriteMarginLeft,targetBgSpriteMarginTop));
	pTargetLabel->setPosition(ccp(targetLabelMarginLeft,targetLabelMarginTop));

}

void StageAndTargetLayer::deleteControl()
{
	this->removeChild(pStageSprite,true);
	this->removeChild(pStageBgSprite,true);
	this->removeChild(pStageLabel,true);

	this->removeChild(pTargetSprite,true);
	this->removeChild(pTargetBgSprite,true);
	this->removeChild(pTargetLabel,true);
}

void StageAndTargetLayer::setStageLabel(int num)
{
	char temp[20];
	sprintf(temp,"%d",num);
	pStageLabel->setString(temp);
}

void StageAndTargetLayer::setTargetLabel(int num)
{
	char temp[20];
	sprintf(temp,"%d",num);
	pTargetLabel->setString(temp);

	CCActionInterval* pFadeOut = CCFadeOut::create(0.2);
	CCActionInterval* pFadeIn = CCFadeIn::create(0.2);

	CCSequence* pSequence = CCSequence::create(pFadeOut,pFadeIn,NULL);
	CCRepeat* pRepeat = CCRepeat::create(pSequence,4);

	pTargetLabel->runAction(pRepeat);
}