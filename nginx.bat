cls
@ECHO OFF
CLS
color 0a

GOTO MENU
:MENU
ECHO.
ECHO.               =-=-=-=-=批处理菜单示例=-=-=-=-=
ECHO.
ECHO.                       1  启动Nginx
ECHO.
ECHO.                       2  停止Nginx
ECHO.
ECHO.                       3  查看Nginx
ECHO.
ECHO.                       4  退     出
ECHO.
ECHO. 
ECHO.
echo.                请输入选择项目的序号：
set /p  ID=
if "%id%"=="1" goto cmd1

if "%id%"=="2" goto cmd2

if "%id%"=="3" goto cmd3

IF "%id%"=="4"  exit
PAUSE

:cmd1

echo 启动Nginx...
start D:\APP\nginx-1.9.3\nginx.exe
goto MENU

:cmd2

echo 停止Nginx...
for /f "tokens=2" %i in ('tasklist ^| findstr nginx') do @taskkill /PID %i /F
GOTO MENU

:cmd3
echo 执行命令c
tasklist | findstr nginx
GOTO MENU




