#include "AudioManager.h"


AudioManager::AudioManager()
{

}

void AudioManager::playEffectAudio(const char* cStr)
{
	if(!UserDataManager::getInstance()->getMute())
		SimpleAudioEngine::sharedEngine()->playEffect(cStr);
}

void AudioManager::playBrokenAudio()
{
	playEffectAudio(Game_Broken_Audio);
}

void AudioManager::playClickAudio()
{
	playEffectAudio(Game_Click_Audio);
}

void AudioManager::playFireAudio()
{
	playEffectAudio(Game_Fire_Audio);
}

void AudioManager::playGameOverAudio()
{
	playEffectAudio(Game_GameOver_Audio);
}

void AudioManager::playSelectAudio()
{
	playEffectAudio(Game_Select_Audio);
}

void AudioManager::playSettleAudio()
{
	playEffectAudio(Game_Settle_Audio);
}

void AudioManager::playStageClearAudio()
{
	playEffectAudio(Game_StageClear_Audio);
}

void AudioManager::playWinAudio()
{
	playEffectAudio(Game_Win_Audio);
}

void AudioManager::preLoadAudio()
{
	SimpleAudioEngine::sharedEngine()->preloadEffect(Game_Broken_Audio);
		SimpleAudioEngine::sharedEngine()->preloadEffect(Game_Click_Audio);
			SimpleAudioEngine::sharedEngine()->preloadEffect(Game_Fire_Audio);
				SimpleAudioEngine::sharedEngine()->preloadEffect(Game_GameOver_Audio);
					SimpleAudioEngine::sharedEngine()->preloadEffect(Game_Select_Audio);
						SimpleAudioEngine::sharedEngine()->preloadEffect(Game_Settle_Audio);
							SimpleAudioEngine::sharedEngine()->preloadEffect(Game_StageClear_Audio);
								SimpleAudioEngine::sharedEngine()->preloadEffect(Game_Win_Audio);
}

void AudioManager::closeAudio()
{
	SimpleAudioEngine::sharedEngine()->setEffectsVolume(0);
}

void AudioManager::openAudio()
{
	SimpleAudioEngine::sharedEngine()->setEffectsVolume(1.0);
}