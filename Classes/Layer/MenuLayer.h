#ifndef __MenuLayer__
#define  __MenuLayer__

#include "../GameInclude.h"
#include "../ProtocolCreditsWall.h"
#include "../PluginManager.h"
#include "../PluginUtils.h"

#include "AboutLayer.h"
#include "ShopLayer.h"

using namespace cocos2d::plugin;

class HighScoreLayer;
class AudioManager;
class AboutLayer;
class ShopLayer;

class MenuLayer:public CCLayer
{
private:

	cocos2d::plugin::ProtocolCreditsWall* protocol;
	CCLayerColor* pLayerColor;
	CCSprite* pSpriteLogo;
	CCMenu* pMenu;
	CCMenu* pAdviceAndOffer;
	HighScoreLayer* pHighScoreLayer;

	AudioManager* pAudioManager;

	CCParticleBatchNode* pParticleBatchNode;

	double marginTop;

	void initBackground();

	void initMenuBotton();
	void initMenuScene(float dt);
	void initMenuLogo();
	//void ccControlTouchInsie(CCObject * sender,CCControlEvent controlEvent);
	void showHighScoreLayer();

	void newGameClicked(CCObject* ccObject);
	void continueGameClicked(CCObject* ccObject);
	void gameExit(CCObject* ccObject);
	void adviceClicked(CCObject* ccObject);
	void offerClicked(CCObject* ccObject);

	void showParticle(float dt);
	void showExplosionParticle(float dt);

	void initAdviceAndOfferButton();

	cocos2d::plugin::ProtocolCreditsWall* pCreditsWall;
	void initCreditsWall();

	void showAboutLayer();

public:
	MenuLayer();

	virtual void onEnter();
	virtual void onExit();

	virtual void keyBackClicked();
	virtual void keyMenuClicked();

	void enableClick(bool isEnable);

	void saveData(int coinCount);
	void setShopProtocol(cocos2d::plugin::ProtocolCreditsWall* protocol){

		this->protocol = protocol;
	}

};

class MenuCreditsLisener :public cocos2d::plugin::CreditsWallResultListener
{
public:
	virtual void onCreditsWallResult(const char* msg, int ret);
	CCNode* pGameLayer;
	void setGameLayer(CCNode* pGameLayer);
};

#endif