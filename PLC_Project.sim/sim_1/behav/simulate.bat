@echo off
set xv_path=D:\\Programs\\Xillinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim tb_approx4x4Mult_behav -key {Behavioral:sim_1:Functional:tb_approx4x4Mult} -tclbatch tb_approx4x4Mult.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
