if "%1"=="hide" goto start
start mshta vbscript:createobject("wscript.shell").run("""%~0"" hide",0)(window.close)
exit
:start
title frpc_ffm
frpc.exe -c frpc_ffm.ini