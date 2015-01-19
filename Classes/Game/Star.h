#ifndef __Star__
#define __Star__

#include "../GameInclude.h"

class Star : public CCSprite
{
private:
	int starInColumn;
	int starInRow;

	const static int starTypeCount = 5;

	int starType;
	CCPoint targetPosition;
	bool isDisappear;
	bool jumpFirst;

	static string normalStars[starTypeCount];
	static string selectorStars[starTypeCount];

	CCRect getNormalStarRectByStarType(int starType);
	CCRect getSelectorStarRectByStarType(int starType);

public:
	Star();

	Star(CCTexture2D* texture2D,int starType);

	void setColumn(int column);
	void setRow(int row);

	int getColumn();
	int getRow();

	int getStarType();

	void setDisapper(bool isDisappear);
	bool getDisapper();

	void setMoveTargetPosition(CCPoint targetPosition);
	void moveToTargetAction(double actionTime);

	CCPoint getTargetPosition();

	void startJumpAction(double jumpHeight);

	void setStarInSelector(bool isSelect);

	void setJumpFirst(bool isJumpFirst);

	static CCRect getStarRect(int starType);
};

#endif