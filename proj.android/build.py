import os 
import os.path 
import shutil
import time,datetime
import skin
import re
import sys
reload(sys)
sys.setdefaultencoding('utf8')
packageRe = re.compile(r'\s+package=\"(.+)\"')
appNameRe = re.compile(r'.+app_name\">(.+)<.+')
actionRe = re.compile(r'.+name=\"(.+)\.com\.mmiap\.activity.+')
serviceRe = re.compile(r'.+name=\"(.+)\.purchaseservice\.BIND')
def copyFiles(sourceDir,  targetDir): 
    if sourceDir.find(".svn") > 0: 
        return 
    for file in os.listdir(sourceDir): 
        sourceFile = os.path.join(sourceDir,  file) 
        targetFile = os.path.join(targetDir,  file) 
        if os.path.isfile(sourceFile): 
            if not os.path.exists(targetDir):  
                os.makedirs(targetDir)  
            if not os.path.exists(targetFile) or(os.path.exists(targetFile)):  
                    open(targetFile, "wb").write(open(sourceFile, "rb").read()) 
        if os.path.isdir(sourceFile): 
            copyFiles(sourceFile, targetFile)
def setpackage(targetPackageName):
    f= open("./AndroidManifest.xml",'r')
    read = f.readlines()
    f.close()
    wf = open("./AndroidManifest.xml",'w')
    for line in read:
        m = packageRe.match(line)
        actm = actionRe.match(line)
        servicem = serviceRe.match(line)
        if m:
            line = line.replace(m.group(1),targetPackageName)
        elif actm:
            line = line.replace(actm.group(1),targetPackageName)
            print line
        elif servicem:
            if "aspire" not in servicem.group(1):
                line = line.replace(servicem.group(1),targetPackageName)
        wf.write(line)
    wf.close()

def copyIcon(iconPath):
    shutil.copyfile(iconPath,"./res/drawable/icon.png")
    shutil.copyfile(iconPath,"./res/drawable-hdpi/icon.png")
    shutil.copyfile(iconPath,"./res/drawable-ldpi/icon.png")
    shutil.copyfile(iconPath,"./res/drawable-mdpi/icon.png")
def prebuild():
    apkdir = os.path.join(".","apk")
    if(os.path.exists(apkdir)):
        shutil.rmtree(apkdir)
    os.makedirs(apkdir)

def build():
    message = os.system("ant release")
    print message 

def copyAPKandReName(apkName):
    print "-----copy apk-------------"
    shutil.move(r'./bin/PopStar-release.apk',"./apk/"+apkName+"_mm.apk")

if __name__=='__main__':
    prebuild()
    for appName,packageName,resouce in skin.skin:
       os.system("ant clean")
       shutil.copyfile(resouce+"/strings.xml","res/values/strings.xml") 
       setpackage(packageName)
       if(os.path.exists("./assets")):
           shutil.rmtree("./assets")
       os.makedirs("./assets")
       copyIcon(resouce+"/icon.png")
       copyFiles(resouce,"./assets")
       build()
       copyAPKandReName(appName.decode('utf-8'))
        
