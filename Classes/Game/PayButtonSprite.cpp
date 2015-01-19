#include "PayButtonSprite.h"

PayButtonSprite::PayButtonSprite() :
pLabelTTF(NULL)
{

}

PayButtonSprite* PayButtonSprite::create(const char* filename){

	PayButtonSprite* pPayButtonSprite = new PayButtonSprite();

	if (pPayButtonSprite != NULL && pPayButtonSprite->initWithFile(filename)){

		pPayButtonSprite->autorelease();

		return pPayButtonSprite;
	} 

	CC_SAFE_DELETE(pPayButtonSprite);
	pPayButtonSprite = NULL;

	return NULL;
}

void PayButtonSprite::setLabel(std::string label){

	if (pLabelTTF == NULL){
		pLabelTTF = CCLabelTTF::create("", Game_Main_Font_TTF, 24);
		this->addChild(pLabelTTF);
	}

	CCSize spriteSize = this->getContentSize();

	pLabelTTF->setAnchorPoint(ccp(.5, 0.5));
	pLabelTTF->setPosition(ccp(spriteSize.width / 2.0,spriteSize.height / 2.0));

	pLabelTTF->setString(label.c_str());

}