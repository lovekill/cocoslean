#include "GameLayer.h"

using namespace cocos2d::plugin;

GameLayer::GameLayer():
pStarArray(NULL),
	pSelectingStarArray(NULL),
	pUserDataManager(NULL),
	pTargetLabel(NULL),
	pStageLabel(NULL),
	pTipLabel(NULL),
	pExtraBounsLabel(NULL),
	pStageClearSprite(NULL),
	pGameOverSprite(NULL),
	pGoodTipSprite(NULL),
	pLastStarsLabel(NULL),
	labelPlayingNow(0),
	labelPlayingScore(0),
	pWinSprite(NULL),
	pPauseMenu(NULL),
	pStarHelpSprite(NULL),
	pFlowerParticle(NULL),
	canGoback(false)
{

}

void GameLayer::onEnter()
{
	CCLayer::onEnter();

	pUserDataManager = UserDataManager::getInstance();
	pAudioManager = new AudioManager();

	initCreditsWall();

	initScorePanel();
	initSpriteBatchNode();
	initParticleBatchNode();

	if(pUserDataManager->getContinue())
	{
		this->pUserDataManager->initData();
		initContinueLevel();
	}
	else
	{
		this->pUserDataManager->setDefaultValue();
		initLevel();
	}

	initDefaultData();

	registerWithTouchDispatcher();
	this->schedule(schedule_selector(GameLayer::playingScoreLabelShow));

}

void GameLayer::onExit()
{
	CCLayer::onExit();

	removeSpriteBatchNode();
	removeParticleBatchNode();
	delete pAudioManager;

	removeCreditsWallObj();

	this->unschedule(schedule_selector(GameLayer::playingScoreLabelShow));
}

void GameLayer::initDefaultData()
{
	int helpCount = pUserDataManager->getLocalCoin();
	this->pScoreLayer->setHelpCountLabel(helpCount);
}

void GameLayer::initLevel(float dt)
{
	canGoback = false;

	this->unschedule(schedule_selector(GameLayer::initLevel));
	this->unschedule(schedule_selector(GameLayer::showExplosionParticle));

	this->pSpriteBatchNode->removeAllChildrenWithCleanup(true);
	this->pParticleBatchNode->removeAllChildrenWithCleanup(true);

	disappearExtraBounsLabel();
	disappearStageClearSprite();

	setStageAndTarget();
	initLevelData();

	flyStageLabel(true);

	hasTipStageClear = false;

	//awardStarHelpCount();

	this->scheduleOnce(schedule_selector(GameLayer::checkStageClear),3.0);
}

void GameLayer::checkStageClear(float dt)
{
	int playingScore = this->pUserDataManager->addPlayingScore(0);
	int playingTarget = this->pUserDataManager->getPlayingTarget();
	if(playingScore>=playingTarget && !hasTipStageClear)
	{
		this->hasTipStageClear = true;
		showStageClearSprite();
	}
}

void GameLayer::initContinueLevel()
{	
	this->pSpriteBatchNode->removeAllChildrenWithCleanup(true);

	disappearExtraBounsLabel();
	disappearStageClearSprite();

	initLevelData();
	flyStageLabel(true);
	hasTipStageClear = false;

	this->scheduleOnce(schedule_selector(GameLayer::checkStageClear),3.0);
}

void GameLayer::initLevelData()
{
	int theStage = this->pUserDataManager->getPlayingStage();
	int theTarget = this->pUserDataManager->getPlayingTarget();
	int theMaxScore = this->pUserDataManager->getMaxScore();
	int thePlayingScore = this->pUserDataManager->addPlayingScore(0);

	this->pScoreLayer->setStageLabel(theStage);
	this->pScoreLayer->setTargetLabel(theTarget);
	this->pScoreLayer->setHighScoreLabel(theMaxScore);
	this->pScoreLayer->setScoreLabel(thePlayingScore);

	labelPlayingNow = labelPlayingScore = thePlayingScore;
}

void GameLayer::setStageAndTarget()
{
	this->pUserDataManager->setPlayingStage();
	this->pUserDataManager->setPlayingTarget();
}

void GameLayer::initSpriteBatchNode()
{
	pSpriteBatchNode = CCSpriteBatchNode::create(Game_Main_Resources);
	this->addChild(pSpriteBatchNode);
}

void GameLayer::removeSpriteBatchNode()
{
	this->removeChild(pSpriteBatchNode,true);
}

void GameLayer::initParticleBatchNode()
{
	pParticleBatchNode = CCParticleBatchNode::create(Game_Main_Resources);
	this->addChild(pParticleBatchNode);
}

void GameLayer::removeParticleBatchNode()
{
	this->removeChild(this->pParticleBatchNode,true);
}

void GameLayer::initScorePanel()
{
	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	pScoreLayer = new ScoreLayer();
	pScoreLayer->setContentSize(screenSize);
	pScoreLayer->setPosition(ccp(0,0));
	this->addChild(pScoreLayer,12000);
}

#pragma region 初始化每关星星

void GameLayer::initStars()
{
	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	this->starColumns = 10;
	this->starRows = 10;

	delete pStarArray;
	pStarArray = new CCArray();

	srand((unsigned)time(NULL));

	double starWidth = screenSize.width / 10.0;
	double margin = starWidth / 2.0;

	for(int i= this->starRows - 1;i>=0;i--)
	{
		for(int j=0;j < this->starColumns;j++)
		{
			Star* pStar = starArray[i][j];
			this->removeChild(pStar,true);

			int starType = rand() % 5;

			pStar = new Star(this->pSpriteBatchNode->getTexture(),starType);
			pStar->retain();
			pStar->autorelease();
			starArray[i][j] = pStar;

			pStar->setRow(i);
			pStar->setColumn(j);
			pStar->setDisapper(false);
			pStar->setScale(VisibleRect::widthScale());
			pStar->setContentSize(CCSizeMake(starWidth,starWidth));
			pStar->setStarInSelector(true);
			pStar->setStarInSelector(false);

			CCSize starSize = pStar->getContentSize();

			double marginLeft = (j * starWidth + margin);
			double marginBottom = (i * starWidth + margin);

			pStar->setMoveTargetPosition(ccp(marginLeft,marginBottom));
			pStar->setPosition(ccp(marginLeft,screenSize.height+marginBottom));
			this->pSpriteBatchNode->addChild(pStar);

			pStarArray->addObject(pStar);
		}
	}

	canGoback = true;
}

void GameLayer::moveStarts()
{
	double actionTime = 0.5;
	for(int i=0;i<this->starRows;i++)
	{
		for(int j=0;j<this->starColumns;j++)
		{
			double moveActionTime = actionTime + (i+1)/20.0 * (rand()%10) / 20.0;

			Star* pStar = starArray[i][j];
			pStar->setJumpFirst(false);
			pStar->moveToTargetAction(moveActionTime);
		}
	}
}

#pragma endregion

#pragma region 手势

void GameLayer::registerWithTouchDispatcher()
{
	CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(this,0,true);
}

void GameLayer::unRegisterWithTouchDispatcher()
{
	CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool GameLayer::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent)
{
	CCPoint touchPoint = pTouch->getLocation();
	bool result = touchStar(touchPoint);

	if (result){
		choseStar();
	}

	if (pScoreLayer != NULL){

		result = pScoreLayer->onPlayingScoreHelpClicked(touchPoint);
	}

	return result;
}

void GameLayer::ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent)
{

}

void GameLayer::ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent)
{

	CCPoint touchPoint = pTouch->getLocation();

	if (pScoreLayer != NULL){

		bool result = pScoreLayer->onPlayingScoreHelpClicked(touchPoint);
		if (result){

			onHelpClicked();
		}
	}

}

#pragma endregion

bool GameLayer::touchStar(CCPoint touchPoint)
{
	bool result = false;
	if(pStarArray == NULL)
		return result;

	for(int i=0;i<pStarArray->count();i++)
	{
		Star* pStar = dynamic_cast<Star*>(pStarArray->objectAtIndex(i));
		CCRect rect = pStar->boundingBox();

		result = rect.containsPoint(touchPoint);
		if(result)
		{
			pSelectingStar = pStar;
			return result;
		}
	}

	return result;
}

void GameLayer::choseStar()
{
	if(pSelectingStarArray == NULL)
		pSelectingStarArray = new CCArray();

	if(pSelectingStarArray->containsObject(pSelectingStar))
	{
		this->schedule(schedule_selector(GameLayer::removeSelectingStar));
		disappearTip();
	}
	else
	{
		for(int i =0 ;i<pSelectingStarArray->count();i++)
		{
			Star* pStar = dynamic_cast<Star*>(pSelectingStarArray->objectAtIndex(i));
			pStar->setStarInSelector(false);
		}
		pSelectingStarArray->removeAllObjects();

		pSelectingStarArray->addObject(pSelectingStar);

		CCArray* pArray = new CCArray();
		pArray->addObject(pSelectingStar);

		filterCloseStars(pArray);

		if(pSelectingStarArray->count()>=2)
		{
			displaySelectedStar();
			showTip(this->pSelectingStarArray->count());

			pAudioManager->playSelectAudio();
		}
		else
		{	
			for(int i =0 ;i<pSelectingStarArray->count();i++)
			{
				Star* pStar = dynamic_cast<Star*>(pSelectingStarArray->objectAtIndex(i));
				pStar->setStarInSelector(false);
			}
			pSelectingStarArray->removeAllObjects();
		}
	}
}

void GameLayer::removeSelectingStar(float dt)
{
	static int starOrderIndex = 0;

	double startActionTime = 0;

	for(int i=this->starRows - 1;i>=0;i--)
	{
		for(int j=0;j<this->starColumns;j++)
		{
			for(int a = pSelectingStarArray->count() - 1; a >= 0 ;a--)
			{
				Star* pStar = dynamic_cast<Star*>(pSelectingStarArray->objectAtIndex(a));

				int column = pStar->getColumn();
				int row = pStar->getRow();

				if(column == j && row == i)
				{
					pSelectingStarArray->removeObject(pStar);
					pStarArray->removeObject(pStar);

					pSpriteBatchNode->removeChild(pStar,false);

					pStar->setDisapper(true);

					startDisappearParticle(pStar->getTargetPosition(),pStar->getStarType());
					startShowScoreAction(pSelectingStar->getTargetPosition(),starOrderIndex,startActionTime);

					starOrderIndex++;
					startActionTime+=0.1;
					//return;
				}
			}
		}
	}

	showGoodTipSprite(starOrderIndex);

	starOrderIndex = 0;
	this->unschedule(schedule_selector(GameLayer::removeSelectingStar));
	reLayoutColumnStars();

	bool isStageOverResult = isStageOver();
	if(isStageOverResult)
	{
		canGoback = false;

		this->unschedule(schedule_selector(GameLayer::stageOver));
		this->schedule(schedule_selector(GameLayer::stageOver),0.5);
	}
}

void GameLayer::filterCloseStars(CCArray* pArray)
{
	for(int i=pArray->count() - 1;i>=0;i--)
	{
		int co = pArray->count();

		Star* pStar = dynamic_cast<Star*>(pArray->objectAtIndex(i));

		int column = pStar->getColumn();
		int row = pStar->getRow();
		int starType = pStar->getStarType();

		int leftColumn = column - 1;
		int leftRow = row;
		if(leftRow >= 0 && leftRow < 10 && leftColumn >= 0 && leftColumn < 10)
		{
			Star* pLeftStar = starArray[leftRow][leftColumn];
			int leftStarType = pLeftStar->getStarType();

			if(starType == leftStarType && !pLeftStar->getDisapper() && !isInSelectingStarArray(pLeftStar))
			{
				pArray->addObject(pLeftStar);
				pSelectingStarArray->addObject(pLeftStar);
			}
		}

		int rightColumn = column + 1;
		int rightRow = row;
		if(rightColumn >= 0 && rightColumn < 10 &&  rightRow >= 0 && rightRow < 10)
		{
			Star* pRightStar = starArray[rightRow][rightColumn];
			int rightStarType = pRightStar->getStarType();

			if(starType == rightStarType && !pRightStar->getDisapper()&& !isInSelectingStarArray(pRightStar))
			{
				pArray->addObject(pRightStar);
				pSelectingStarArray->addObject(pRightStar);
			}
		}

		int topColumn = column;
		int topRow = row + 1;
		if(topColumn >= 0 && topColumn < 10 && topRow >= 0 && topRow < 10)
		{
			Star* pTopStar = starArray[topRow][topColumn];
			int topStarType = pTopStar->getStarType();

			if(topStarType == starType && !pTopStar->getDisapper()&& !isInSelectingStarArray(pTopStar))
			{
				pArray->addObject(pTopStar);
				pSelectingStarArray->addObject(pTopStar);
			}
		}

		int bottomColumn = column;
		int bottomRow = row - 1;
		if(bottomColumn >= 0 && bottomColumn < 10 && bottomRow >= 0 && bottomRow < 10)
		{
			Star* pBottomStar = starArray[bottomRow][bottomColumn];
			int bottomStarType = pBottomStar->getStarType();

			if(starType == bottomStarType && !pBottomStar->getDisapper() && !isInSelectingStarArray(pBottomStar))
			{
				pArray->addObject(pBottomStar);
				pSelectingStarArray->addObject(pBottomStar);
			}
		}

		pArray->removeObject(pStar);
	}

	if(pArray->count()>0)
		filterCloseStars(pArray);
}

bool GameLayer::isInSelectingStarArray(Star* pStar)
{
	if(pSelectingStarArray == NULL)
		return false;

	return pSelectingStarArray->containsObject(pStar);
}

void GameLayer::displaySelectedStar()
{
	if(pSelectingStarArray == NULL)
		return;

	for(int i=0;i<pStarArray->count();i++)
	{
		Star* pStar = dynamic_cast<Star*>(pStarArray->objectAtIndex(i));
		pStar->setStarInSelector(false);
	}

	for(int i =0 ;i<pSelectingStarArray->count();i++)
	{
		Star* pStar = dynamic_cast<Star*>(pSelectingStarArray->objectAtIndex(i));
		pStar->setStarInSelector(true);
	}
}

void GameLayer::reLayoutColumnStars()
{
	for(int i=0;i<this->starColumns;i++)
	{
		for(int j=0;j<this->starRows;j++)
		{
			Star* pStar = starArray[j][i];

			bool isDisapper = pStar->getDisapper();
			if(isDisapper)
			{
				for(int a = j+1;a<10;a++)
				{
					Star* pNextStar = starArray[a][i];
					bool isNextDisapper = pNextStar->getDisapper();
					if(!isNextDisapper)
					{
						Star* pTemp = pNextStar;

						int column = pNextStar->getColumn();
						int row = pNextStar->getRow();
						CCPoint nextPosition = pNextStar->getTargetPosition();

						pNextStar->setMoveTargetPosition(pStar->getTargetPosition());
						pNextStar->setColumn(pStar->getColumn());
						pNextStar->setRow(pStar->getRow());
						pNextStar->setJumpFirst(true);

						pStar->setColumn(column);
						pStar->setRow(row);
						pStar->setMoveTargetPosition(nextPosition);

						starArray[a][i] = pStar;
						starArray[j][i] = pTemp;

						break;
					}
				}
			}
		}
	}

	reLayoutRowStars();

	string starArrayStr = getStarArrayString();
	pUserDataManager->setStarArrayInfo(starArrayStr);

	for(int i=0;i<pStarArray->count();i++)
	{
		Star* pStar = dynamic_cast<Star*>(pStarArray->objectAtIndex(i));
		pStar->moveToTargetAction(0.10);
	}

	this->pAudioManager->playBrokenAudio();
}

void GameLayer::reLayoutRowStars()
{
	for(int i=0;i < this->starColumns;i++)
	{
		bool columnAllDisappeared = false;

		for(int j=0;j< this->starRows;j++)
		{
			Star* pStar = starArray[j][i];
			bool isDisappear = pStar->getDisapper();
			if(isDisappear)
			{
				columnAllDisappeared = true;
			}
			else
			{
				//如果只要有一个没有隐藏，则没必要在该列上下功夫了
				columnAllDisappeared = false;
				break;
			}
		}

		if(columnAllDisappeared == true)
		{
			int nextColumn = getNextColumnNotAllDisappear(i + 1);
			if(nextColumn == this->starColumns) return;

			for(int a = 0;a<this->starRows;a++)
			{
				Star* pStar = starArray[a][i];
				Star* pNextStar = starArray[a][nextColumn];
				Star* pTemp = pNextStar;

				int column = pNextStar->getColumn();
				int row = pNextStar->getRow();
				CCPoint nextPosition = pNextStar->getTargetPosition();

				pNextStar->setMoveTargetPosition(pStar->getTargetPosition());
				pNextStar->setColumn(pStar->getColumn());
				pNextStar->setRow(pStar->getRow());

				pStar->setColumn(column);
				pStar->setRow(row);
				pStar->setMoveTargetPosition(nextPosition);

				starArray[a][nextColumn] = pStar;
				starArray[a][i] = pTemp;
			}
		}
	}
}

int GameLayer::getNextColumnNotAllDisappear(int nextStartColumnIndex)
{
	for(int i = nextStartColumnIndex;i<this->starColumns;i++)
	{
		for(int j = 0;j<this->starRows;j++)
		{
			Star* pStar = starArray[j][i];
			bool isDisappear = pStar->getDisapper();
			if(isDisappear)
			{
			}
			else
			{
				//如果只要有一个没有隐藏，则返回数据
				return i;
			}
		}
	}

	return this->starColumns;
}


void GameLayer::startDisappearParticle(CCPoint targetPosition,int starType)
{
	double starY = 340;

	//switch(starType)
	//{
	//case 0:
	//	starY = 490;
	//	break;
	//case 1:
	//	starY = 440;
	//	break;
	//case 2:
	//	starY = 390;
	//	break;
	//case 3:
	//	starY = 340;
	//	break;
	//case 4:
	//	starY = 540;
	//	break;
	//}

	switch(starType)
	{
	case 3:
		starY = 490;
		break;
	case 2:
		starY = 440;
		break;
	case 1:
		starY = 390;
		break;
	case 0:
		starY = 340;
		break;
	case 4:
		starY = 540;
		break;
	}

	CCParticleSystemQuad* pParticle = CCParticleSystemQuad::create();
	pParticle->setAngle(90);
	pParticle->setAngleVar(100);
	pParticle->setLife(3);
	pParticle->setTextureWithRect(this->pParticleBatchNode->getTexture(),CCRectMake(410,starY,23,23));

	pParticle->setStartColor(ccc4f(109,159,223,255));
	pParticle->setStartColorVar(ccc4f(109,159,223,255));
	pParticle->setEndColor(ccc4f(109,159,223,255));
	pParticle->setEndColorVar(ccc4f(109,159,223,255));

	pParticle->setGravity(ccp(0,-500));
	pParticle->setSpeed(250);
	pParticle->setSpeedVar(250);

	pParticle->setStartSize(23);
	pParticle->setEndSize(2);

	pParticle->setEmissionRate(1000);
	pParticle->setAutoRemoveOnFinish(true);
	pParticle->setEmitterMode(kCCParticleModeGravity);
	pParticle->setTotalParticles(10);

	pParticle->setPosition(targetPosition);

	pParticleBatchNode->addChild(pParticle);
	//this->addChild(pParticle,10000);

	//pParticle->

}

void GameLayer::startShowScoreAction(CCPoint targetPosition,int starOrderIndex,double actiontime)
{
	int score = this->pUserDataManager->getStarPerScore(starOrderIndex);

	int playingScore = this->pUserDataManager->addPlayingScore(score);
	//this->pScoreLayer->setScoreLabel(playingScore);
	this->labelPlayingScore = playingScore;
	int maxScore = this->pUserDataManager->getMaxScore();
	this->pScoreLayer->setHighScoreLabel(maxScore);
	int playingTarget = this->pUserDataManager->getPlayingTarget();

	if(playingScore>=playingTarget && !hasTipStageClear)
	{
		this->hasTipStageClear = true;
		showStageClearSprite();
	}

	char temp[20];
	sprintf(temp,"%d",score);
	CCLabelTTF* pCCLabelTTF = CCLabelTTF::create(temp,Game_Main_Font_TTF,50 * VisibleRect::heightScale());
	pCCLabelTTF->setPosition(targetPosition);
	//pCCLabelTTF->setOpacity(0);

	this->addChild(pCCLabelTTF,13000);

	CCActionInterval* pScale = CCScaleBy::create(0.8,0.3,0.3);
	CCActionInterval* pMoveTo = CCMoveTo::create(0.8,pScoreLayer->getPlayingScorePoint());
	CCActionInterval* pFadeOut = CCFadeIn::create(0);

	CCSpawn* pSpawn = CCSpawn::create(pScale,pMoveTo,NULL);

	CCCallFuncND* pCallBack = CCCallFuncND::create(this,callfuncND_selector(GameLayer::ccLabelActionCompleted),(void*)pCCLabelTTF);

	CCSequence* pSequence = CCSequence::create(CCDelayTime::create(actiontime),pFadeOut,pSpawn,pCallBack,NULL);

	pCCLabelTTF->runAction(pSequence);
}

void GameLayer::ccLabelActionCompleted(CCNode* sender,void* data)
{
	this->removeChild(sender,true);
}

#pragma region 关卡和目标分数

void GameLayer::flyStageLabel(bool isFlyIn)
{
	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	int stage = this->pUserDataManager->getPlayingStage();

	char temp[30];
	//sprintf(temp,"STAGE %d",stage);
	sprintf(temp, Game_Stage_Format, stage);

	if(pStageLabel == NULL)
	{
		pStageLabel = CCLabelTTF::create(temp,Game_Main_Font_TTF,60 * VisibleRect::heightScale());
		this->addChild(pStageLabel,20000);
	}
	pStageLabel->setString(temp);

	CCSize stageSize = pStageLabel->getContentSize();

	pStageLabel->setPosition(ccp(screenSize.width + stageSize.width,screenSize.height/2.0));

	CCPoint moveTarget;

	if(isFlyIn)
		moveTarget = CCPointMake(screenSize.width/2.0,screenSize.height/2.0);
	else
		moveTarget = CCPointMake(-stageSize.width,screenSize.height/2.0);

	CCActionInterval* pMoveAction = CCMoveTo::create(0.5,moveTarget);
	CCActionInterval* pEaseInMove = CCEaseOut::create(pMoveAction,3.5f);

	CCCallFuncND* callFuncND = CCCallFuncND::create(this,callfuncND_selector(GameLayer::stageLabelFlyCompleted),(void*)isFlyIn);

	CCSequence* pSequence = CCSequence::create(pEaseInMove,callFuncND,NULL);

	pStageLabel->runAction(pSequence);
}

void GameLayer::stageLabelFlyCompleted(CCNode* sender,void* data)
{
	bool isFlyIn = (bool)data;
	flyTargetLabel(isFlyIn);
}

void GameLayer::flyTargetLabel(bool isFlyIn)
{
	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	int target = this->pUserDataManager->getPlayingTarget();

	char temp[30];
	//sprintf(temp,"THE TARGET IS %d",target);
	sprintf(temp, Game_Target_Score, target);

	if(pTargetLabel == NULL)
	{
		pTargetLabel = CCLabelTTF::create(temp,Game_Main_Font_TTF,30 * VisibleRect::heightScale());
		this->addChild(pTargetLabel,20000);
	}
	pTargetLabel->setString(temp);

	CCSize targetSize = pTargetLabel->getContentSize();
	CCSize stageSize = pStageLabel->getContentSize();

	pTargetLabel->setPosition(ccp(screenSize.width + stageSize.width,screenSize.height/2.0 - stageSize.height));

	CCPoint moveTarget;

	if(isFlyIn)
		moveTarget = CCPointMake(screenSize.width/2.0,screenSize.height/2.0 - stageSize.height);
	else
		moveTarget = CCPointMake( -targetSize.width , screenSize.height / 2.0 - stageSize.height);

	CCActionInterval* pMoveAction = CCMoveTo::create(0.5,moveTarget);
	CCActionInterval* pEaseInMove = CCEaseOut::create(pMoveAction,3.5f);

	CCCallFuncND* callFuncND = CCCallFuncND::create(this,callfuncND_selector(GameLayer::targetLabelFlyCompleted),(void*)isFlyIn);

	double delayTime = 0.8;
	if(!isFlyIn)
		delayTime = 0.3;

	CCSequence* pSequence = CCSequence::create(pEaseInMove,CCDelayTime::create(delayTime),callFuncND,NULL);

	pTargetLabel->runAction(pSequence);
}

void GameLayer::targetLabelFlyCompleted(CCNode* sender,void* data)
{
	bool isFlyIn = (bool)data;

	if(isFlyIn)
		flyStageLabel(false);
	else
	{
		if(pUserDataManager->getContinue())
		{
			pUserDataManager->setContinue(false);
			initStarsByContinue();

			bool isStageOverResult = isStageOver();
			if(isStageOverResult)
			{
				//stageOver(0);
			}
		}
		else
		{
			initStars();
			moveStarts();
		}
	}
}

#pragma endregion

#pragma  region  提示框

void GameLayer::showTip(int selectStarCount)
{
	int points = this->pUserDataManager->getScoreInOnePopStar(selectStarCount);

	char temp[30];
	//sprintf(temp,"%d blocks %d points",selectStarCount,points);
	sprintf(temp, Game_Select_Star_Tip,selectStarCount,points);

	this->pScoreLayer->showTipLabel(temp);
}

void GameLayer::disappearTip()
{
	this->pScoreLayer->disappearTipLabel();
}

#pragma  endregion

#pragma  region 关卡结束判断

bool GameLayer::isStageOver()
{
	for(int i=0;i<starColumns;i++)
	{
		for(int j=0;j<starRows;j++)
		{
			Star* pStar = starArray[j][i];

			bool result = pStar->getDisapper();
			if(result)
				continue;

			int column = i;
			int row = j;
			int starType = pStar->getStarType();

			int leftColumn = column - 1;
			int leftRow = row;
			if(leftRow >= 0 && leftRow < starRows && leftColumn >= 0 && leftColumn < starColumns)
			{
				Star* pLeftStar = starArray[leftRow][leftColumn];
				int leftStarType = pLeftStar->getStarType();

				if(starType == leftStarType && !pLeftStar->getDisapper() && !isInSelectingStarArray(pLeftStar))
				{
					return false;
				}
			}

			int rightColumn = column + 1;
			int rightRow = row;
			if(rightColumn >= 0 && rightColumn < starColumns &&  rightRow >= 0 && rightRow < starRows)
			{
				Star* pRightStar = starArray[rightRow][rightColumn];
				int rightStarType = pRightStar->getStarType();

				if(starType == rightStarType && !pRightStar->getDisapper()&& !isInSelectingStarArray(pRightStar))
				{
					return false;
				}
			}

			int topColumn = column;
			int topRow = row + 1;
			if(topColumn >= 0 && topColumn < starColumns && topRow >= 0 && topRow < starRows)
			{
				Star* pTopStar = starArray[topRow][topColumn];
				int topStarType = pTopStar->getStarType();

				if(topStarType == starType && !pTopStar->getDisapper()&& !isInSelectingStarArray(pTopStar))
				{
					return false;
				}
			}

			int bottomColumn = column;
			int bottomRow = row - 1;
			if(bottomColumn >= 0 && bottomColumn < starColumns && bottomRow >= 0 && bottomRow < starRows)
			{
				Star* pBottomStar = starArray[bottomRow][bottomColumn];
				int bottomStarType = pBottomStar->getStarType();

				if(starType == bottomStarType && !pBottomStar->getDisapper() && !isInSelectingStarArray(pBottomStar))
				{
					return false;
				}
			}
		}
	}

	return true;
}


void GameLayer::stageOver(float dt)
{
	this->unschedule(schedule_selector(GameLayer::stageOver));
	this->extraPointsRetainCounts = 0;
	this->pUserDataManager->setPlayingBouns();

	for(int i=0;i<pStarArray->count();i++)
	{
		Star* pStar = dynamic_cast<Star*>(pStarArray->objectAtIndex(i));

		CCActionInterval* pFadeout = CCFadeOut::create(0.15);
		CCActionInterval* pFadeIn = CCFadeIn::create(0.15);

		CCSequence* pSequence = CCSequence::create(pFadeout,CCDelayTime::create(0.1),pFadeIn,NULL);
		pStar->runAction(CCRepeat::create(pSequence,3));
	}

	showExtraBounsLabel(this->extraPointsRetainCounts);
	showLastStarCount();

	this->unschedule(schedule_selector(GameLayer::addExtraPoints));
	this->schedule(schedule_selector(GameLayer::addExtraPoints),2.2);
}

void GameLayer::winStage()
{
	if(pWinSprite == NULL)
	{
		pWinSprite = new BaseSprite(Game_Win);
		//pWinSprite = new BaseSprite(Game_Main_Resources,CCRectMake());
		this->addChild(pWinSprite);
	}

	pWinSprite->setScaleX(VisibleRect::widthScale());
	pWinSprite->setScaleY(VisibleRect::heightScale());

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();
	this->pWinSprite->setPosition(ccp(screenSize.width/2.0,screenSize.height * 3/4.0));

	CCActionInterval* pMoveTo = CCMoveTo::create(0.5,ccp(screenSize.width/2.0,screenSize.height/2.0));
	CCActionInterval* pMoveBack = CCMoveTo::create(0.5,ccp(screenSize.width/2.0,screenSize.height+pWinSprite->getActualSize().height));

	CCSequence* pSequnce =CCSequence::create(pMoveTo,CCDelayTime::create(3.0),pMoveBack,NULL);

	pAudioManager->playWinAudio();

	pWinSprite->runAction(pSequnce);

	this->unschedule(schedule_selector(GameLayer::showExplosionParticle));
	//this->schedule(schedule_selector(GameLayer::showExplosionParticle),1.0);
}
#pragma  endregion

#pragma  region 关卡结束额外加分

void GameLayer::addExtraPoints(float dt)
{
	this->unschedule(schedule_selector(GameLayer::addExtraPoints));
	this->schedule(schedule_selector(GameLayer::addExtraPoints),0.5);

	for(int i = this->starRows - 1;i>=0;i--)
	{
		for(int j= 0 ; j<this->starColumns;j++)
		{
			Star* pStar = starArray[i][j];

			bool isDisappear = pStar->getDisapper();

			if(isDisappear)
				continue;
			else
			{
				pSelectingStarArray->removeObject(pStar);
				pStarArray->removeObject(pStar);

				pSpriteBatchNode->removeChild(pStar,false);

				pStar->setDisapper(true);
				startDisappearParticle(pStar->getTargetPosition(),pStar->getStarType());

				this->extraPointsRetainCounts ++;

				if(this->extraPointsRetainCounts<=10)
				{
					showExtraBounsLabel(this->extraPointsRetainCounts);
					this->pAudioManager->playBrokenAudio();
					return;
				}
			}
		}
	}

	if(this->extraPointsRetainCounts>10)
		this->pAudioManager->playBrokenAudio();

	this->unschedule(schedule_selector(GameLayer::addExtraPoints));

	//initLevel();
	stageCompleted();
}

void GameLayer::showExtraBounsLabel(int orderIndex)
{
	if(pExtraBounsLabel == NULL)
	{
		pExtraBounsLabel = CCLabelTTF::create("",Game_Main_Font_TTF,36 * VisibleRect::heightScale());
		this->addChild(pExtraBounsLabel,10000);
	}

	pExtraBounsLabel->setVisible(false);
	pExtraBounsLabel->setScale(0.2);

	int bounsRetain = this->pUserDataManager->setPlayingBouns(orderIndex);
	char temp[30];
	//sprintf(temp,"Bouns %d",bounsRetain);
	sprintf(temp, Game_Bouns, bounsRetain);

	this->pExtraBounsLabel->setString(temp);

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();
	CCPoint position = ccp(screenSize.width/2.0,screenSize.height/3.0);
	pExtraBounsLabel->setPosition(position);

	CCActionInterval* pScale = CCScaleTo::create(0.3,1.0,1.0);
	CCActionInterval* pElastic = CCEaseElasticOut::create(pScale);
	CCActionInterval* pScaleReverse = CCScaleTo::create(0,1.0,1.0);

	CCSequence* pSequence = CCSequence::create(pElastic,NULL);

	pExtraBounsLabel->stopAllActions();
	this->pExtraBounsLabel->setVisible(true);

	this->pExtraBounsLabel->runAction(pSequence);

}

void GameLayer::showLastStarCount()
{
	if(pLastStarsLabel == NULL)
	{
		pLastStarsLabel = CCLabelTTF::create("",Game_Main_Font_TTF,34 * VisibleRect::heightScale());
		this->addChild(pLastStarsLabel,10000);
	}

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	int lastStarCount = this->pStarArray->count();
	char temp[30];
	//sprintf(temp,"%d BLOCKS REMANNING",lastStarCount);
	sprintf(temp, Game_Blocks_Remain, lastStarCount);

	this->pLastStarsLabel->setString(temp);
	this->pLastStarsLabel->setPosition(ccp(screenSize.width/2.0,screenSize.height/4.0));
	this->pLastStarsLabel->setVisible(true);
}

void GameLayer::disappearExtraBounsLabel()
{
	if(this->pExtraBounsLabel!= NULL)
		this->pExtraBounsLabel->setVisible(false);
	if(this->pLastStarsLabel != NULL)
		this->pLastStarsLabel->setVisible(false);
}
#pragma  endregion

void GameLayer::stageCompleted()
{
	int playingScore = 0;
	canGoback =true;

	if(this->extraPointsRetainCounts<10)
	{
		int retainScore = this->pUserDataManager->getPlayingBouns();
		if(retainScore>0)
		{
			addExtraBouns();
		}
	}

	playingScore = this->pUserDataManager->addPlayingScore(0);
	if(playingScore>=this->pUserDataManager->getPlayingTarget())
	{
		disappearExtraBounsLabel();
		winStage();
		this->schedule(schedule_selector(GameLayer::initLevel),4.0);
	}
	else
	{
		disappearExtraBounsLabel();
		showGameOverSprite();
		this->schedule(schedule_selector(GameLayer::showHelpLayer),3.0);
	}
}

void GameLayer::addExtraBouns()
{
	int retainScore = this->pUserDataManager->getPlayingBouns();
	int playingScore = this->pUserDataManager->addPlayingScore(retainScore);

	this->labelPlayingScore = playingScore;

	int maxScore = this->pUserDataManager->getMaxScore();
	this->pUserDataManager->saveMaxScore();

	CCPoint targetPosition = this->pExtraBounsLabel->getPosition();
	
	
	char bounsTemp[30];
	//sprintf(temp,"Bouns %d",bounsRetain);
	sprintf(bounsTemp, Game_Bouns, 0);

	this->pExtraBounsLabel->setString(bounsTemp);

	char temp[20];
	sprintf(temp,"%d",retainScore);
	CCLabelTTF* pCCLabelTTF = CCLabelTTF::create(temp,Game_Main_Font_TTF,50 * VisibleRect::heightScale());
	pCCLabelTTF->setPosition(targetPosition);
	//pCCLabelTTF->setOpacity(0);

	this->addChild(pCCLabelTTF,13000);

	CCActionInterval* pScale = CCScaleBy::create(0.8,0.3,0.3);
	CCActionInterval* pMoveTo = CCMoveTo::create(0.8,pScoreLayer->getPlayingScorePoint());
	CCActionInterval* pFadeOut = CCFadeIn::create(0);

	CCSpawn* pSpawn = CCSpawn::create(pScale,pMoveTo,NULL);

	CCCallFuncND* pCallBack = CCCallFuncND::create(this,callfuncND_selector(GameLayer::ccLabelActionCompleted),(void*)pCCLabelTTF);

	CCSequence* pSequence = CCSequence::create(CCDelayTime::create(0.4),pFadeOut,pSpawn,pCallBack,NULL);

	pCCLabelTTF->runAction(pSequence);
}


#pragma region 分数显示
void GameLayer::playingScoreLabelShow(float dt)
{
	if(labelPlayingNow<labelPlayingScore)
		labelPlayingNow+=5;

	if(labelPlayingNow>=labelPlayingScore)
		labelPlayingNow = labelPlayingScore;

	this->pScoreLayer->setScoreLabel(labelPlayingNow);
}
#pragma  endregion


void GameLayer::showHelpLayer(float dt)
{
	this->unschedule(schedule_selector(GameLayer::showHelpLayer));
	int dialogType = 1;
	canGoback = false;

	removeChildByTag(SHOP_LAYER_TAG);

	if(this->pUserDataManager->canPlayAgainByHelp())
	{
		dialogType = 0;
	}

	DialogLayer* pDialogLayer = new DialogLayer(dialogType);
	this->addChild(pDialogLayer,100008,100008);
}


void GameLayer::restartTheStage()
{
	this->pSpriteBatchNode->removeAllChildren();

	this->pUserDataManager->setPlayingScoreToPrevStageScore();

	int theStage = this->pUserDataManager->getPlayingStage();
	int theTarget = this->pUserDataManager->getPlayingTarget();
	int theScore = this->pUserDataManager->addPlayingScore(0);

	this->pScoreLayer->setStageLabel(theStage);
	this->pScoreLayer->setTargetLabel(theTarget);
	//this->pScoreLayer->setScoreLabel(theScore);

	this->labelPlayingScore = theScore;
	this->labelPlayingNow = theScore;

	removeCreditsWall();
	int helpCount = this->pUserDataManager->subtractOnceHelp();
	this->pScoreLayer->setHelpCountLabel(helpCount);

	disappearGameOverSprite();

	flyStageLabel(true);

	initStars();
}


#pragma region StageClear

void GameLayer::showStageClearSprite()
{
	if(pStageClearSprite == NULL)
	{
		/*pStageClearSprite = new BaseSprite(Game_StageClear);*/
		pStageClearSprite = new BaseSprite(Game_Main_Resources,CCRectMake(0,814,235,170));
		this->addChild(pStageClearSprite,12000);
	}

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	pStageClearSprite->setScale(3 * VisibleRect::heightScale());
	pStageClearSprite->setVisible(true);
	pStageClearSprite->setPosition(ccp(screenSize.width/2.0,screenSize.width * 2.0 / 3.0));

	CCActionInterval* pScaleAction = CCScaleTo::create(0.3,1.0 * VisibleRect::widthScale() ,1.0* VisibleRect::heightScale());
	CCActionInterval* pFadeOut = CCFadeOut::create(0.1);
	CCActionInterval* pFadeIn = CCFadeIn::create(0.1);

	CCActionInterval* pScaleToSmall = CCScaleTo::create(0.6,0.3* VisibleRect::widthScale(),0.4* VisibleRect::heightScale());
	CCActionInterval* pMoveTo = CCMoveTo::create(0.6,pScoreLayer->getStageClearSpritePoint());

	CCSpawn* pScaleMoveSpawn = CCSpawn::create(pScaleToSmall,pMoveTo,NULL);

	CCSequence* pFadeSequnce = CCSequence::create(pFadeOut,pFadeIn,NULL);
	CCRepeat* pFadeRepeat = CCRepeat::create(pFadeSequnce,3);

	CCSequence* pAction = CCSequence::create(pScaleAction,pFadeRepeat,CCDelayTime::create(0.3),pScaleMoveSpawn,NULL);

	pStageClearSprite->runAction(pAction);

	this->pAudioManager->playStageClearAudio();
}

void GameLayer::disappearStageClearSprite()
{
	if(pStageClearSprite !=NULL)
	{
		pStageClearSprite->setVisible(false);
	}
}

#pragma endregion

#pragma region GameOver

void GameLayer::showGameOverSprite()
{
	this->pUserDataManager->setCanContinue(false);

	this->pUserDataManager->saveMaxScore();
	this->pUserDataManager->saveContinue();

	if(pGameOverSprite == NULL)
	{
		/*pGameOverSprite = new BaseSprite(Game_GameOver);*/
		pGameOverSprite = new BaseSprite(Game_Main_Resources,CCRectMake(505,550,292,78));
		this->addChild(pGameOverSprite);
	}

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	pGameOverSprite->setScale(0.5 * VisibleRect::heightScale());
	pGameOverSprite->setVisible(true);
	pGameOverSprite->setPosition(ccp(screenSize.width/2.0,screenSize.height/2.0));

	CCActionInterval* pRotate = CCRotateBy::create(1.2,360);
	CCActionInterval* pScale =CCScaleTo::create(0.3,1.0 * VisibleRect::widthScale(),1.0 * VisibleRect::heightScale());

	CCSequence* pSequence = CCSequence::create(pRotate,CCDelayTime::create(0.8),pScale,NULL);

	pGameOverSprite->runAction(pSequence);

	this->pAudioManager->playGameOverAudio();
}

void GameLayer::disappearGameOverSprite()
{
	if(pGameOverSprite !=NULL )
	{
		pGameOverSprite->setVisible(false);
	}
}

#pragma  endregion

#pragma region GoodTip

void GameLayer::showGoodTipSprite(int popStarCount)
{
	if(pGoodTipSprite == NULL)
	{
	/*	pGoodTipSprite = new BaseSprite(Game_Good);*/
		pGoodTipSprite = new BaseSprite(Game_Main_Resources, CCRectMake(480,288,313,81));
		pGoodTipSprite->setOpacity(0);
		this->addChild(pGoodTipSprite,200000);
	}

	if(popStarCount>=12)
	{
		/*this->pGoodTipSprite->initSpriteByKey(Game_Fantastic);*/
		this->pGoodTipSprite->initWithFile(Game_Main_Resources, CCRectMake(480, 462, 313, 88));
	}
	else if(popStarCount<12 && popStarCount>=10)
	{
	/*	this->pGoodTipSprite->initSpriteByKey(Game_Excellent);*/
		this->pGoodTipSprite->initWithFile(Game_Main_Resources, CCRectMake(480, 374, 313, 86));
	}
	else if(popStarCount>=8 && popStarCount<10)
	{
		this->pGoodTipSprite->initWithFile(Game_Main_Resources, CCRectMake(480, 288, 313, 81));
	}
	else
		return;

	pGoodTipSprite->setVisible(true);

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();
	this->pGoodTipSprite->setAnchorPoint(CCPointMake(0.5, 0.5));
	this->pGoodTipSprite->setScale(3.0 * VisibleRect::heightScale());
	this->pGoodTipSprite->setPosition(ccp(screenSize.width/2.0,screenSize.width));
	this->pGoodTipSprite->setOpacity(255);

	CCActionInterval* pScaleAction = CCScaleTo::create(0.3,1.0* VisibleRect::widthScale(),1.0* VisibleRect::heightScale());
	CCActionInterval* pFadeOut = CCFadeOut::create(0.1);
	CCActionInterval* pFadeOutDisappear = CCFadeOut::create(0.5);
	CCActionInterval* pFadeIn = CCFadeIn::create(0.1);

	CCSequence* pFadeSequnce = CCSequence::create(pFadeOut,pFadeIn,NULL);
	CCRepeat* pFadeRepeat = CCRepeat::create(pFadeSequnce,3);

	CCSequence* pAction = CCSequence::create(pScaleAction,pFadeRepeat,CCDelayTime::create(1.0),pFadeOutDisappear,CCCallFunc::create(this,callfunc_selector(GameLayer::goodTipCompleted)),NULL);

	this->pGoodTipSprite->runAction(pAction);
}

void GameLayer::goodTipCompleted()
{
	if(pGoodTipSprite!=NULL)
		pGoodTipSprite->setVisible(false);
}

#pragma  endregion

#pragma region 暂停按钮

void GameLayer::showPauseMenu()
{
	if(!canGoback) return;

	unRegisterWithTouchDispatcher();
	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	if(this->pPauseMenu==NULL)
	{
		/*BaseSprite* resumeSprite = new BaseSprite(Game_Resume);*/
		BaseSprite* resumeSprite = new BaseSprite(Game_Main_Resources, CCRectMake(0, 411, 275, 68));
		CCMenuItemSprite* pResumeItem = CCMenuItemSprite::create(resumeSprite,resumeSprite,resumeSprite,this,menu_selector(GameLayer::resumeClick));
		pResumeItem->setScaleX(VisibleRect::widthScale());
		pResumeItem->setScaleY(VisibleRect::heightScale());

		//BaseSprite* saveExit = new BaseSprite(Game_Exit);
		//saveExit->setContentSize(saveExit->getActualSize());
		//saveExit->setPosition(ccp(saveExit->getActualSize().width,0));
		BaseSprite* saveExit = new BaseSprite(Game_Main_Resources, CCRectMake(0, 480, 275, 68));

		CCMenuItemSprite* pExitItem = CCMenuItemSprite::create(saveExit,saveExit,saveExit,this,menu_selector(GameLayer::exitClick));
		pExitItem->setScaleX(VisibleRect::widthScale());
		pExitItem->setScaleY(VisibleRect::heightScale());

		pPauseMenu = CCMenu::create(pResumeItem,pExitItem,NULL);
		this->addChild(pPauseMenu,20000);

		pPauseMenu->alignItemsVerticallyWithPadding(50);
	}

	this->pPauseMenu->setPosition(ccp(screenSize.width/2.0,screenSize.height));

	CCActionInterval* pMoveTo = CCMoveTo::create(0.7,ccp(screenSize.width/2.0,screenSize.height/2.0));

	this->pPauseMenu->runAction(CCEaseElasticOut::create(pMoveTo,0.35f));
}

void GameLayer::disappearPauseMenu()
{
	if(pPauseMenu !=NULL)
	{
		CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

		CCActionInterval* pMoveBy = CCMoveBy::create(0.5,ccp(0,screenSize.height));

		pPauseMenu->runAction(pMoveBy);
	}
}

void GameLayer::resumeClick(CCObject* cObject)
{
	disappearPauseMenu();
	registerWithTouchDispatcher();
}

void GameLayer::exitClick(CCObject* cObject)
{
	pUserDataManager->setStarArrayInfo(getStarArrayString());

	bool isStageGameOver = isStageOver();
	if(isStageGameOver)
	{
		pUserDataManager->setCanContinue(false);
	}
	else
		pUserDataManager->setCanContinue(true);

	pUserDataManager->saveData();

	LayerTransitionManager::replaceScenceToMenuLayer();
}

#pragma endregion

void GameLayer::showExplosionParticle(float dt)
{
	return;
	CCParticleSystemQuad* pParticleSystem = CCParticleExplosion::create();
	pParticleSystem->setTextureWithRect(this->pParticleBatchNode->getTexture(),CCRectMake(900,600,29,29));
	this->pParticleBatchNode->addChild(pParticleSystem);
	pParticleSystem->setAutoRemoveOnFinish(true);
	pParticleSystem->setStartSize(15 * VisibleRect::widthScale());
	pParticleSystem->setEndSize(2 * VisibleRect::widthScale());
	pParticleSystem->setLife(1.0);
	pParticleSystem->setTotalParticles(60);

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	double left = double(rand()%int(screenSize.width));
	double top = screenSize.height/2.0 + double(rand()%int(screenSize.height/2.0));

	pParticleSystem->setPosition(ccp(left,top));

	pAudioManager->playFireAudio();
}

#pragma region 讲星星的数组信息转换成字符串保存

string GameLayer::getStarArrayString()
{
	int starArrayValue[401] = {0};
	int starArrayNumber = -1;

	for(int i= this->starRows - 1;i>=0;i--)
	{
		for(int j=0;j < this->starColumns;j++)
		{
			Star* pStar = starArray[i][j];

			starArrayNumber++;
			starArrayValue[starArrayNumber]= pStar->getColumn();
			starArrayNumber++;
			starArrayValue[starArrayNumber]=pStar->getRow();

			starArrayNumber++;
			bool disappearResult = pStar->getDisapper();
			if(disappearResult)
				starArrayValue[starArrayNumber] = 0;
			else
				starArrayValue[starArrayNumber] = 1;

			starArrayNumber++;
			starArrayValue[starArrayNumber] = pStar->getStarType();
		}
	}

	//starArrayValue[400] = pUserDataManager->getPayHelpCount();
	std::stringstream ss;
	for(int i = 0; i < 401; ++i)
	{
		if(i != 0)
			ss << ",";
		ss << starArrayValue[i];
	}
	std::string strResult = ss.str();

	return strResult;
}


void GameLayer::initStarsByContinue()
{
	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	this->starColumns = 10;
	this->starRows = 10;

	delete pStarArray;
	pStarArray = new CCArray();

	int starNumberIndex = -1;

	string starStringInfo = pUserDataManager->getStarArrayInfo();
	vector<string> vectorStarArrayInfo = StringManager::sharedStringManager()->split(starStringInfo,",");

	double starWidth = screenSize.width / 10.0;
	double margin = starWidth / 2.0;


	for(int i= this->starRows - 1;i>=0;i--)
	{
		for(int j=0;j < this->starColumns;j++)
		{
			starNumberIndex++;
			int column = atoi(vectorStarArrayInfo[starNumberIndex].c_str());
			starNumberIndex++;
			int row = atoi(vectorStarArrayInfo[starNumberIndex].c_str());
			starNumberIndex++;
			int isDisappear = atoi(vectorStarArrayInfo[starNumberIndex].c_str());
			starNumberIndex++;
			int starType = atoi(vectorStarArrayInfo[starNumberIndex].c_str());

			Star* pStar = new Star(this->pSpriteBatchNode->getTexture(),starType);
			starArray[i][j] = pStar;

			pStar->setRow(row);
			pStar->setColumn(column);
			pStar->setDisapper(false);
			pStar->setScale(VisibleRect::widthScale());
			pStar->setContentSize(CCSizeMake(starWidth,starWidth));

			CCSize starSize = pStar->getContentSize();

			double marginLeft = (j * starWidth + margin);
			double marginBottom = (i * starWidth + margin);

			pStar->setMoveTargetPosition(ccp(marginLeft,marginBottom));
			pStar->setPosition(ccp(marginLeft,marginBottom));
			pStar->setStarInSelector(false);
			pStar->setJumpFirst(false);

			if(isDisappear==0)
			{
				pStar->setDisapper(true);
			}
			else
			{
				pStar->setDisapper(false);
				this->pSpriteBatchNode->addChild(pStar);
				pStarArray->addObject(pStar);
			}
		}
	}

	canGoback = true;
}


#pragma endregion


#pragma region 帮助次数奖励机制
void GameLayer::awardStarHelpCount()
{
	int result = pUserDataManager->getCreditsWallInPerTarget();
	if(result>0)
	{
		addCreditsWall(result);
		showAddStarHelpCount(result);
	}
}

void GameLayer::showAddStarHelpCount(int count)
{
	if(pStarHelpSprite == NULL)
	{
		pStarHelpSprite = CCSprite::create(Game_Main_Resources,CCRectMake(624,786,191,191));
		this->addChild(pStarHelpSprite,22000);
		pStarHelpSprite->setVisible(false);

		
	}

	int addScore = pUserDataManager->getCreditsWallInPerTarget();

	switch(addScore)
	{
	case 1:
		pStarHelpSprite->initWithFile(Game_Main_Resources,CCRectMake(624,786,191,191));
		break;
	case 2:
		pStarHelpSprite->initWithFile(Game_Main_Resources,CCRectMake(837,843,191,191));
		break;
	case 3:
		pStarHelpSprite->initWithFile(Game_Main_Resources,CCRectMake(837,631,191,191));
		break;
	case 4:
		pStarHelpSprite->initWithFile(Game_Main_Resources,CCRectMake(837,225,191,191));
		break;
	}

	pStarHelpSprite->setVisible(true);
	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();
	pStarHelpSprite->setScale(3.0);
	pStarHelpSprite->setPosition(ccp(screenSize.width/2.0,screenSize.width * 2.0 / 3.0));

	CCActionInterval* pFadeOut = CCFadeOut::create(0.1);
	CCActionInterval* pFadeIn = CCFadeIn::create(0.1);

	CCActionInterval* pScaleTo = CCScaleTo::create(0.3,1.0,1.0);

	double smallScale =(50*VisibleRect::widthScale()) / pStarHelpSprite->getContentSize().width;

	CCSequence* pFade = CCSequence::create(pFadeOut,pFadeIn,NULL);
	CCRepeat* pRepeat = CCRepeat::create(pFade,3);

	CCSequence* pSequence = CCSequence::create(pScaleTo,pRepeat,CCDelayTime::create(1.0),CCCallFunc::create(this,callfunc_selector(GameLayer::showAddStarHelpCompleted)),NULL);
	this->pStarHelpSprite->runAction(pSequence);
}

void GameLayer::showAddStarHelpCompleted()
{
	CCPoint starHelpSpriteTargetPosition = this->pScoreLayer->getStarPosition();
	CCPoint starHelpSpriteNowPosition = this->pStarHelpSprite->getPosition();

	CCActionInterval* pFadeOut= CCFadeOut::create(0.5);
	double smallScale =(50*VisibleRect::widthScale()) / pStarHelpSprite->getContentSize().width;

	CCActionInterval* pScaleToSmall = CCScaleTo::create(0.5,smallScale,smallScale);
	CCActionInterval* pMoveTo = CCMoveTo::create(0.5,starHelpSpriteTargetPosition);
	CCActionInterval* pSpawn = CCSpawn::create(pMoveTo,pScaleToSmall,NULL);

	CCSequence* pSequence = CCSequence::create(pSpawn,CCCallFunc::create(this,callfunc_selector(GameLayer::addStarHelpAllActionCompleted)),NULL);
	this->pStarHelpSprite->runAction(pSequence);

	addStarHelpParticle();
	pFlowerParticle->setPosition(starHelpSpriteNowPosition);

	CCActionInterval* pParticleMoveTo = CCMoveTo::create(1.0,starHelpSpriteTargetPosition);
	pFlowerParticle->runAction(pParticleMoveTo);
}

void GameLayer::addStarHelpParticle()
{
	if(pFlowerParticle == NULL)
	{
		pFlowerParticle = CCParticleFlower::create();
		pFlowerParticle->setTotalParticles(40);
		pFlowerParticle->setTextureWithRect(this->pParticleBatchNode->getTexture(),CCRectMake(847,455,50,50));

		pFlowerParticle->setStartSize(15 * VisibleRect::widthScale());
		pFlowerParticle->setEndSize(2 * VisibleRect::widthScale());

		CCPoint starHelpSpriteTargetPosition = this->pScoreLayer->getStarPosition();
		pFlowerParticle->setPosition(starHelpSpriteTargetPosition);
	}
}

void GameLayer::addStarHelpAllActionCompleted()
{
	this->pStarHelpSprite->setVisible(false);
}

void GameLayer::addCreditsWall(int num)
{

	return;

	this->pCreditsWall->addCreditsWall(num);
}

void GameLayer::showCreditsWallShop(int num)
{
	//num = pUserDataManager->getSpendCreditsWallInPerTarget();
	//this->pCreditsWall->showCreditsWallShop(num);

	ShopLayer* pShopLayer = ShopLayer::create();
	pShopLayer->setShopProtocol(this->pCreditsWall);
	this->addChild(pShopLayer, 1200008);

}

void GameLayer::removeCreditsWall()
{

	int num = pUserDataManager->getSpendCreditsWallInPerTarget();
	pUserDataManager->mulCoin(num);
	//this->pCreditsWall->removeCreditsWall(num);
}

void GameLayer::showCreditsWall(int num)
{
	//this->pUserDataManager->setGiftHelpCount(num);
	this->pUserDataManager->addCoin(num);
	int starHelpCount = this->pUserDataManager->getHelpCount();
	this->pScoreLayer->setHelpCountLabel(starHelpCount);

	DialogLayer* pDialogLayer = dynamic_cast<DialogLayer*>(this->getChildByTag(100008));
	if(pDialogLayer!=NULL)
	{
		int dialogType = 1;

		if(this->pUserDataManager->canPlayAgainByHelp())
		{
			dialogType = 0;
		}

		pDialogLayer->reInitDialog(dialogType);
	}
}

void GameLayer::initCreditsWall()
{
	this->pCreditsWall = dynamic_cast<cocos2d::plugin::ProtocolCreditsWall*>(PluginManager::getInstance()->loadPlugin("MogoCreditsWall"));
	this->m_MYListerner = new MyCreditsLisener();
	this->m_MYListerner->setGameLayer(this);
	this->pCreditsWall->setCreditsWallListener(m_MYListerner);
	//addCreditsWall(0);
}

void GameLayer::removeCreditsWallObj()
{

}

void MyCreditsLisener::onCreditsWallResult(const char* msg,int ret)
{
	cocos2d::plugin::PluginUtils::outputLog("onCreditsWallResult",msg);
	(dynamic_cast<GameLayer*>(this->pGameLayer))->showCreditsWall(ret);
}

void MyCreditsLisener::setGameLayer(CCNode* pGameLayer)
{
	this->pGameLayer = pGameLayer;
}
#pragma endregion

void GameLayer::onHelpClicked(){

	ShopLayer* pShopLayer = ShopLayer::create();
	pShopLayer->setShopProtocol(this->pCreditsWall);
	pShopLayer->setTag(SHOP_LAYER_TAG);
	this->addChild(pShopLayer, 18000);
}

void GameLayer::test()
{
	//this->schedule(schedule_selector(GameLayer::showExplosionParticle),0.5);
	//showPauseMenu();
	/*showGameOverSprite();*/
	//stageOver();
	//showExtraBounsLabel(1);
	//showGoodTipSprite(13);
	//this->schedule(schedule_selector(GameLayer::showExplosionParticle),0.5);
	//winStage();
	//showAddStarHelpCount();
	//showAddStarHelpCount();
}