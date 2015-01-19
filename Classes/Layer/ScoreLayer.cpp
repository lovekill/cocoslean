#include "ScoreLayer.h"

void ScoreLayer::onEnter()
{
	CCLayer::onEnter();

	initLabel();
}

void ScoreLayer::onExit()
{
	CCLayer::onExit();

	removeAllChildrenWithCleanup(true);
}

void ScoreLayer::initLabel()
{
	CCSize layerSize = this->getContentSize();

	double marginTop = 24 * VisibleRect::heightScale();
	double eachLayerHeight = 50 * VisibleRect::heightScale();

	pHighScoreLayer = new HighScoreLayer();
	pPlayingScoreLayer = new PlayingScoreLayer();
	pStageAndTargetLayer =new StageAndTargetLayer();

	pHighScoreLayer->setContentSize(CCSizeMake(480, eachLayerHeight));
	pPlayingScoreLayer->setContentSize(CCSizeMake(480, eachLayerHeight));
	pStageAndTargetLayer->setContentSize(CCSizeMake(480, eachLayerHeight));

	pHighScoreLayer->setScaleX(VisibleRect::widthScale());
	pPlayingScoreLayer->setScaleX(VisibleRect::widthScale());
	pStageAndTargetLayer->setScaleX(VisibleRect::widthScale());

	pHighScoreLayer->setScaleY(VisibleRect::heightScale());
	pPlayingScoreLayer->setScaleY(VisibleRect::heightScale());
	pStageAndTargetLayer->setScaleY(VisibleRect::heightScale());

	pHighScoreLayer->setContentSize(CCSizeMake(layerSize.width , eachLayerHeight));
	pPlayingScoreLayer->setContentSize(CCSizeMake(layerSize.width , eachLayerHeight));
	pStageAndTargetLayer->setContentSize(CCSizeMake(layerSize.width , eachLayerHeight));

	this->addChild(pHighScoreLayer,3);
	this->addChild(pPlayingScoreLayer,1);
	this->addChild(pStageAndTargetLayer,2);

	double highScoreLayerMarginLeft =(layerSize.width * VisibleRect::widthScale() - layerSize.width)/2.0;
	double highScoreLayerMarginTop = layerSize.height - eachLayerHeight - marginTop;

	double stageAndTargetLayerMarginLeft = (layerSize.width * VisibleRect::widthScale() - layerSize.width)/2.0;
	double stageAndTargetLayerMarginTop = layerSize.height - eachLayerHeight*2 - marginTop;

	double playingScoreMarginStage = 5 * VisibleRect::heightScale();
	double playingScoreLayerMarginLeft =(layerSize.width * VisibleRect::widthScale() - layerSize.width)/2.0;
	double playingScoreLayerMarginTop = layerSize.height - eachLayerHeight * 3 - marginTop - playingScoreMarginStage;

	pHighScoreLayer->setPosition(ccp(highScoreLayerMarginLeft,highScoreLayerMarginTop));
	pPlayingScoreLayer->setPosition(ccp(playingScoreLayerMarginLeft,playingScoreLayerMarginTop));
	pStageAndTargetLayer->setPosition(ccp(stageAndTargetLayerMarginLeft,stageAndTargetLayerMarginTop));


	double pTipLabelMarginTop = layerSize.height  - eachLayerHeight * 4 - 20 * VisibleRect::heightScale() - marginTop - playingScoreMarginStage;
	
	pTipLabel = CCLabelTTF::create("",Game_Main_Font_TTF,30*VisibleRect::heightScale());
	pTipLabel->setPosition(ccp(layerSize.width/2.0,pTipLabelMarginTop));
	this->addChild(pTipLabel,10000);
	disappearTipLabel();


	CCPoint stageAndTargetPosition = pStageAndTargetLayer->getPosition();
	CCPoint playingScorePosition = pPlayingScoreLayer->getPosition();

	pStageAndTargetLayer->setPosition(ccp(stageAndTargetPosition.x,layerSize.height));
	pPlayingScoreLayer->setPosition(ccp(playingScorePosition.x,layerSize.height));

	CCActionInterval* pStageAndTargetMove = CCMoveTo::create(0.4,stageAndTargetPosition);
	CCActionInterval* pPlayingScoreMove = CCMoveTo::create(0.4,playingScorePosition);

	pStageAndTargetLayer->runAction(pStageAndTargetMove);
	pPlayingScoreLayer->runAction(pPlayingScoreMove);
}

void ScoreLayer::setHighScoreLabel(int num)
{
	pHighScoreLayer->setHighScoreLabel(num);
}

void ScoreLayer::setStageLabel(int num)
{
	pStageAndTargetLayer->setStageLabel(num);
}

void ScoreLayer::setTargetLabel(int num)
{
	pStageAndTargetLayer->setTargetLabel(num);
}

void ScoreLayer::setScoreLabel(int num)
{
	pPlayingScoreLayer->setScoreLabel(num);
}

void ScoreLayer::setHelpCountLabel(int num)
{
	pPlayingScoreLayer->setHelpCountLabel(num);
}

string ScoreLayer::getString(int num)
{
	char temp[20];
	sprintf(temp,"%d",num);
	string charStr = temp;
	return charStr;
}


void ScoreLayer::showTipLabel(char* tipStr)
{
	disappearTipLabel();

	this->pTipLabel->stopAllActions();

	this->pTipLabel->setString(tipStr);
	this->pTipLabel->setVisible(true);

	//this->pTipLabel->setScale(1.4);

	CCActionInterval* pScale = CCScaleTo::create(0.6,1.0,1.0);
	CCActionInterval* pElastic = CCEaseElasticOut::create(pScale);
	CCActionInterval* pScaleReverse = CCScaleTo::create(0,1.0,1.0);

	CCSequence* pSequence = CCSequence::create(pElastic,NULL);

	this->pTipLabel->runAction(pSequence);
}

void ScoreLayer::disappearTipLabel()
{
	this->pTipLabel->setVisible(false);

	this->pTipLabel->setScale(0.2);
}

CCPoint ScoreLayer::getPlayingScorePoint()
{
	return pPlayingScoreLayer->getPlayingScore();
}

CCPoint ScoreLayer::getStageClearSpritePoint()
{
	return pPlayingScoreLayer->getStageClearScore();
}

CCPoint ScoreLayer::getStarPosition()
{
	return this->pPlayingScoreLayer->getStarPosition();
}

void ScoreLayer::setHelpCountTarget(int num)
{
	this->pPlayingScoreLayer->setHelpCountTarget(num);
}

bool ScoreLayer::onPlayingScoreHelpClicked(CCPoint point){

	if (pPlayingScoreLayer != NULL){

		return pPlayingScoreLayer->isHelpClicked(point);
	}
}