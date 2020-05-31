@echo off
<<<<<<< HEAD
set xv_path=E:\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xsim tanh_activation_function_tb_behav -key {Behavioral:sim_1:Functional:tanh_activation_function_tb} -tclbatch tanh_activation_function_tb.tcl -log simulate.log
=======
set xv_path=D:\\vivado\\Vivado\\2015.2\\bin
call %xv_path%/xsim Softmax_tb_behav -key {Behavioral:sim_1:Functional:Softmax_tb} -tclbatch Softmax_tb.tcl -log simulate.log
>>>>>>> d7b5dfc926cbc15d6b6c19f180d20e990c22fc66
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
