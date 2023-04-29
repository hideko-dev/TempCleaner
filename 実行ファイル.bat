:start

@echo off

for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

chcp 65001

cls

echo.
echo  %ESC%[42m[ TempDeleter v2 ]%ESC%[0m
echo.
echo  実行するオプションの番号を入力してください。
echo  Enter the number of the option you wish to run
echo.
echo =========================================================
echo  %ESC%[42m1.%ESC%[0m Automatically delete all temp files. (すべて自動で不要なファイルを削除します。) [Recommendation] [推奨しています。]
echo  %ESC%[43m2.%ESC%[0m Delete only the specified temp files. (指定した不要なファイルだけ削除します。)
echo =========================================================
echo.

SET /P ANSWER="Please enter number (番号を入力してください。): "

if /i {%ANSWER%}=={1} (goto :no1)
if /i {%ANSWER%}=={2} (goto :no2)

exit

:no1

title TempDeleter - Hello %USERNAME%.

echo   %ESC%[42m Temp Deleter Log: %ESC%[0m %ESC%[41m C:\Users\%USERNAME%\AppData\Local\Temp %ESC%[0m
rd %temp% /s /q

md %temp%

cls

echo   %ESC%[42m Temp Deleter Log: %ESC%[0m %ESC%[41m C:\Windows\Temp %ESC%[0m
del /S /Q C:\Windows\Temp

cls

echo   %ESC%[42m Temp Deleter Log: %ESC%[0m %ESC%[41m C:\Windows\Prefetch %ESC%[0m
del /S /Q C:\Windows\Prefetch

cls

title TempDeleter - Hello %USERNAME%.

echo.
echo  -------------------
echo  %ESC%[41m Deleted temp files. %ESC%[0m
echo  %ESC%[41m 不要ファイルを削除しました。 %ESC%[0m
echo  -------------------
echo.
echo  %ESC%[41m Deleted Files: %ESC%[0m
echo.
echo  1. C:\Windows\Prefetch (prefetch)
echo  2. C:\Users\%USERNAME%\AppData\Local\Temp (%temp%)
echo  3. C:\Windows\Temp (temp)
echo.
echo  Enter to Close... (エンターを押して閉じます。)
echo.
pause

:no2

echo.
echo  Coming Soon...
echo.

timeout 2 /nobreak >nul

goto :start
