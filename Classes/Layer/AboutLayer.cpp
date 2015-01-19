#include "AboutLayer.h"
#include "MenuLayer.h"

AboutLayer::AboutLayer():
pBackLayerColor(NULL),
pBackSprite(NULL),
pCloseSprite(NULL),
pTouchingSprite(NULL),
pLabelDeveloperTitle(NULL),
pLabelDeveloperContent(NULL),
pLabelPhoneTitle(NULL),
pLabelPhoneContent(NULL),
pLabelAddressTitle(NULL),
pLabelAddressContent(NULL),
pLabelWebTitle(NULL),
pLabelWebContent(NULL),
pLogoSprite(NULL)
{

}


void AboutLayer::onEnter(){

	CCLayer::onEnter();

	initBackLayerColor();

	initLayout();

	registerWithTouchDispatcher();

}

void AboutLayer::onExit(){

	CCLayer::onExit();

	unRegisterWithTouchDispatcher();

}


#pragma region UI Layout

void AboutLayer::initBackLayerColor(){

	if (pBackLayerColor == NULL){

		pBackLayerColor = CCLayerColor::create(ccc4(0, 0, 0, GAME_BACKGROUND_OPACITY));
		this->addChild(pBackLayerColor);
	}

}

void AboutLayer::initLayout(){

	if (pBackSprite == NULL){

		pBackSprite = CCSprite::create(Game_About);
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

	float positionX = backPositionX + (backSpriteSize.width / 2.0 - 30) * scale - closeSize.width * scale / 2.0;
	float positionY = backPositionY + (backSpriteSize.height / 2.0 - 115) * scale - closeSize.height* scale / 2.0;

	pCloseSprite->setScale(scale);
	pCloseSprite->setAnchorPoint(ccp(0.5, 0.5));
	pCloseSprite->setPosition(ccp(positionX, positionY));

}

void AboutLayer::initLabelContent(){

	//CCSize screenSize = CCDirector::sharedDirector()->getWinSize();

	//float scale = pBackSprite->getScale();

	//float fontSize = 16 * scale;

	//float marginTop = screenSize.height / 2.0 + (pBackSprite->getContentSize().height / 2.0 - 225) * scale;

	//if (pLabelDeveloperTitle == NULL){
	//	pLabelDeveloperTitle = CCLabelTTF::create("开发商", Game_Main_Font_TTF, fontSize);
	//	this->addChild(pLabelDeveloperTitle);
	//}

	//if (pLabelDeveloperContent == NULL){
	//	pLabelDeveloperContent = CCLabelTTF::create("北京广通神州网络技术有限公司", Game_Main_Font_TTF, fontSize);
	//	this->addChild(pLabelDeveloperContent);
	//}

	//if (pLabelPhoneTitle == NULL){
	//	pLabelPhoneTitle = CCLabelTTF::create("电话", Game_Main_Font_TTF, fontSize);
	//	this->addChild(pLabelPhoneTitle);
	//}

	//if (pLabelPhoneContent == NULL){
	//	pLabelPhoneContent = CCLabelTTF::create("020-66840288", Game_Main_Font_TTF, fontSize);
	//	this->addChild(pLabelPhoneContent);
	//}

	//if (pLabelAddressTitle == NULL){

	//	pLabelAddressTitle = CCLabelTTF::create("地址", Game_Main_Font_TTF, fontSize);
	//	this->addChild(pLabelAddressTitle);
	//}

	//if (pLabelAddressContent == NULL){
	//	pLabelAddressContent = CCLabelTTF::create("广东省广州市天河区建工路19号501房", Game_Main_Font_TTF, fontSize);
	//	this->addChild(pLabelAddressContent);
	//}

	//if (pLabelWebTitle == NULL){
	//	pLabelWebTitle = CCLabelTTF::create("官网", Game_Main_Font_TTF, fontSize);
	//	this->addChild(pLabelWebTitle);
	//}

	//if (pLabelWebContent == NULL){
	//	pLabelWebContent = CCLabelTTF::create("http://www.wichina.cn", Game_Main_Font_TTF, fontSize);
	//	this->addChild(pLabelWebContent);
	//}

	//float positionX = screenSize.width / 2.0;

	//float developTitlePositionY = marginTop;
	//float developContentPositionY = developTitlePositionY - pLabelDeveloperContent->getContentSize().height;

	//float phoneTitlePositionY = ;
	//float phoneContentPositionY = ;

	//float addressTitlePositionY = ;
	//float addressContentPositionY = ;

	//float webTitlePositionY = ;
	//float webContentPositionY = ;

	//pLabelDeveloperTitle->setPosition(ccp(positionX, developTitlePositionY));
	//pLabelDeveloperContent->setPosition(ccp(positionX, developContentPositionY));

	//pLabelPhoneTitle->setPosition(ccp(positionX, phoneTitlePositionY));
	//pLabelPhoneContent->setPosition(ccp(positionX, phoneContentPositionY));

	//pLabelAddressTitle->setPosition(ccp(positionX, addressTitlePositionY));
	//pLabelAddressContent->setPosition(ccp(positionX, addressContentPositionY));

	//pLabelWebTitle->setPosition(ccp(positionX, webTitlePositionY));
	//pLabelWebContent->setPosition(ccp(positionX, webContentPositionY));

}

void AboutLayer::initLogoSprite(){

}

#pragma endregion

#pragma region Touch 

void AboutLayer::registerWithTouchDispatcher()
{
	CCDirector::sharedDirector()->getTouchDispatcher()->addTargetedDelegate(this, 0, true);
}

void AboutLayer::unRegisterWithTouchDispatcher()
{
	CCDirector::sharedDirector()->getTouchDispatcher()->removeDelegate(this);
}

bool AboutLayer::ccTouchBegan(CCTouch *pTouch, CCEvent *pEvent)
{
	CCPoint touchPoint = pTouch->getLocation();
	
	bool isTouching = false;

	CCRect closeRect = pCloseSprite->boundingBox();

	if (closeRect.containsPoint(touchPoint)){

		isTouching = true;
		pCloseSprite->initWithFile(Game_Shop_Close_Pressed);
		pTouchingSprite = pCloseSprite;
	}
	
	if (pTouchingSprite != NULL){

		zoomInTouchingSprite();

	}

	return isTouching;
}

void AboutLayer::ccTouchMoved(CCTouch *pTouch, CCEvent *pEvent)
{

	CCPoint touchPoint = pTouch->getLocation();

	if (pTouchingSprite != NULL){

		CCRect touchingRect = pTouchingSprite->boundingBox();

		if (!touchingRect.containsPoint(touchPoint)){

			zoomOutTouchingSprite();

		}

	}

}

void AboutLayer::ccTouchEnded(CCTouch *pTouch, CCEvent *pEvent)
{

	if (pTouchingSprite != NULL){

		if (pTouchingSprite == pCloseSprite){

			onCloseSpriteClicked();
		}

		zoomOutTouchingSprite();

	}

}


#pragma endregion

#pragma region Zoom Touching Sprite

void AboutLayer::zoomInTouchingSprite(){

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

void AboutLayer::zoomOutTouchingSprite(){

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

void AboutLayer::onCloseSpriteClicked(){

	CCNode* pParent = this->getParent();

	if (pParent != NULL){

		MenuLayer* pMenuLayer = dynamic_cast<MenuLayer*>(pParent);
		if (pMenuLayer != NULL){
			pMenuLayer->enableClick(true);
		}

		pParent->removeChild(this, true);
	}

}

#pragma endregion