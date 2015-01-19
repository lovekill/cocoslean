#include "Star.h"

string Star::normalStars[Star::starTypeCount] = {

	"{{280,340},{48,48}}",
	"{{280,390},{48,48}}",
	"{{280,440},{48,48}}",
	"{{280,490},{48,48}}",
	"{{280,540},{48,48}}"

};

string Star::selectorStars[Star::starTypeCount] = {

	"{{330,340},{48,48}}",
	"{{330,390},{48,48}}",
	"{{330,440},{48,48}}",
	"{{330,490},{48,48}}",
	"{{330,540},{48,48}}"

};

Star::Star() : 
	isDisappear(false),
	jumpFirst(false)
{

}

Star::Star(CCTexture2D* texture2D,int starType)
{
	this->starType = starType;

	CCRect rect = getNormalStarRectByStarType(starType);
	this->initWithTexture(texture2D,rect);
}

CCRect Star::getNormalStarRectByStarType(int starType)
{
	if(starType > starTypeCount)
		starType = starInColumn - 1;

	string rectStr = normalStars[starType];
	CCRect rect = CCRectFromString(rectStr.c_str());
	//string key;
	//switch(starType)
	//{
	//case 0:
	//	key = Game_Star1A;
	//	break;
	//case 1:
	//	key = Game_Star2A;
	//	break;
	//case 2:
	//	key = Game_Star3A;
	//	break;
	//case 3:
	//	key = Game_Star4A;
	//	break;
	//case 4:
	//	key = Game_Star5A;
	//	break;
	//}

	//AssetObject* pAssetObject = AssetManager::getInstance()->getAssetManagerByKey(key);
	//CCRect rect = CCRectFromString(pAssetObject->frame.getCString());

	return rect;
}

CCRect Star::getSelectorStarRectByStarType(int starType)
{
	if(starType > starTypeCount)
		starType = starInColumn - 1;

	string rectStr = selectorStars[starType];
	CCRect rect = CCRectFromString(rectStr.c_str());
	/*string key;

	switch(starType)
	{
	case 0:
		key = Game_Star1B;
		break;
	case 1:
		key = Game_Star2B;
		break;
	case 2:
		key = Game_Star3B;
		break;
	case 3:
		key = Game_Star4B;
		break;
	case 4:
		key = Game_Star5B;
		break;
	}

	AssetObject* pAssetObject = AssetManager::getInstance()->getAssetManagerByKey(key);
	CCRect rect = CCRectFromString(pAssetObject->frame.getCString());*/
	return rect;
}

void Star::setColumn(int column)
{
	this->starInColumn = column;
}

void Star::setRow(int row)
{
	this->starInRow = row;
}

int Star::getColumn()
{
	return this->starInColumn;
}

int Star::getRow()
{
	return this->starInRow;
}

int Star::getStarType()
{
	return this->starType;
}

void Star::setStarInSelector(bool isSelect)
{
	CCRect rect;
	if(isSelect)
	{
		rect = getSelectorStarRectByStarType(this->starType);

		startJumpAction(5);
	}
	else
	{
		rect =getNormalStarRectByStarType(this->starType);
	}

	this->setTextureRect(rect);
}

void Star::setMoveTargetPosition(CCPoint targetPosition)
{
	this->targetPosition = targetPosition;
}

CCPoint Star::getTargetPosition()
{
	return this->targetPosition;
}

void Star::moveToTargetAction(double actionTime)
{
	CCActionInterval* pMoveAction = CCMoveTo::create(actionTime,this->targetPosition);
	CCSequence* pSequence;

	if(this->jumpFirst)
	{
		this->jumpFirst = false;

		CCPoint originPosition = this->getPosition();

		pMoveAction = CCMoveTo::create(actionTime,ccp(this->targetPosition.x,this->targetPosition.y-5));
		CCActionInterval* pBackMoveTo = CCMoveTo::create(0.1,ccp(this->targetPosition.x,this->targetPosition.y));
		CCActionInterval* pJump = CCJumpBy::create(0.08,ccp(this->targetPosition.x - originPosition.x,0),this->getContentSize().height / 5.0,1);
		pSequence = CCSequence::create(pJump,pMoveAction,pBackMoveTo,NULL);
	}
	else
		pSequence = CCSequence::create(pMoveAction,NULL);

	this->runAction(pSequence);
}

void Star::setJumpFirst(bool isJumpFirst)
{
	this->jumpFirst = isJumpFirst;
}

void Star::startJumpAction(double jumpHeight)
{
	CCActionInterval* pJumpAction = CCJumpBy::create(0.1,CCPointZero,jumpHeight,1);
	//CCActionInterval* pJumpBackAction = (pJumpAction)->reverse();

	CCSequence* pSequence = CCSequence::create(pJumpAction,NULL);
	//this->runAction(pSequence);
}

void Star::setDisapper(bool isDisappear)
{
	this->isDisappear = isDisappear;
}

bool Star::getDisapper()
{
	return this->isDisappear;
}


CCRect Star::getStarRect(int starType)
{
	if(starType > starTypeCount)
		starType = starTypeCount - 1;

	string key;
	switch(starType)
	{
	case 0:
		key = Game_Star1A;
		break;
	case 1:
		key = Game_Star2A;
		break;
	case 2:
		key = Game_Star3A;
		break;
	case 3:
		key = Game_Star4A;
		break;
	case 4:
		key = Game_Star5A;
		break;
	}

	AssetObject* pAssetObject = AssetManager::getInstance()->getAssetManagerByKey(key);
	CCRect rect = CCRectFromString(pAssetObject->frame.getCString());

	return rect;
}