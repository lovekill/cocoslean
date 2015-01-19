#ifndef __Admob__
#define __Admob__

#include "../GameInclude.h"

class MyAdsListener : public cocos2d::plugin::AdsListener
{
public:
	virtual void onAdsResult(cocos2d::plugin::AdsResultCode code, const char* msg);
	virtual void onPlayerGetPoints(cocos2d::plugin::ProtocolAds* pAdsPlugin, int points);
};

class Admob
{
public:

	MyAdsListener* m_pListener;
	cocos2d::plugin::ProtocolAds* m_pAdmob;

	cocos2d::plugin::ProtocolAds* m_pAds;
	cocos2d::plugin::ProtocolAds::AdsPos m_ePos;
	cocos2d::plugin::ProtocolAds::AdsType m_eType;

	void initAdmob();
	void unloadAdmob();

	void showAdmob();
	void closeAdmob();
};

#endif