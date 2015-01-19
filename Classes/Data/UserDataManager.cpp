#include "UserDataManager.h"

int UserDataManager::target[Target_Count] = {

	1000,
	3000,
	6000,
	8000,
	10000,
	13000,
	15000,
	17000,
	20000,
	22000

};

UserDataManager* UserDataManager::instance = NULL;

UserDataManager* UserDataManager::getInstance()
{
	if(instance == NULL)
		instance = new UserDataManager();

	return instance;
}

UserDataManager::UserDataManager()
{
	setDefaultValue();
}

void UserDataManager::setDefaultValue()
{
	this->playingScore = 0;
	this->playingPreScore = 0;

	this->playingStage = 0;
	this->playingTarget = 0;

	this->payHelpCount = 0;
	this->giftHelpCount = 0;

	this->isContinue = false;
	this->canContinue = false;
}

//当传入参数为负数时，直接返回本次消灭星星中的总分数
int UserDataManager::getScoreInOnePopStar(int popStarCount)
{
	if(popStarCount>0)
	{
		int onePopStarScore = 0;

		for(int i = 0 ;i< popStarCount;i++)
		{
			onePopStarScore += getStarPerScore(i);
		}

		this->theOnePopStarScore = onePopStarScore;
	}

	return this->theOnePopStarScore;
}

// starOrderIndex需要从0开始
int UserDataManager::getStarPerScore(int starOrderIndex)
{
	//记分基数
	int scoreCardinalNumber = 5;
	//记分倍数
	int scoreMultipleNumber = 2 * starOrderIndex + 1;

	return scoreCardinalNumber * scoreMultipleNumber;
}

int UserDataManager::addPlayingScore(int score)
{
	this->playingScore += score;
	return this->playingScore;
}

int UserDataManager::setPlayingScoreToPrevStageScore()
{
	this->playingScore = this->playingPreScore;

	return this->playingScore;
}

int UserDataManager::getMaxScore()
{
	if(this->originalMaxScore< this->playingScore)
		this->originalMaxScore = this->playingScore;

	return this->originalMaxScore;
}

int UserDataManager::setPlayingStage()
{
	this->playingStage+=1;

	this->playingPreScore = this->playingScore;

	return this->playingStage;
}

int UserDataManager::getPlayingStage()
{
	return this->playingStage;
}

int UserDataManager::setPlayingTarget()
{
	if(this->playingStage<Target_Count)
	{
		this->playingTarget = target[this->playingStage - 1];
	}
	else
	{
		int num = 3 + rand()%2;
		this->playingTarget+=num * 1000;
	}

	return this->playingTarget;
}

int UserDataManager::getPlayingTarget()
{
	return this->playingTarget;
}

int UserDataManager::setPlayingBouns(int orderIndex)
{
	if(orderIndex>0)
	this->playingBouns =this->playingBouns - (orderIndex*2 - 1) * 20;

	return this->playingBouns;
}

void UserDataManager::setPlayingBouns()
{
	this->playingBouns = 2000;
}

int UserDataManager::getPlayingBouns()
{
	return this->playingBouns;
}

#pragma region 可以玩的关卡次数

//void UserDataManager::setPayHelpCount(int helpCount)
//{
//	if(this->payHelpCount < 0)
//		this->payHelpCount = 0;
//
//	this->payHelpCount +=helpCount;
//}

void UserDataManager::setGiftHelpCount(int helpCount)
{
	this->giftHelpCount = helpCount;
}

int UserDataManager::getCreditsWallInPerTarget()
{
	int creditsWallTarget = 0;

	if(this->getPlayingTarget()>6000 && this->getPlayingTarget()<=20000)
	{
		creditsWallTarget = 1;
	}
	else if(this->getPlayingTarget()>20000 && this->getPlayingTarget()<=40000)
	{
		creditsWallTarget = 2;
	}
	else if(this->getPlayingTarget()>40000 && this->getPlayingTarget()<=60000)
	{
		creditsWallTarget = 3;
	}
	else if(this->getPlayingTarget() > 60000)
	{
		creditsWallTarget = 4;
	}

	return creditsWallTarget;
}

int UserDataManager::getSpendCreditsWallInPerTarget()
{
	int creditsWallTarget = 10;

	//if(this->getPlayingTarget()>0 && this->getPlayingTarget()<=20000)
	//{
	//	creditsWallTarget = 10;
	//}
	//else if(this->getPlayingTarget()>20000 && this->getPlayingTarget()<=40000)
	//{
	//	creditsWallTarget = 20;
	//}
	//else if(this->getPlayingTarget()>40000 && this->getPlayingTarget()<=60000)
	//{
	//	creditsWallTarget = 30;
	//}
	//else if(this->getPlayingTarget() > 60000 && this->getPlayingTarget()<=80000)
	//{
	//	creditsWallTarget = 40;
	//}
	//else if(this->getPlayingTarget()>80000)
	//{
	//	creditsWallTarget = 50;
	//}

	return creditsWallTarget;
}


//int UserDataManager::getPayHelpCount()
//{
//	this->payHelpCount = 0;
//
//	return this->payHelpCount;
//}

int UserDataManager::getGiftHelpCount()
{
	//return this->giftHelpCount;
	return getLocalCoin();
}

int UserDataManager::getHelpCount()
{
	//return this->giftHelpCount;
	return getLocalCoin();
}

bool UserDataManager::canPlayAgainByHelp()
{
	bool result = false;

	//if(this->giftHelpCount >= getSpendCreditsWallInPerTarget())
	//	result = true;

	if (getLocalCoin() >= getSpendCreditsWallInPerTarget()){
		result = true;
	}

	return result;
}

int UserDataManager::subtractOnceHelp()
{
	//if(this->giftHelpCount>0)
	//	this->giftHelpCount-=1;
	//else if(this->payHelpCount > 0)
	//	this->payHelpCount -=1;

	return getHelpCount();
}


#pragma endregion

#pragma  region 数据处理

void UserDataManager::saveMaxScore()
{
	CCUserDefault* pUserDefault = CCUserDefault::sharedUserDefault();
	pUserDefault->setIntegerForKey("T0",this->originalMaxScore);
}

void UserDataManager::savePlayingScore()
{
	CCUserDefault* pUserDefault = CCUserDefault::sharedUserDefault();
	pUserDefault->setIntegerForKey("T1",this->playingScore);
}

void UserDataManager::savePlayingStage()
{
	CCUserDefault* pUserDefault = CCUserDefault::sharedUserDefault();
	pUserDefault->setIntegerForKey("T2",this->playingStage);
}

void UserDataManager::saveTarget()
{
	CCUserDefault* pUserDefault = CCUserDefault::sharedUserDefault();
	pUserDefault->setIntegerForKey("T3",this->playingTarget);
}

//void UserDataManager::saveHelpCount()
//{
//	CCUserDefault* pUserDefault = CCUserDefault::sharedUserDefault();
//	pUserDefault->setIntegerForKey("T4",this->payHelpCount);
//}

void UserDataManager::savePlayingArray()
{
	CCUserDefault* pUserDefault = CCUserDefault::sharedUserDefault();
	pUserDefault->setStringForKey("T5",this->starArrayInfo);
}

void UserDataManager::saveContinue()
{
	CCUserDefault* pUserDefault = CCUserDefault::sharedUserDefault();
	pUserDefault->setBoolForKey("T7",this->canContinue);
}

void UserDataManager::saveMute()
{
	CCUserDefault* pUserDefault = CCUserDefault::sharedUserDefault();
	pUserDefault->setBoolForKey("T6",this->isMute);
}

void UserDataManager::saveData()
{
	 saveMaxScore();
	 savePlayingScore();
	 savePlayingStage();
	 saveTarget();
	 savePlayingArray();
	 //saveHelpCount();

	 CCUserDefault* pUserDefault = CCUserDefault::sharedUserDefault();
	 pUserDefault->setBoolForKey("T6",this->isMute);
	 pUserDefault->setBoolForKey("T7",this->canContinue);
	 pUserDefault->setIntegerForKey("T8",this->playingPreScore);
}

void UserDataManager::initData()
{
	CCUserDefault* pUserDefault = CCUserDefault::sharedUserDefault();

	this->originalMaxScore = pUserDefault->getIntegerForKey("T0");
	this->playingScore = pUserDefault->getIntegerForKey("T1");
	this->playingStage = pUserDefault->getIntegerForKey("T2");
	this->playingTarget = pUserDefault->getIntegerForKey("T3");
	//this->payHelpCount = pUserDefault->getIntegerForKey("T4");
	this->starArrayInfo=pUserDefault->getStringForKey("T5");
	this->isMute = pUserDefault->getBoolForKey("T6");
	this->canContinue = pUserDefault->getBoolForKey("T7");
	this->playingPreScore = pUserDefault->getIntegerForKey("T8");
	this->payHelpCount = 0;
}

void UserDataManager::setContinue(bool isContinue)
{
	this->isContinue = isContinue;
}

bool UserDataManager::getContinue()
{
	return this->isContinue;
}

#pragma endregion

#pragma region 静音

void UserDataManager::setMute(bool isMute)
{
	this->isMute = isMute;

	if(isMute)
		AudioManager::closeAudio();
	else
		AudioManager::openAudio();
}

bool UserDataManager::getMute()
{
	return this->isMute;
}

#pragma endregion

void UserDataManager::setStarArrayInfo(string str)
{
	this->starArrayInfo = str;
}

string UserDataManager::getStarArrayInfo()
{
	return this->starArrayInfo;
}

bool UserDataManager::awardStarHelpCount()
{
	bool result = false;
	if(this->playingScore>=this->awardStarHelpTarget)
	{
		this->awardStarHelpTarget+=15000;
		result = true;
	}

	return result;
}

int UserDataManager::getAwardStarHelpTarget()
{
	return this->awardStarHelpTarget;
}

void UserDataManager::setDefaultAwardStarHelpTarget()
{
	if(this->playingScore<0)
	{
		this->awardStarHelpTarget = 10000;
	}
	else
	{
		this->awardStarHelpTarget = this->playingScore+10000;
	}
}

bool UserDataManager::getCanContinue()
{
	return this->canContinue;
}

void UserDataManager::setCanContinue(bool canContinue)
{
	this->canContinue = canContinue;
}

#pragma region Local Coin

#define LOCAL_COIN_KEY "local_coin"


int UserDataManager::getLocalCoin(){
	
	CCUserDefault* pUserDefault = CCUserDefault::sharedUserDefault();

	return pUserDefault->getIntegerForKey(LOCAL_COIN_KEY, 0);
}

void UserDataManager::setLocalCoin(int coinCount){

	CCUserDefault* pUserDefault = CCUserDefault::sharedUserDefault();

	pUserDefault->setIntegerForKey(LOCAL_COIN_KEY, coinCount);

}

void UserDataManager::addCoin(int addCoinCount){

	int coinCount = getLocalCoin();

	coinCount += addCoinCount;

	setLocalCoin(coinCount);

}

void UserDataManager::mulCoin(int mulCoinCount){

	int coinCount = getLocalCoin();

	coinCount -= mulCoinCount;

	setLocalCoin(coinCount);

}

ccColor4B UserDataManager::getBgColor(){
	const char* path = CCFileUtils::sharedFileUtils()->fullPathForFilename("bg.plist").c_str();
		CCDictionary* plistDic = CCDictionary::createWithContentsOfFile(path);
		if(plistDic){
			CCLog("bg.plist count=%d",plistDic->count()) ;
			CCString* red =dynamic_cast<CCString*> (plistDic->objectForKey("red"));
			CCString* green=dynamic_cast<CCString*> (plistDic->objectForKey("green"));
			CCString* blue=dynamic_cast<CCString*> (plistDic->objectForKey("blue"));
			CCString* alpha=dynamic_cast<CCString*> (plistDic->objectForKey("alpha"));
			return ccc4(red->intValue(), green->intValue(), blue->intValue(), alpha->intValue());
		if(red){
			CCLog("%s-->%d","red-->",red->intValue());
		}else
		{
			CCLog("-->%s--","red is null") ;
		}
		}else
		{
			CCLog("%s is null","plistDic");
			return ccc4(DEFAULT_BACK_COLOR_RED, DEFAULT_BACK_COLOR_GREEN, DEFAULT_BACK_COLOR_BLUE, DEFAULT_BACK_COLOR_ALPHA);
		}
}
#pragma endregion
