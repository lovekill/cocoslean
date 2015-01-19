#include "Admob.h"

const string s_aTestCases[]={

	"Admob",

};

const string s_aTestTypes[]={

	"Banner",
	"Full Screen",

};

const string s_aTestPoses[]={

	"Pos: Center",
	"Pos: Top",
	"Pos: TopLeft",
	"Pos: TopRight",
	"Pos: Bottom",
	"Pos: BottomLeft",
	"Pos: BottomRight",

};


void Admob::initAdmob()
{
	m_pAdmob = dynamic_cast<ProtocolAds*>(PluginManager::getInstance()->loadPlugin("AdsAdmob"));
	TAdsDeveloperInfo devInfo;
	devInfo["AdmobID"] = "a1516fb6b16b12f";
	m_pAdmob->configDeveloperInfo(devInfo);
	m_pListener = new MyAdsListener();
	m_pAdmob->setAdsListener(m_pListener);
	//m_pAdmob->setDebugMode(true);

	m_pAds = m_pAdmob;
	m_ePos = ProtocolAds::kPosCenter;
	m_eType = ProtocolAds::kBannerAd;
}

void Admob::showAdmob()
{
	int nSize = 0;
	if(m_pAds == m_pAdmob)
	{
		nSize = 0;
	}

	if(m_pAds)
	{
		m_pAds->showAds(m_eType,nSize,m_ePos);
	}
}

void Admob::closeAdmob()
{
	m_pAds->hideAds(m_eType);
}

void Admob::unloadAdmob()
{
	if(m_pAdmob != NULL)
	{
		PluginManager::getInstance()->unloadPlugin("AdsAdmob");
		m_pAdmob = NULL;
	}

	if(m_pListener != NULL)
	{
		delete m_pListener;
		m_pListener = NULL;
	}

	PluginManager::end();
}

void MyAdsListener::onAdsResult(AdsResultCode code, const char* msg)
{
}

void MyAdsListener::onPlayerGetPoints(cocos2d::plugin::ProtocolAds* pAdsPlugin, int points)
{
	if (pAdsPlugin != NULL) {
		pAdsPlugin->spendPoints(points);
	}
}