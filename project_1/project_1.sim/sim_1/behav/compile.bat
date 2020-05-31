@echo off
<<<<<<< HEAD
set xv_path=E:\\Xilinx\\Vivado\\2015.2\\bin
echo "xvlog -m64 --relax -prj tanh_activation_function_tb_vlog.prj"
call %xv_path%/xvlog  -m64 --relax -prj tanh_activation_function_tb_vlog.prj -log compile.log
=======
set xv_path=D:\\vivado\\Vivado\\2015.2\\bin
echo "xvlog -m64 --relax -prj Softmax_tb_vlog.prj"
call %xv_path%/xvlog  -m64 --relax -prj Softmax_tb_vlog.prj -log compile.log
>>>>>>> d7b5dfc926cbc15d6b6c19f180d20e990c22fc66
if "%errorlevel%"=="1" goto END
if "%errorlevel%"=="0" goto SUCCESS
:END
exit 1
:SUCCESS
exit 0
