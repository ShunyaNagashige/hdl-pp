@echo off

rem �h���C�u���^�[�̕ύX
%~d0

rem �w��p�X�ֈړ�
cd %~p0

rem bin�f�B���N�g����path�ɒǉ�
path=.\bin;%path%;

rem �J�����g�f�B���N�g�����ړ�
rem cd .\bin
rem �R���p�C�� *.v -> a.out
if exist a.out del a.out
iverilog %1 %2 %3 %4 %5 %6 %7 %8 %9
if errorlevel 0 goto iv_ok
pause
goto end

:iv_ok
rem ���s a,out -> dump.vcd
if exist dump.vcd del dump.vcd
vvp a.out
if errorlevel 0 goto vvp_ok
pause
goto end

:vvp_ok
if exist dump.vcd goto run_gtk
pause
goto end

:run_gtk
rem gtkwave��gtk�̊��ϐ�����
.\pango\pango-querymodules.exe > .\etc\pango\pango.modules 2> nul

rem gtkwave�ɂ��g�`�̕\��
gtkwave.exe dump.vcd
if errorlevel 0 goto end
pause
goto end

:end
if exist dump.vcd del dump.vcd
if exist a.out del a.out

