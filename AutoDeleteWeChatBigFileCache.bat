@ rem auto delete wechat big files cache every time I start my computer
@ rem ÿ�ο����Զ�ɾ��΢�ŵ��԰汾�ͻ����������Ĵ��ļ�
@ rem based on the other script DeleteWeChatBigFileCache.bat
@ rem ��������һ��������ű�DeleteWeChatBigFileCache.bat
@ rem to make auto execute on system start:
@ rem ������ÿ�����������
@ rem create a link to this file in c:\Users\admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
@ rem ��ϵͳ������������Ŀ��·��c:\Users\admin\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup��������ļ�����һ����ݷ�ʽ
@ rem where admin is your user name of windows system
@ rem ����admin�Ǽٶ����Windowsϵͳ���û�������Ҫ���Լ�ȥ��֤���Լ����û�����ʲô
@ rem or just to put this file in the directory, if so, you should modify the call line .bat execute file path 
@ rem ����ֱ�ӰѴ��������ļ������ڿ���������·�����棬��������Ҫ�޸ı��ļ���callһ��ָ��.batִ���ļ���·��

@ echo off
@ rem make sure to modify the following line and uncomment it, test it, before you execute this script and put this script into the system start directory!
@ rem call D:\somepathhere\DeleteWeChatBigFileCache.bat YourWeChatID YourWindowsUserName 10
if errorlevel 1 ( echo WeChat ID error! ) else if errorlevel 2 ( echo Windows user name error! ) else if errorlevel 3 ( echo Days number error! ) else if errorlevel 4 ( echo something error? )
exit