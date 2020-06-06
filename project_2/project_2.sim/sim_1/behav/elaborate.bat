@echo off
set xv_path=D:\\Vivado\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 8c1ae150b43348a2b518771db0cdcfbf -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tanh_tb_behav xil_defaultlib.tanh_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
