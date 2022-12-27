@echo off
set xv_path=E:\\Lab\\Xillinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim multiplieraccurate88_tb_behav -key {Behavioral:sim_1:Functional:multiplieraccurate88_tb} -tclbatch multiplieraccurate88_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
