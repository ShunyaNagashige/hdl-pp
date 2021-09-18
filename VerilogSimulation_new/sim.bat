@echo off

rem ドライブレターの変更
%~d0

rem 指定パスへ移動
cd %~p0

rem binディレクトリをpathに追加
path=.\bin;%path%;

rem カレントディレクトリを移動
rem cd .\bin
rem コンパイル *.v -> a.out
if exist a.out del a.out
iverilog %1 %2 %3 %4 %5 %6 %7 %8 %9
if errorlevel 0 goto iv_ok
pause
goto end

:iv_ok
rem 実行 a,out -> dump.vcd
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
rem gtkwaveのgtkの環境変数整備
.\pango\pango-querymodules.exe > .\etc\pango\pango.modules 2> nul

rem gtkwaveにより波形の表示
gtkwave.exe dump.vcd
if errorlevel 0 goto end
pause
goto end

:end
if exist dump.vcd del dump.vcd
if exist a.out del a.out

