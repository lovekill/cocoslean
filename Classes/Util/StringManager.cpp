#include "StringManager.h"

StringManager *StringManager::stringManager = 0;

StringManager *StringManager::sharedStringManager()
{
	if(stringManager==NULL)
		stringManager = new StringManager();

	return stringManager;
}

vector<string> StringManager::split(string str,string pattern)
{
	string::size_type pos;
	vector<string> result;
	str+=pattern;

	int size = str.size();

	for(int i=0;i<size;i++)
	{
		pos = str.find(pattern,i);
		if(pos<size)
		{
			string s = str.substr(i,pos-i);
			result.push_back(s);
			i=pos+pattern.size()-1;
		}
	}

	return result;
}


//bool StringManager::IConvConvert(const char *from_charset, const char *to_charset, const char *inbuf, int inlen, char *outbuf, int outlen) 
//{
//	iconv_t cd = iconv_open(to_charset, from_charset);
//	if (cd == 0) return false;
//	const char **pin = &inbuf;
//	char **pout = &outbuf;
//	memset(outbuf,0,outlen);
//	size_t ret = iconv(cd,pin,(size_t *)&inlen,pout,(size_t *)&outlen);
//	iconv_close(cd);
//	return ret == (size_t)(-1) ? false : true;
//
//}
//
//std::string StringManager::IConvConvert_GBKToUTF8(const std::string& str)
//{
//	const char* textIn = str.c_str();
//	char textOut[256];
//	bool ret = IConvConvert("gb2312", "utf-8", textIn, strlen(textIn),textOut, 256);
//	return ret ? string(textOut) : string();
//}