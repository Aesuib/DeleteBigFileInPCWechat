@ rem 删除微信图片缓存，只删除图片、视频和自动接收存储的别人发给你的大文件、群聊消息中的大文件，不删除文本聊天记录
@ rem Delete big files in the cache files of WeChat PC version. Images, Videos, Files received automatically will be deleted, but history of chat will not be deleted.
@ rem 参数1，WeChat当前登录用户名，注意这不是微信昵称，而是用户名，请查看c:\Users\administrator\Documents\WeChat Files\路径下的你的用户存储文件夹的名称
@ rem Parameter 1, User ID of WeChat, not the nickname of WeChat, pay attention please! You should check folders name under c:\Users\administrator\Documents\WeChat Files\ to find your WeChat user ID.
@ rem 参数2，Windows系统当前登录用户名，省略此参数默认为windows系统安装时候默认的用户名administrator
@ rem Parameter 2, name of the windows user you are using, administrator by default if you neglect it.
@ rem 参数3，删除多少天之前的缓存，限值0到999以内，无此参数则默认删除30天前的缓存，设为0则全部删除
@ rem Parameter 3, how many days before now will be deleted by this script, limit from 0 to 999, 30 by default if neglected, to delete all set par 3 to 0.
@ rem 要删除缓存的文件夹包括如下路径，但是微信不定哪次更新会变更缓存路径，因此，本程序需要不定时的修改更新升级
@ rem the big files cached by WeChat are saved automatically in the following directories, but WeChat will update and change directory structure oftentimes, so, check this script for any updates oftentimes please.
@ rem c:\Users\admin\Documents\WeChat Files\qq364528149\FileStorage\Video\2021-08
@ rem c:\Users\admin\Documents\WeChat Files\qq364528149\FileStorage\File\2021-08
@ rem c:\Users\admin\Documents\WeChat Files\qq364528149\FileStorage\Cache\2021-08
@ rem 返回值：0为正常，1为WeChat用户名未指定或未找到，2为系统登录用户名未找到，3为设置天数为负或者远超过999天
@ rem Returen values: 0 for ok, 1 for WeChat ID not set or not found, 2 for Windows user name not found, 3 for error setting of days number.

@ echo off

@ setlocal enabledelayedexpansion

@ rem 声明变量的默认值
@ rem default values for the pars
set defaultdays=30
set days=%defaultdays%
set windowsusername="administrator"

@ rem 第一个参数处理
if [%1]==[] GOTO ERRORINFORMATION
set wechatname=%1

@ rem 第二个参数处理
if [%2]==[] (	
	@ rem echo setting windows system user name %windowsusername%
    @ rem echo %days% days files ago
) else (
    if %2% geq 0 if %2% leq 999 (
        set days=%2
        @ rem echo you decide to delete %days% days files ago
        @ rem 为什么这一行总是更新不了数值呢？并且测试实际上数据大于99就会认为在这件衣服之外了，但是没人会真的设置这么大的数吧，所以这里我能跑就行不再改了，谁能解决这个bug谁来改吧
        @ rem here is the first bug in this script, but this script works fine for me, so I give up fixing it, will anyone help me this?
    ) else (
        set windowsusername=%2
        @ rem 第三个参数的合法性处理
        if [%3]==[] (
            @ rem 什么也不做
        ) else if %3% geq 0 if %3% leq 999 (
            @ rem 同样这里也存在同样的bug，实际上只要输入数值大于99就会出去了，不管了，反正能跑
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

@ rem 默认是中文版本的，英文版本的自己修改选择一下：Chinese by default, change to the English line by yourself if you need:
@ rem echo deleting cache of WeChat ID %wechatname% in Windows user %windowsusername%  %days% days files ago
@ rem echo 删除微信id号为%wechatname%的操作系统用户名为%windowsusername%的%days%天之前的大体积文件！
@ rem 这里不再给使用者最后确认的机会了，没有确认键，因为我自己要再写一个开机自启动脚本自动执行删除操作，无需我自己再确认
@ rem comment all the output, because this script will be executed automatically without printing anything after test ok.
set rootdirectory="C:\Users\%windowsusername%\Documents\WeChat Files\%wechatname%\FileStorage"

forfiles /p %rootdirectory%\File /s /m *.* /d -%days% /c "cmd /c del /f /q /a @path"
forfiles /p %rootdirectory%\Video /s /m *.* /d -%days% /c "cmd /c del /f /q /a @path"
forfiles /p %rootdirectory%\Cache /s /m *.* /d -%days% /c "cmd /c del /f /q /a @path"

exit /b 0
@ rem 正常情况从这里就退出去了，下面是错误输入的处理

: ERRORINFORMATION
@ rem todo make a switch to change language easily
@ rem I know the meaning of todo is to never do this in the future.......
echo 参数1，WeChat当前登录用户名，注意这不是微信昵称，而是用户名，请查看c:\Users\administrator\Documents\WeChat Files\路径下的你的用户存储文件夹的名称
echo Parameter 1, User ID of WeChat, not the nickname of WeChat, pay attention please! You should check folders name under c:\Users\administrator\Documents\WeChat Files\ to find your WeChat user ID.
echo 参数2，Windows系统当前登录用户名，省略此参数默认为windows系统安装时候默认的用户名administrator
echo Parameter 2, name of the windows user you are using, administrator by default if you neglect it.
echo 参数3，删除多少天之前的缓存，限值0到999以内，无此参数则默认删除30天前的缓存，设为0则全部删除
echo Parameter 3, how many days before now will be deleted by this script, limit from 0 to 999, 30 by default if neglected, to delete all set par 3 to 0.
IF "%1"=="" (
	echo 无名氏你好，无名氏再见！
    echo Hello NoName, Goodbye NoName!
	exit /b 1
) 
IF %wechatname%==Alice (
	echo 你确认你的微信用户名不是Alice吗？
    echo Are you sure your WeChat ID not Alice?
	exit /b 1
)
IF %windowsusername%==John (
	echo 你确认你的Windows系统用户名不是John吗？
    echo Are you sure your Windows user name not John?
	exit /b 2
)
if %days%==-1 (
    echo 你时间穿越了吗？
    echo Did you time travel to now?
    exit /b 3
)
exit 4
