if "%1"=="hide" goto start
start mshta vbscript:createobject("wscript.shell").run("""%~0"" hide",0)(window.close)
start echo FRPS is running...
exit
:start
frpc.exe -c frpc.ini