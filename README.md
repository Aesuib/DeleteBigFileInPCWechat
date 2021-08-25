# DeleteBigFileInPCWechat
Scripts to delete big files automatically downloaded by WeChat PC version, it eats my hard disk space 1G every day! make me annoyed very much!
Then，I wrote these scripts, I have used these for several weeks, and work fine!
There are only two scripts:

The use of script **DeleteWeChatBigFileCache.bat** is to use by hand:
```bat
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
```

and the use of script **AutoDeleteWeChatBigFileCache.bat** is make it auto exec on system start:
```bat
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
```

Enjoy yourselves!
