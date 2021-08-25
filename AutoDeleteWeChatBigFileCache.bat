@ rem auto delete wechat big files cache every time I start my computer
@ rem 每次开机自动删除微信电脑版本客户端软件缓存的大文件
@ rem based on the other script DeleteWeChatBigFileCache.bat
@ rem 基于另外一个批处理脚本DeleteWeChatBigFileCache.bat
@ rem to make auto execute on system start:
@ rem 如何配置开机自启动：
@ rem create a link to this file in c:\Users\admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
@ rem 在系统开机自启动项目的路径c:\Users\admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup下面给本文件创建一个快捷方式
@ rem where admin is your user name of windows system
@ rem 这里admin是假定你的Windows系统的用户名，需要你自己去查证你自己的用户名是什么
@ rem or just to put this file in the directory, if so, you should modify the call line .bat execute file path 
@ rem 或者直接把此批处理文件放置在开机自启动路径下面，那样就需要修改本文件的call一行指定.bat执行文件的路径

@ echo off
@ rem make sure to modify the following line and uncomment it, test it, before you execute this script and put this script into the system start directory!
@ rem call D:\somepathhere\DeleteWeChatBigFileCache.bat YourWeChatID YourWindowsUserName 10
if errorlevel 1 ( echo WeChat ID error! ) else if errorlevel 2 ( echo Windows user name error! ) else if errorlevel 3 ( echo Days number error! ) else if errorlevel 4 ( echo something error? )
exit