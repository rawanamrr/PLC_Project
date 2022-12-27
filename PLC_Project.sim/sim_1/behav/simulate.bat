@echo off
set xv_path=E:\\Lab\\Xillinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim tb_accMult_16x16_behav -key {Behavioral:sim_1:Functional:tb_accMult_16x16} -tclbatch tb_accMult_16x16.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
