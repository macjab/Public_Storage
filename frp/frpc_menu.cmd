@echo off
title Menu
:begin
	echo ����Ҫ...
	echo 0. ʲô����Ҫ�����˳�
	echo 1. ����frpc
	echo 2. �ر�frpc
	echo 3. ����frpc
	set /p choice=������ѡ��:
	if %choice%==0 exit
	if %choice%==1 goto restart_menu
	if %choice%==2 goto kill_menu
	if %choice%==3 goto start
	color 04
	echo ��Ч���룡
	timeout /t 3
	cls
	color 07
	goto begin
:restart_menu
	echo ���ʹ��е�RDP�����ж�һ��ʱ��
	set /p choice=�Ƿ�Ҫ������(y/n): 
	if %choice%==y goto restart
	if %choice%==n exit
	color 04
	echo ��Ч���룡
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
	echo ���ʹ��е�RDP���׶Ͽ����ӣ�
	set /p choice=�Ƿ�Ҫ������(y/n): 
	if %choice%==y goto kill
	if %choice%==n exit
	color 04
	echo ��Ч���룡
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