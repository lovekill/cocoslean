#ifndef __GameInclude__
#define __GameInclude__

#include <string>
#include <stdlib.h>
using namespace std;

#include "cocos2d.h"
#include "SimpleAudioEngine.h"
USING_NS_CC;
using namespace CocosDenshion;

#define GAME_SCALE_SIZE 0.05
#define GAME_BACKGROUND_OPACITY 200

#define DEFAULT_BACK_COLOR_RED 149
#define DEFAULT_BACK_COLOR_GREEN 218
#define DEFAULT_BACK_COLOR_BLUE 248
#define DEFAULT_BACK_COLOR_ALPHA 255

#define DEFAULT_SCORE_LAYER_SCALE_SIZE 0.9

#define SHOP_LAYER_TAG 65230

#include "GameResources.h"

#include "VisibleRect.h"
#include "Data/AssetManager.h"
#include "Game/BaseSprite.h"
#include "GameString.h"

#include "Layer/GameLayer.h"
#include "Layer/LoadingLayer.h"
#include "Layer/MainLayer.h"
#include "Layer/MenuLayer.h"
#include "Layer/ScoreLayer.h"
#include "Layer/HighScoreLayer.h"
#include "Layer/PlayingScoreLayer.h"
#include "Layer/StageAndTargetLayer.h"
#include "Layer/DialogLayer.h"

#include "Audio/AudioManager.h"

#include "Game/Star.h"

#include "Data/UserDataManager.h"

#include "Manager/LayerTransitionManager.h"

#include "Util/StringManager.h"

#endif