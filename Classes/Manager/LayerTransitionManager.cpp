#include"LayerTransitionManager.h"

CCScene* LayerTransitionManager::getTransitionTurnOffTiles(float time,CCScene* ccScene)
{
	return CCTransitionTurnOffTiles::create(time,ccScene);
}

void LayerTransitionManager::replaceScenceToMainLayer()
{
	CCScene* mainGameScene = CCScene::create();
	MainLayer* pMainLayer = new MainLayer();
	mainGameScene->addChild(pMainLayer);
	mainGameScene->setTag(29);

	CCScene* pScence = getTransitionTurnOffTiles(1.0,mainGameScene);

	CCDirector::sharedDirector()->replaceScene(pScence);
}

void LayerTransitionManager::replaceScenceToMenuLayer()
{
	CCScene* menuScence = CCScene::create();
	MenuLayer* pMenuLayer = new MenuLayer();
	menuScence->addChild(pMenuLayer);
	menuScence->setTag(1);

	CCDirector::sharedDirector()->replaceScene(menuScence);
}