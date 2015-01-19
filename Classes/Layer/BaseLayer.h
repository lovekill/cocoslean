#ifndef __BaseLayer__
#define __BaseLayer__

#include "../GameInclude.h"

class BaseLayer:public CCLayer
{
public:
	virtual void keyBackClicked();
	virtual void keyMenuClicked();
};

#endif