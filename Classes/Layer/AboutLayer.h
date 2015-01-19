#ifndef __ABOUT_LAYER__
#define __ABOUT_LAYER__

#include "GameInclude.h"

class AboutLayer : public CCLayer{

private:

	CCLayerColor* pBackLayerColor;

	CCSprite* pBackSprite;
	CCSprite* pCloseSprite;

	CCSprite* pTouchingSprite;

	CCLabelTTF* pLabelDeveloperTitle;
	CCLabelTTF* pLabelDeveloperContent;

	CCLabelTTF* pLabelPhoneTitle;
	CCLabelTTF* pLabelPhoneContent;

	CCLabelTTF* pLabelAddressTitle;
	CCLabelTTF* pLabelAddressContent;

	CCLabelTTF* pLabelWebTitle;
	CCLabelTTF* pLabelWebContent;

	CCSprite* pLogoSprite;

	AboutLayer();

	void initBackLayerColor();
	void initLayout();

	void zoomInTouchingSprite();
	void zoomOutTouchingSprite();

	void onCloseSpriteClicked();

	void initLabelContent();
	void initLogoSprite();

public:

	CREATE_FUNC(AboutLayer);

	virtual void onEnter();
	virtual void onExit();

	virtual void registerWithTouchDispatcher();
	virtual void unRegisterWithTouchDispatcher();
	virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
	virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
	virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);


};

#endif