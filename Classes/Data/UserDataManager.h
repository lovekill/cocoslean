#ifndef __UserDataManager__
#define __UserDataManager__

#include "../GameInclude.h"

#define Target_Count 10

class UserDataManager
{
private:
	static UserDataManager* instance;

	static int target[10];

	int originalMaxScore;
	int originalStage;

	int playingScore;
	int playingStage;
	int playingTarget;

	int playingPreScore;

	int playingBouns;

	int theOnePopStarScore;

	int payHelpCount;
	int giftHelpCount;

	int awardStarHelpTarget;

	bool isContinue;
	bool canContinue;
	
	bool isMute;

	string starArrayInfo;

	void savePlayingScore();
	void savePlayingStage();
	void saveTarget();
	void savePlayingArray();
	void saveHelpCount();
	
public:
	UserDataManager();

	static UserDataManager* getInstance();

	void setDefaultValue();

	int getMaxScore();

	int getStarPerScore(int starOrderIndex);
	int getScoreInOnePopStar(int popStarCount);

	int setPlayingStage();
	int setPlayingTarget();

	int getPlayingStage();
	int getPlayingTarget();

	int addPlayingScore(int score);

	int setPlayingBouns(int orderIndex);
	void setPlayingBouns();
	int getPlayingBouns();

	//void setPayHelpCount(int helpCount);
	void setGiftHelpCount(int helpCount);

	/*int getPayHelpCount();*/
	int getGiftHelpCount();
	int getHelpCount();

	bool canPlayAgainByHelp();
	int subtractOnceHelp();

	int setPlayingScoreToPrevStageScore();

	bool getContinue();
	void setContinue(bool isContinue);

	void setCanContinue(bool canContinue);
	bool getCanContinue();

	void setStarArrayInfo(string str);
	string getStarArrayInfo();

	void saveData();
	void initData();

	void saveContinue();
	void saveMute();

	void setMute(bool isMute);
	bool getMute();

	int getCreditsWallInPerTarget();
	int getSpendCreditsWallInPerTarget();

	void setDefaultAwardStarHelpTarget();
	bool awardStarHelpCount();
	int getAwardStarHelpTarget();

	void saveMaxScore();

	int getLocalCoin();
	void setLocalCoin(int coinCount);
	void addCoin(int addCoinCount);
	void mulCoin(int mulCoinCount);
	ccColor4B getBgColor() ;
};

#endif