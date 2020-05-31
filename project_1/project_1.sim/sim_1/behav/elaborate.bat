@echo off
<<<<<<< HEAD
set xv_path=E:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 0bd8e4f971914d9c91763b877ea9f543 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tanh_activation_function_tb_behav xil_defaultlib.tanh_activation_function_tb xil_defaultlib.glbl -log elaborate.log
=======
set xv_path=D:\\vivado\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 0bd8e4f971914d9c91763b877ea9f543 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot Softmax_tb_behav xil_defaultlib.Softmax_tb xil_defaultlib.glbl -log elaborate.log
>>>>>>> d7b5dfc926cbc15d6b6c19f180d20e990c22fc66
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
