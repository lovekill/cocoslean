#ifndef __GameLayer__
#define __GameLayer__

#include "../GameInclude.h"
#include "../ProtocolCreditsWall.h"
#include "../PluginManager.h"
#include "../PluginUtils.h"

class Star;
class ScoreLayer;
class UserDataManager;
class AudioManager;
class BaseSprite;
class GameLayer;
class MyCreditsLisener;
class ProtocolCreditsWall;

class GameLayer:public CCLayer
{
private:
	CCMenu* pPauseMenu;



	CCSpriteBatchNode* pSpriteBatchNode;
	CCParticleBatchNode* pParticleBatchNode;

	CCLabelTTF* pStageLabel;
	CCLabelTTF* pTargetLabel;
	CCLabelTTF* pTipLabel;

	BaseSprite* pStageClearSprite;
	BaseSprite* pGameOverSprite;
	BaseSprite* pGoodTipSprite;
	BaseSprite* pWinSprite;

	CCSprite* pStarHelpSprite;

	AudioManager* pAudioManager;

	ScoreLayer* pScoreLayer;
	UserDataManager* pUserDataManager;

	int starColumns;
	int starRows;

	int labelPlayingScore;
	int labelPlayingNow;

	int extraPointsRetainCounts;
	CCLabelTTF* pExtraBounsLabel;
	CCLabelTTF* pLastStarsLabel;

	CCArray* pStarArray;
	Star* starArray[20][20];
	Star* pSelectingStar;
	CCArray* pSelectingStarArray;

	bool hasTipStageClear;

	void initStars();
	void initStarsByContinue();
	void moveStarts();
	bool touchStar(CCPoint touchPoint);
	void choseStar();

	void filterCloseStars(CCArray* pArray);
	bool isInSelectingStarArray(Star* pStar);
	void displaySelectedStar();
	void removeSelectingStar(float dt);
	void reLayoutColumnStars();
	void reLayoutRowStars();

	void initSpriteBatchNode();
	void removeSpriteBatchNode();

	void initParticleBatchNode();
	void removeParticleBatchNode();

	void ccLabelActionCompleted(CCNode* sender,void* data);

	void startDisappearParticle(CCPoint targetPosition,int starType);
	void startShowScoreAction(CCPoint targetPosition,int starOrderIndex,double actiontime);

	void initScorePanel();

	void showTip(int selectStarCount);
	void disappearTip();

	void setStageAndTarget();

	void flyStageLabel(bool isFlyIn);
	void stageLabelFlyCompleted(CCNode* sender,void* data);
	void flyTargetLabel(bool isFlyIn);
	void targetLabelFlyCompleted(CCNode* sender,void* data);

	void initLevel(float dt=0);
	void initContinueLevel();
	void initLevelData();
	void initDefaultData();

	bool isStageOver();
	void winStage();

	int getNextColumnNotAllDisappear(int nextStartColumnIndex);

	void stageOver(float dt);

	void addExtraPoints(float dt);
	void showExtraBounsLabel(int orderIndex);
	void disappearExtraBounsLabel();
	void addExtraBouns();

	void stageCompleted();
	void showHelpLayer(float dt = 0);

	void showStageClearSprite();
	void disappearStageClearSprite();

	void showGameOverSprite();
	void disappearGameOverSprite();

	void showLastStarCount();

	void showGoodTipSprite(int popStarCount);

	void playingScoreLabelShow(float dt);

	void resumeClick(CCObject* cObject);
	void exitClick(CCObject* cObject);

	void goodTipCompleted();

	void showExplosionParticle(float dt);

	string getStarArrayString();

	void awardStarHelpCount();
	void showAddStarHelpCount(int count);
	void showAddStarHelpCompleted();
	void addStarHelpAllActionCompleted();

	void addStarHelpParticle();
	CCParticleFlower* pFlowerParticle;

	void checkStageClear(float dt);

	void addCreditsWall(int num);
	void removeCreditsWall();

	cocos2d::plugin::ProtocolCreditsWall* pCreditsWall;
	MyCreditsLisener* m_MYListerner;

	void initCreditsWall();
	void removeCreditsWallObj();

	void onHelpClicked();

	void test();
public:
	GameLayer();

	virtual void onEnter();
	virtual void onExit();

	virtual void registerWithTouchDispatcher();
	virtual void unRegisterWithTouchDispatcher();
	virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
	virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
	virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);

	void restartTheStage();

	void showPauseMenu();
	void disappearPauseMenu();
	
	bool canGoback;

	void showCreditsWall(int num);
	void showCreditsWallShop(int num);
};

class MyCreditsLisener:public cocos2d::plugin::CreditsWallResultListener
{
public:
	virtual void onCreditsWallResult(const char* msg,int ret);
	CCNode* pGameLayer;
	void setGameLayer(CCNode* pGameLayer);
};

#endif