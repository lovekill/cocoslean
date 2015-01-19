#ifndef __PAY_BUTTON_SPRITE__
#define __PAY_BUTTON_SPRITE__

#include "../GameInclude.h"
#include "BaseSprite.h"

class BaseSprite;

class PayButtonSprite : public CCSprite{

private:

	CCLabelTTF* pLabelTTF;

	PayButtonSprite();

public:

	static PayButtonSprite* create(const char* filename);

	void setLabel(std::string label);

};

#endif