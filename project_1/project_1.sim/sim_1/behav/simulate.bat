@echo off
set xv_path=D:\\Vivado\\Vivado\\2015.2\\bin
call %xv_path%/xsim tanh_tb_behav -key {Behavioral:sim_1:Functional:tanh_tb} -tclbatch tanh_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
