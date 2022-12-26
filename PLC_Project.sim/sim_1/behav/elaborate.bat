@echo off
set xv_path=E:\\Lab\\Xillinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 1ba1becea8d54226a7bdd09e5cea07b9 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_accMult_8x8_behav xil_defaultlib.tb_accMult_8x8 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
