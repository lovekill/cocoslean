#ifndef __LayerTransitionManager__
#define __LayerTransitionManager__

#include "../GameInclude.h"


class LayerTransitionManager
{
public:
	static CCScene* getTransitionTurnOffTiles(float time,CCScene* ccScene);

	static void replaceScenceToMainLayer();
	static void replaceScenceToMenuLayer();
};
#endif