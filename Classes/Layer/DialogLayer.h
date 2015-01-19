#ifndef __DialogLayer__
#define  __DialogLayer__

#include "../GameInclude.h"

class DialogLayer:public CCLayer
{
private:
	void yesClicked(CCObject* ccObject);
	void noClicked(CCObject* ccObject);

	void payClicked(CCObject* ccObject);
	void cancelClicked(CCObject* ccObject);

	int dialogType;

	void restartStageByHelp();
	void stageHelpHasUsed();

	void addPayInfo();
public:
	DialogLayer(int dialogType);

	void initDialog();
	void reInitDialog(int dialogType);
	
};

#endif