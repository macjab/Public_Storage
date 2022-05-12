@echo off
title FRPC
start frpc_ffm.cmd
echo FRPC F.F.M. is running...
start frpc_pek.cmd
echo FRPC P.E.K. is running...
start frpc_hk.cmd
echo FRPC H.K. is running...
timeout /t 3
exit