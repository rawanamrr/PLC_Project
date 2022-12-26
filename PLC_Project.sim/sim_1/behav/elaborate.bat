@echo off
set xv_path=D:\\Programs\\Xillinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 1ba1becea8d54226a7bdd09e5cea07b9 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_approx4x4Mult_behav xil_defaultlib.tb_approx4x4Mult -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
