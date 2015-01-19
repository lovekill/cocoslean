#include "ShopLayer.h"

ShopLayer::ShopLayer():
pTouchingSprite(NULL),
pBackLayerColor(NULL),
pCloseSprite(NULL),
pBackSprite(NULL),
protocol(NULL)
{


}


void ShopLayer::onEnter(){

	CCLayer::onEnter();

	initBackLayerColor();

	initLayerOut();

	initPayLayout();

	registerWithTouchDispatcher();

}

void ShopLayer::onExit(){

	CCLayer::onExit();

	unRegisterWithTouchDispatcher();

}


#pragma region UI Layout

void ShopLayer::initBackLayerColor(){

	if (pBackLayerColor == NULL){

		pBackLayerColor = CCLayerColor::create(ccc4(0, 0, 0, GAME_BACKGROUND_OPACITY));
		this->addChild(pBackLayerColor);
	}
}

void ShopLayer::initLayerOut(){

	if (pBackSprite == NULL){

		pBackSprite = CCSprite::create(Game_Shop_Bg);
		this->addChild(pBackSprite);
	}

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	CCSize backSpriteSize = pBackSprite->getContentSize();

	float scale = screenSize.width / backSpriteSize.width;

	float backPositionX = screenSize.width / 2.0;
	float backPositionY = screenSize.height / 2.0;

	pBackSprite->setAnchorPoint(ccp(0.5, 0.5));
	pBackSprite->setPosition(ccp(backPositionX, backPositionY));

	pBackSprite->setScale(scale);

	if (pCloseSprite == NULL){

		pCloseSprite = CCSprite::create(Game_Shop_Close_Normal);
		this->addChild(pCloseSprite);
	}

	CCSize closeSize = pCloseSprite->getContentSize();

	float positionX = backPositionX + (backSpriteSize.width/2.0 - 30) * scale - closeSize.width * scale/2.0;
	float positionY = backPositionY + (backSpriteSize.height / 2.0 - 115) * scale - closeSize.height* scale / 2.0;

	pCloseSprite->setScale(scale);
	pCloseSprite->setAnchorPoint(ccp(0.5, 0.5));
	pCloseSprite->setPosition(ccp(positionX, positionY));

}

void ShopLayer::initPayLayout(){
	
	initArrayData();

	CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	float scale = pBackSprite->getScale();

	int marginTop = (pBackSprite->getContentSize().height/2.0 - 190) * scale + screenSize.height / 2.0;

	float marginLeft = 40 * scale;

	int padding = 15 * scale;

	for (int i = 0; i < SHOP_PAY_CATEGORY; i++){

		CCSprite* pShopItemBgSprite = CCSprite::create(Game_Shop_Item_Bg);

		CCSprite* pCoinSprite = CCSprite::create(Game_Shop_Coin_Bg);

		CCLabelTTF* pLabelTTF = CCLabelTTF::create("", Game_Main_Font_TTF, 26.0f * VisibleRect::widthScale());

		PayButtonSprite* pPayButtonSprite = PayButtonSprite::create(Game_Shop_Button_Bg);

		pShopItemBgSprite->setScale(scale);
		pCoinSprite->setScale(scale);
		//pLabelTTF->setScale(scale);
		pPayButtonSprite->setScale(scale);

		pLabelTTF->setAnchorPoint(ccp(0, 0.5));

		this->addChild(pShopItemBgSprite);
		this->addChild(pCoinSprite);
		this->addChild(pLabelTTF);
		this->addChild(pPayButtonSprite);

		float shopItemBgPositionX = screenSize.width / 2.0;
		float shopItemBgPositionY = marginTop - (i + 0.5) * pShopItemBgSprite->getContentSize().height * scale - i * padding;

		pShopItemBgSprite->setPosition(ccp(shopItemBgPositionX, shopItemBgPositionY));

		float coinPositionX = marginLeft + pCoinSprite->getContentSize().width * scale / 2.0;
		float coinPositionY = shopItemBgPositionY;

		pCoinSprite->setPosition(ccp(coinPositionX, coinPositionY));

		float labelPositionX = coinPositionX + pCoinSprite->getContentSize().width/2.0 * scale;
		float labelPositionY = shopItemBgPositionY;

		pLabelTTF->setPosition(ccp(labelPositionX, labelPositionY));

		float buttonPositionX = screenSize.width - marginLeft - 16 * scale - pPayButtonSprite->getContentSize().width * scale / 2.0;
		float buttonPositionY = shopItemBgPositionY;

		pPayButtonSprite->setPosition(ccp(buttonPositionX, buttonPositionY));

		char temp1[100];
		sprintf(temp1, "%d金币仅需", coinArray[i]);
		pLabelTTF->setString(temp1);

		std::string str = "￥" + payArray[i] + "元";
		pPayButtonSprite->setLabel(str);
		pPayButtonSprite->setTag(i);

		vectorPayButtons.push_back(pPayButtonSprite);

	}

}

void ShopLayer::initArrayData(){

	coinArray[0] = 250;
	coinArray[1] = 100;
	coinArray[2] = 50;
	coinArray[3] = 20;
	coinArray[4] = 10;
	coinArray[5] = 1;

	payArray[0] ="25";
	payArray[1] = "10";
	payArray[2] = "5";
	payArray[3] = "2";
	payArray[4] = "1";
	payArray[5] = "0.1";
}

#pragma endregion


#pragma region Touch

void ShopLayer::registerWithTouchDispatcher()
{
	CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(this, -129, true);
}

void ShopLayer::unRegisterWithTouchDispatcher()
{
	CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool ShopLayer::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent)
{
	CCPoint touchPoint = pTouch->getLocation();

	bool isTouching = true;

	CCRect closeRect = pCloseSprite->boundingBox();

	if (closeRect.containsPoint(touchPoint)){

		pTouchingSprite = pCloseSprite;

		pCloseSprite->initWithFile(Game_Shop_Close_Pressed);

	}

	if (pTouchingSprite == NULL){

		pTouchingSprite = chosePayButton(touchPoint);
	}

	if (pTouchingSprite != NULL){

		isTouching = true;

		if (pCloseSprite != pTouchingSprite){
			zoomInTouchingSprite();
		}
	}

	return isTouching;
}

void ShopLayer::ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent)
{

	CCPoint touchPoint = pTouch->getLocation();

	if (pTouchingSprite != NULL){

		CCRect touchingRect = pTouchingSprite->boundingBox();

		if (!touchingRect.containsPoint(touchPoint)){

			zoomOutTouchingSprite();

		}

	}

}

void ShopLayer::ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent)
{

	if (pTouchingSprite != NULL){

		if (pTouchingSprite == pCloseSprite){

			onCloseSpriteClicked();
		}
		else {

			PayButtonSprite* pPayButtonSprite = dynamic_cast<PayButtonSprite*>(pTouchingSprite);
			onPayButtonClicked(pPayButtonSprite);

		}

		zoomOutTouchingSprite();

	}

}

#pragma endregion

#pragma region Zoom Touching Sprite

void ShopLayer::zoomInTouchingSprite(){

	if (pTouchingSprite == pCloseSprite){

		pCloseSprite->initWithFile(Game_Shop_Close_Normal);
	}
	else {
		float scaleX = pTouchingSprite->getScaleX();
		float scaleY = pTouchingSprite->getScaleY();

		float targetScaleX = scaleX + GAME_SCALE_SIZE;
		float targetScaleY = scaleY + GAME_SCALE_SIZE;

		pTouchingSprite->setScaleX(targetScaleX);
		pTouchingSprite->setScaleY(targetScaleY);
	}
}

void ShopLayer::zoomOutTouchingSprite(){

	if (pTouchingSprite == pCloseSprite){

		pCloseSprite->initWithFile(Game_Shop_Close_Normal);
	}
	else {
		float scaleX = pTouchingSprite->getScaleX();
		float scaleY = pTouchingSprite->getScaleY();

		float targetScaleX = scaleX - GAME_SCALE_SIZE;
		float targetScaleY = scaleY - GAME_SCALE_SIZE;

		pTouchingSprite->setScaleX(targetScaleX);
		pTouchingSprite->setScaleY(targetScaleY);

	}

	pTouchingSprite = NULL;

}

#pragma endregion

#pragma region Sprite Click Event

void ShopLayer::onCloseSpriteClicked(){

	CCNode* pParent = this->getParent();

	if (pParent != NULL){

		MenuLayer* pMenuLayer = dynamic_cast<MenuLayer*>(pParent);
		if (pMenuLayer != NULL){
			pMenuLayer->enableClick(true);
		}

		pParent->removeChild(this, true);
	}

}

void ShopLayer::onPayButtonClicked(PayButtonSprite* payButtonSprite){

	if (payButtonSprite != NULL && protocol != NULL){

		int payNum = payButtonSprite->getTag();
		protocol->showCreditsWallShop(payNum);
	}

	onCloseSpriteClicked();
}

#pragma endregion 

#pragma region Pay

CCSprite* ShopLayer::chosePayButton(CCPoint point){

	if (vectorPayButtons.size() > 0){

		for (int i = 0; i < vectorPayButtons.size(); i++){

			CCSprite* pSprite = dynamic_cast<CCSprite*>(vectorPayButtons.at(i));

			if (pSprite != NULL){
				CCRect boundingBox = pSprite->boundingBox();
				if (boundingBox.containsPoint(point)){
					return pSprite;
				}
			}

		}
	}

	return NULL;

}

#pragma endregion

