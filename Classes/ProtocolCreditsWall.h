#ifndef __CCX_PROTOCOL_CREDITSWALL_H__
#define __CCX_PROTOCOL_CREDITSWALL_H__

#include "PluginProtocol.h"
#include <map>
#include <string>

namespace cocos2d{namespace plugin{

typedef std::map<std::string,std::string> TCreditsWallDeveloperInfo;

class CreditsWallResultListener
{
public:
	virtual void onCreditsWallResult(const char* msg,int ret) = 0;
};

class ProtocolCreditsWall:public PluginProtocol
{
public:
	ProtocolCreditsWall();
	virtual ~ProtocolCreditsWall();

	void configDeveloperInfo(TCreditsWallDeveloperInfo devInfo);

	void showOffer();

	void setCreditsWallListener(CreditsWallResultListener* m_pListener);

	void onCreditsWallResult(const char* msg,int ret);

	void addCreditsWall(int num);
	void removeCreditsWall(int num);

	void showCreditsWallShop(int num);
	void showAdviceDialog();
	void exit() ;

protected:
	CreditsWallResultListener* m_pListener;
};

}}

#endif