@echo off
title Menu
:begin
	echo 你想要...
	echo 0. 什么都不要做，退出
	echo 1. 重启frpc
	echo 2. 关闭frpc
	echo 3. 启动frpc
	set /p choice=请输入选择:
	if %choice%==0 exit
	if %choice%==1 goto restart_menu
	if %choice%==2 goto kill_menu
	if %choice%==3 goto start
	color 04
	echo 无效输入！
	timeout /t 3
	cls
	color 07
	goto begin
:restart_menu
	echo 这会使活动中的RDP连接中断一段时间
	set /p choice=是否要继续？(y/n): 
	if %choice%==y goto restart
	if %choice%==n exit
	color 04
	echo 无效输入！
	timeout /t 3
	cls
	color 07
	goto restart_menu
:restart
	for /f "tokens=2" %%i in ('tasklist /v ^| find /i "cmd.exe" ^|find /i "frpc"')do taskkill /f /pid %%i
	for /f "tokens=2" %%i in ('tasklist /v ^| find /i "frpc.exe"')do taskkill /f /pid %%i
	timeout /t 3
	start frpc.cmd
	exit
:kill_menu
	echo 这会使活动中的RDP彻底断开连接！
	set /p choice=是否要继续？(y/n): 
	if %choice%==y goto kill
	if %choice%==n exit
	color 04
	echo 无效输入！
	timeout /t 3
	cls
	color 07
	goto kill_menu
:kill
	for /f "tokens=2" %%i in ('tasklist /v ^| find /i "cmd.exe" ^|find /i "frpc"')do taskkill /f /pid %%i
	for /f "tokens=2" %%i in ('tasklist /v ^| find /i "frpc.exe"')do taskkill /f /pid %%i
	timeout /t 3
	exit
:start
	start frpc.cmd
	exit