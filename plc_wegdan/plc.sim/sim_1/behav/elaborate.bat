@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto a3250764669841179aa5ed6ddc61f36f -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot multiplierapprox88_tb_behav xil_defaultlib.multiplierapprox88_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
