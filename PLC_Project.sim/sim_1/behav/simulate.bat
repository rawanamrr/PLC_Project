@echo off
set xv_path=E:\\Lab\\Xillinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim tb_SkipADD_32bit_behav -key {Behavioral:sim_1:Functional:tb_SkipADD_32bit} -tclbatch tb_SkipADD_32bit.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
