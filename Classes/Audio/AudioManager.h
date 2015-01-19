#ifndef __AudioManager__
#define __AudioManager__

#include "../GameInclude.h"

class AudioManager
{
private:
	void playEffectAudio(const char* cStr);

public:
	AudioManager();

	void preLoadAudio();

	void playBrokenAudio();
	void playClickAudio();
	void playFireAudio();
	void playGameOverAudio();
	void playSelectAudio();
	void playSettleAudio();
	void playStageClearAudio();
	void playWinAudio();

	static void closeAudio();
	static void openAudio();
};

#endif