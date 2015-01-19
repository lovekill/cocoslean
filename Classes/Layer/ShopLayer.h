#ifndef __SHOP_LAYER__
#define __SHOP_LAYER__

#include "../GameInclude.h"
#include "Game/PayButtonSprite.h"

#define SHOP_PAY_CATEGORY 6

class PayButtonSprite;

class ShopLayer : public CCLayer{

private:

	cocos2d::plugin::ProtocolCreditsWall* protocol;

	int coinArray[SHOP_PAY_CATEGORY];
	std::string payArray[SHOP_PAY_CATEGORY];

	CCSprite* pTouchingSprite;
	CCSprite* pBackSprite;
	CCSprite* pCloseSprite;

	CCLayerColor* pBackLayerColor;

	std::vector<PayButtonSprite*> vectorPayButtons;

	ShopLayer();

	void zoomInTouchingSprite();
	void zoomOutTouchingSprite();

	void initBackLayerColor();
	void initLayerOut();

	void onCloseSpriteClicked();

	void initPayLayout();

	void initArrayData();

	CCSprite* chosePayButton(CCPoint point);
	void onPayButtonClicked(PayButtonSprite* payButtonSprite);

public:

	CREATE_FUNC(ShopLayer);

	virtual void onEnter();
	virtual void onExit();

	virtual void registerWithTouchDispatcher();
	virtual void unRegisterWithTouchDispatcher();
	virtual bool ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent);
	virtual void ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent);
	virtual void ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent);

	void setShopProtocol(cocos2d::plugin::ProtocolCreditsWall* protocol){

		this->protocol = protocol;
	}

};

#endif