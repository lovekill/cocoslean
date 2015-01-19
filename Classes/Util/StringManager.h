#ifndef __STRING_MANAGER_G__
#define __STRING_MANAGER_G__

#include <string>
#include <vector>
//#include "iconv/iconv.h"
using namespace std;

class StringManager
{
private:
	static StringManager *stringManager;
public:
	static StringManager *sharedStringManager();

	vector<string> split(string str,string pattern);
    //bool StringManager::IConvConvert(const char *from_charset, const char *to_charset, const char *inbuf, int inlen, char *outbuf, int outlen);

	/*std::string StringManager::IConvConvert_GBKToUTF8(const std::string& str);*/
};

#endif