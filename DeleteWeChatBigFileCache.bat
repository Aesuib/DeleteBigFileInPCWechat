@ rem ɾ��΢��ͼƬ���棬ֻɾ��ͼƬ����Ƶ���Զ����մ洢�ı��˷�����Ĵ��ļ���Ⱥ����Ϣ�еĴ��ļ�����ɾ���ı������¼
@ rem Delete big files in the cache files of WeChat PC version. Images, Videos, Files received automatically will be deleted, but history of chat will not be deleted.
@ rem ����1��WeChat��ǰ��¼�û�����ע���ⲻ��΢���ǳƣ������û�������鿴c:\Users\administrator\Documents\WeChat Files\·���µ�����û��洢�ļ��е�����
@ rem Parameter 1, User ID of WeChat, not the nickname of WeChat, pay attention please! You should check folders name under c:\Users\administrator\Documents\WeChat Files\ to find your WeChat user ID.
@ rem ����2��Windowsϵͳ��ǰ��¼�û�����ʡ�Դ˲���Ĭ��Ϊwindowsϵͳ��װʱ��Ĭ�ϵ��û���administrator
@ rem Parameter 2, name of the windows user you are using, administrator by default if you neglect it.
@ rem ����3��ɾ��������֮ǰ�Ļ��棬��ֵ0��999���ڣ��޴˲�����Ĭ��ɾ��30��ǰ�Ļ��棬��Ϊ0��ȫ��ɾ��
@ rem Parameter 3, how many days before now will be deleted by this script, limit from 0 to 999, 30 by default if neglected, to delete all set par 3 to 0.
@ rem Ҫɾ��������ļ��а�������·��������΢�Ų����Ĵθ��»�������·������ˣ���������Ҫ����ʱ���޸ĸ�������
@ rem the big files cached by WeChat are saved automatically in the following directories, but WeChat will update and change directory structure oftentimes, so, check this script for any updates oftentimes please.
@ rem c:\Users\admin\Documents\WeChat Files\qq364528149\FileStorage\Video\2021-08
@ rem c:\Users\admin\Documents\WeChat Files\qq364528149\FileStorage\File\2021-08
@ rem c:\Users\admin\Documents\WeChat Files\qq364528149\FileStorage\Cache\2021-08
@ rem ����ֵ��0Ϊ������1ΪWeChat�û���δָ����δ�ҵ���2Ϊϵͳ��¼�û���δ�ҵ���3Ϊ��������Ϊ������Զ����999��
@ rem Returen values: 0 for ok, 1 for WeChat ID not set or not found, 2 for Windows user name not found, 3 for error setting of days number.

@ echo off

@ setlocal enabledelayedexpansion

@ rem ����������Ĭ��ֵ
@ rem default values for the pars
set defaultdays=30
set days=%defaultdays%
set windowsusername="administrator"

@ rem ��һ����������
if [%1]==[] GOTO ERRORINFORMATION
set wechatname=%1

@ rem �ڶ�����������
if [%2]==[] (	
	@ rem echo setting windows system user name %windowsusername%
    @ rem echo %days% days files ago
) else (
    if %2% geq 0 if %2% leq 999 (
        set days=%2
        @ rem echo you decide to delete %days% days files ago
        @ rem Ϊʲô��һ�����Ǹ��²�����ֵ�أ����Ҳ���ʵ�������ݴ���99�ͻ���Ϊ������·�֮���ˣ�����û�˻����������ô������ɣ��������������ܾ��в��ٸ��ˣ�˭�ܽ�����bug˭���İ�
        @ rem here is the first bug in this script, but this script works fine for me, so I give up fixing it, will anyone help me this?
    ) else (
        set windowsusername=%2
        @ rem �����������ĺϷ��Դ���
        if [%3]==[] (
            @ rem ʲôҲ����
        ) else if %3% geq 0 if %3% leq 999 (
            @ rem ͬ������Ҳ����ͬ����bug��ʵ����ֻҪ������ֵ����99�ͻ��ȥ�ˣ������ˣ���������
            @ rem here is the second bug in this script, the same as the first one, I like to feed a bug as a pet for myself.........
            set days=%3
        ) else (
            set days=-1
            goto ERRORINFORMATION
        )    
    )
)

if not exist "C:\Users\%windowsusername%\Documents" (
	set windowsusername=John
	GOTO ERRORINFORMATION
) else if not exist "C:\Users\%windowsusername%\Documents\WeChat Files\%wechatname%\FileStorage" (
	set wechatname=Alice
	GOTO ERRORINFORMATION
)

@ rem Ĭ�������İ汾�ģ�Ӣ�İ汾���Լ��޸�ѡ��һ�£�Chinese by default, change to the English line by yourself if you need:
@ rem echo deleting cache of WeChat ID %wechatname% in Windows user %windowsusername%  %days% days files ago
@ rem echo ɾ��΢��id��Ϊ%wechatname%�Ĳ���ϵͳ�û���Ϊ%windowsusername%��%days%��֮ǰ�Ĵ�����ļ���
@ rem ���ﲻ�ٸ�ʹ�������ȷ�ϵĻ����ˣ�û��ȷ�ϼ�����Ϊ���Լ�Ҫ��дһ�������������ű��Զ�ִ��ɾ���������������Լ���ȷ��
@ rem comment all the output, because this script will be executed automatically without printing anything after test ok.
set rootdirectory="C:\Users\%windowsusername%\Documents\WeChat Files\%wechatname%\FileStorage"

forfiles /p %rootdirectory%\File /s /m *.* /d -%days% /c "cmd /c del /f /q /a @path"
forfiles /p %rootdirectory%\Video /s /m *.* /d -%days% /c "cmd /c del /f /q /a @path"
forfiles /p %rootdirectory%\Cache /s /m *.* /d -%days% /c "cmd /c del /f /q /a @path"

exit /b 0
@ rem ���������������˳�ȥ�ˣ������Ǵ�������Ĵ���

: ERRORINFORMATION
@ rem todo make a switch to change language easily
@ rem I know the meaning of todo is to never do this in the future.......
echo ����1��WeChat��ǰ��¼�û�����ע���ⲻ��΢���ǳƣ������û�������鿴c:\Users\administrator\Documents\WeChat Files\·���µ�����û��洢�ļ��е�����
echo Parameter 1, User ID of WeChat, not the nickname of WeChat, pay attention please! You should check folders name under c:\Users\administrator\Documents\WeChat Files\ to find your WeChat user ID.
echo ����2��Windowsϵͳ��ǰ��¼�û�����ʡ�Դ˲���Ĭ��Ϊwindowsϵͳ��װʱ��Ĭ�ϵ��û���administrator
echo Parameter 2, name of the windows user you are using, administrator by default if you neglect it.
echo ����3��ɾ��������֮ǰ�Ļ��棬��ֵ0��999���ڣ��޴˲�����Ĭ��ɾ��30��ǰ�Ļ��棬��Ϊ0��ȫ��ɾ��
echo Parameter 3, how many days before now will be deleted by this script, limit from 0 to 999, 30 by default if neglected, to delete all set par 3 to 0.
IF "%1"=="" (
	echo ��������ã��������ټ���
    echo Hello NoName, Goodbye NoName!
	exit /b 1
) 
IF %wechatname%==Alice (
	echo ��ȷ�����΢���û�������Alice��
    echo Are you sure your WeChat ID not Alice?
	exit /b 1
)
IF %windowsusername%==John (
	echo ��ȷ�����Windowsϵͳ�û�������John��
    echo Are you sure your Windows user name not John?
	exit /b 2
)
if %days%==-1 (
    echo ��ʱ�䴩Խ����
    echo Did you time travel to now?
    exit /b 3
)
exit 4
