#include "PlayingScoreLayer.h"

PlayingScoreLayer::PlayingScoreLayer() :
		pScoreSprite(NULL),
		pScoreBgSprite(NULL),
		pScoreLabel(NULL),
		pStarSprite(NULL),
		pHelpCountLabel(NULL),
		pHelpCountTargetLabel(NULL)
{

}

void PlayingScoreLayer::onEnter()
{
	CCLayer::onEnter();

	initControl();
}

void PlayingScoreLayer::onExit()
{
	CCLayer::onExit();

	deleteControl();
}

void PlayingScoreLayer::initControl()
{
	CCSize layerSize = CCSizeMake(480,this->getContentSize().height * 0.8);

	if(pScoreSprite == NULL)
	{
		/*pScoreSprite = new BaseSprite(Game_PlayingScore);*/
		pScoreSprite = new BaseSprite(Game_Main_Resources,CCRectMake(284,696,105,52));
		this->addChild(pScoreSprite);
	}

	if(pScoreBgSprite == NULL)
	{
	/*	pScoreBgSprite = new BaseSprite(Game_PlayingScoreBg);*/
		pScoreBgSprite = new BaseSprite(Game_Main_Resources, CCRectMake(0, 600, 220, 50));
		this->addChild(pScoreBgSprite);
	}

	if(pScoreLabel == NULL)
	{
		pScoreLabel = CCLabelTTF::create("0",Game_Main_Font_TTF,25);
		this->addChild(pScoreLabel);
	}

	if(pStarSprite == NULL)
	{
		pStarSprite = CCSprite::create(Game_Shop_Coin_Bg);
		this->addChild(pStarSprite);
	}

	if(pHelpCountLabel == NULL)
	{
		pHelpCountLabel = CCLabelTTF::create("0",Game_Main_Font_TTF,25);
		this->addChild(pHelpCountLabel);
	}

	if(pHelpCountTargetLabel == NULL)
	{
		pHelpCountTargetLabel = CCLabelTTF::create("0","",15);
	}

	pScoreSprite->setScale(DEFAULT_SCORE_LAYER_SCALE_SIZE);
	pScoreBgSprite->setScale(DEFAULT_SCORE_LAYER_SCALE_SIZE);
	pStarSprite->setScale(DEFAULT_SCORE_LAYER_SCALE_SIZE);

	CCSize scoreSpriteSize = pScoreSprite->getActualSize() * DEFAULT_SCORE_LAYER_SCALE_SIZE;
	CCSize scoreBgSpriteSize = pScoreBgSprite->getActualSize()* DEFAULT_SCORE_LAYER_SCALE_SIZE;
	CCSize scoreLabelSize = pScoreLabel->getContentSize();
	CCSize starSpriteSize = pStarSprite->getContentSize()* DEFAULT_SCORE_LAYER_SCALE_SIZE;

	double marginLeft = (layerSize.width - scoreSpriteSize.width - scoreBgSpriteSize.width) / 2.0;
	if(marginLeft < 0)
		marginLeft = 0;

	double scoreSpriteMarginLeft = layerSize.width/2.0;
	double scoreSpriteMarginTop = layerSize.height / 2.0;

	double scoreBgSpriteMarginLeft = layerSize.width/2.0;
	double scoreBgSpriteMarginTop = scoreSpriteMarginTop - scoreSpriteSize.height;

	double scoreLabelMarginLeft = scoreBgSpriteMarginLeft;
	double scoreLabelMarginTop= scoreBgSpriteMarginTop;

	pScoreSprite->setPosition(ccp(scoreSpriteMarginLeft,scoreSpriteMarginTop));
	pScoreBgSprite->setPosition(ccp(scoreBgSpriteMarginLeft,scoreBgSpriteMarginTop));
	pScoreLabel->setPosition(ccp(scoreLabelMarginLeft,scoreLabelMarginTop));

	pStarSprite->setPosition(ccp( pStarSprite->getContentSize().width * 2 / 3.0 , scoreBgSpriteMarginTop));

	pHelpCountTargetLabel->setAnchorPoint(ccp(0,0.5));
	pHelpCountTargetLabel->setPosition(ccp(pStarSprite->getContentSize().width / 2.0,scoreBgSpriteMarginTop- starSpriteSize.height/2.0 - pHelpCountTargetLabel->getContentSize().height * 2.0/3.0));

	pHelpCountLabel->setPosition(ccp(starSpriteSize.width / 2.0 + (layerSize.width/2.0 - scoreBgSpriteSize.width/2.0)/2.0 , scoreBgSpriteMarginTop));
}

void PlayingScoreLayer::deleteControl()
{
	this->removeChild(pScoreSprite,true);
	this->removeChild(pScoreBgSprite,true);
	this->removeChild(pScoreLabel,true);
}

void PlayingScoreLayer::setScoreLabel(int num)
{
	char temp[20];
	sprintf(temp,"%d",num);
	pScoreLabel->setString(temp);
}

void PlayingScoreLayer::setHelpCountLabel(int num)
{
	char temp[20];
	sprintf(temp,"%d",num);
	pHelpCountLabel->setString(temp);

	CCActionInterval* pJump = CCJumpBy::create(0.15,CCPointZero,10 * VisibleRect::heightScale(),1);
	pHelpCountLabel->runAction(pJump);
}

CCPoint PlayingScoreLayer::getPlayingScore()
{
	CCPoint p = this->convertToWorldSpace(pScoreLabel->getPosition());
	
	return p;
}

CCPoint PlayingScoreLayer::getStageClearScore()
{
	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();
	double right = screenSize.width - (screenSize.width/2.0 - pScoreBgSprite->getActualSize().width * VisibleRect::widthScale()/2.0)/2.0;
	//CCPoint p = this->convertToWorldSpace(ccp(right,pScoreBgSprite->getPosition().y));

	CCPoint p = this->convertToWorldSpace(pScoreBgSprite->getPosition());
	p = ccp(right,p.y);

	return p;
}

CCPoint PlayingScoreLayer::getStarPosition()
{
	CCPoint p = this->convertToWorldSpace(pStarSprite->getPosition());
	return p;
}

void PlayingScoreLayer::setHelpCountTarget(int num)
{
	char temp[30];
	sprintf(temp,"N:%d",num);
	pHelpCountTargetLabel->setString(temp);
}

bool PlayingScoreLayer::isHelpClicked(CCPoint point){

	CCPoint spacePoint = convertToNodeSpace(point);

	if (pStarSprite != NULL){

		CCRect starBoundingBox = pStarSprite->boundingBox();
		if (starBoundingBox.containsPoint(spacePoint)){
			return true;
		}

	}

	if (pHelpCountLabel != NULL){

		CCRect labelBoundingBox = pHelpCountLabel->boundingBox();
		if (labelBoundingBox.containsPoint(spacePoint)){
			return true;
		}
	}

}