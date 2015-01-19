#include "ProtocolCreditsWall.h"
#include "PluginJniHelper.h"
#include <android/log.h>
#include "PluginUtils.h"
#include "PluginJavaData.h"

namespace cocos2d{namespace plugin{

	extern "C"{

		JNIEXPORT void JNICALL Java_org_cocos2dx_plugin_CreditsWallWrapper_nativeOnCreditsWallResult(JNIEnv* env,jobject thiz,jstring className,jint ret,jstring msg)
		{
			std::string strMsg = PluginJniHelper::jstring2string(msg);
			std::string strClassName = PluginJniHelper::jstring2string(className);
			PluginProtocol* pPlugin = PluginUtils::getPluginPtr(strClassName);
			PluginUtils::outputLog("ProtocolCreditsWall","nativeOnCreditsWallResult,Get plugin ptr : %p",pPlugin);
			if(pPlugin!=NULL)
			{
				ProtocolCreditsWall* pCreditsWall = dynamic_cast<ProtocolCreditsWall*>(pPlugin);
				if(pCreditsWall!=NULL)
				{
					pCreditsWall->onCreditsWallResult(strMsg.c_str(),ret);
				}
			}
		}

	}



ProtocolCreditsWall::ProtocolCreditsWall():
	m_pListener(NULL)
{

}

ProtocolCreditsWall::~ProtocolCreditsWall()
{

}

void ProtocolCreditsWall::configDeveloperInfo(TCreditsWallDeveloperInfo devInfo)
{
	if(devInfo.empty())
	{
		PluginUtils::outputLog("ProtocolCreditsWall","The developer info is empty!");
		return;
	}
	else
	{
		PluginJavaData* pData = PluginUtils::getPluginJavaData(this);
		PluginJniMethodInfo t;
		if(PluginJniHelper::getMethodInfo(t,
			pData->jclassName.c_str()
			,"configDeveloperInfo"
			,"(Ljava/util/Hashtable;)V"))
		{
			jobject obj_Map = PluginUtils::createJavaMapObject(&devInfo);

			t.env->CallVoidMethod(pData->jobj,t.methodID,obj_Map);
			t.env->DeleteLocalRef(obj_Map);
			t.env->DeleteLocalRef(t.classID);
		}
	}
}

void ProtocolCreditsWall::showOffer()
{
	PluginJavaData* pData = PluginUtils::getPluginJavaData(this);
	PluginJniMethodInfo t;

	if(PluginJniHelper::getMethodInfo(t
		,pData->jclassName.c_str()
		,"showOffer"
		,"()V"))
	{
		t.env->CallVoidMethod(pData->jobj,t.methodID);
		t.env->DeleteLocalRef(t.classID);
	}
}

void ProtocolCreditsWall::addCreditsWall(int num)
{
	PluginJavaData* pData = PluginUtils::getPluginJavaData(this);
	PluginJniMethodInfo t;

	if(PluginJniHelper::getMethodInfo(t
		,pData->jclassName.c_str()
		,"addCreditsWall"
		,"(I)V"))
	{
		t.env->CallVoidMethod(pData->jobj,t.methodID,num);
		t.env->DeleteLocalRef(t.classID);
	}
}
void ProtocolCreditsWall::exit()
{
	PluginJavaData* pData = PluginUtils::getPluginJavaData(this);
	PluginJniMethodInfo t;

	if(PluginJniHelper::getMethodInfo(t
		,pData->jclassName.c_str()
		,"exit"
		,"()V"))
	{
		t.env->CallVoidMethod(pData->jobj,t.methodID);
		t.env->DeleteLocalRef(t.classID);
	}
}
void ProtocolCreditsWall::removeCreditsWall(int num)
{
	PluginJavaData* pData = PluginUtils::getPluginJavaData(this);
	PluginJniMethodInfo t;

	if(PluginJniHelper::getMethodInfo(t
		,pData->jclassName.c_str()
		,"removeCreditsWall"
		,"(I)V"))
	{
		t.env->CallVoidMethod(pData->jobj,t.methodID,num);
		t.env->DeleteLocalRef(t.classID);
	}
}

void ProtocolCreditsWall::showCreditsWallShop(int num)
{
	PluginJavaData* pData = PluginUtils::getPluginJavaData(this);
	PluginJniMethodInfo t;

	if(PluginJniHelper::getMethodInfo(t
		,pData->jclassName.c_str()
		,"showCreditsWallShop"
		,"(I)V"))
	{
		t.env->CallVoidMethod(pData->jobj,t.methodID,num);
		t.env->DeleteLocalRef(t.classID);
	}
}

void ProtocolCreditsWall::showAdviceDialog()
{
	PluginJavaData* pData = PluginUtils::getPluginJavaData(this);
	PluginJniMethodInfo t;

	if(PluginJniHelper::getMethodInfo(t
		,pData->jclassName.c_str()
		,"showAdviceDialog"
		,"()V"))
	{
		t.env->CallVoidMethod(pData->jobj,t.methodID);
		t.env->DeleteLocalRef(t.classID);
	}
}

void ProtocolCreditsWall::setCreditsWallListener(CreditsWallResultListener* m_pListener)
{
	this->m_pListener = m_pListener;
}

void ProtocolCreditsWall::onCreditsWallResult(const char* msg,int ret)
{
	if(m_pListener)
	{
		m_pListener->onCreditsWallResult(msg,ret);
	}
}

}}

