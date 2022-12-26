@echo off
set xv_path=E:\\Lab\\Xillinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim tb_accMult_8x8_behav -key {Behavioral:sim_1:Functional:tb_accMult_8x8} -tclbatch tb_accMult_8x8.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
