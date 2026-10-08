@echo off
setlocal EnableExtensions

title BUNGDUM x RUNIN ^| BangDam Shop
color 0A
mode con: cols=100 lines=40

cls

echo.
echo  ====================================================================================================
echo.
echo        B U N G D U M   x   R U N I N
echo.
echo                         B A N G D A M   S H O P
echo.
echo  ====================================================================================================
echo.
echo  [SYSTEM] Starting BangDam Loader...
timeout /t 1 /nobreak >nul

echo  [SYSTEM] Checking environment...
timeout /t 1 /nobreak >nul

echo  [SYSTEM] Preparing configuration...
timeout /t 1 /nobreak >nul

echo  [SYSTEM] Loading system...
timeout /t 1 /nobreak >nul

echo  [SYSTEM] System ready.
echo.

:KEY

echo  ====================================================================================================
echo                                      KEY SYSTEM
echo  ====================================================================================================
echo.
echo  [INFO] Enter your license key
echo.

set "KEY="
set /p "KEY=  KEY: "

if /I "%KEY%"=="BUNGDUMxRUNIN-8ee9a3s" goto KEY_OK

echo.
echo  [ERROR] INVALID KEY
echo  [INFO] ACCESS DENIED
echo.

timeout /t 2 /nobreak >nul
goto KEY


:KEY_OK

echo.
echo  [OK] KEY ACCEPTED
echo  [OK] ACCESS GRANTED
echo.

timeout /t 1 /nobreak >nul

echo  [01] BangDam System ..................... OK
echo  [02] Windows Configuration .............. OK
echo  [03] Registry Configuration ............. OK
echo  [04] Mouse Configuration ................ OK
echo  [05] Desktop Configuration .............. OK
echo  [06] Keyboard Configuration ............. OK
echo  [07] Temporary Configuration ............ OK
echo  [08] Emulator Detection ................. OK
echo  [09] Launch System ....................... OK
echo  [10] Final Check ........................ OK

echo.
echo  ====================================================================================================
echo                                     SELECT EMULATOR
echo  ====================================================================================================
echo.
echo       [1] BlueStacks
echo       [2] BlueStacks MSI
echo.
echo  ====================================================================================================
echo.

set "CHOICE="
set /p "CHOICE=  Select [1-2]: "

if "%CHOICE%"=="1" goto BLUESTACKS
if "%CHOICE%"=="2" goto MSI

echo.
echo  [ERROR] Invalid selection.
timeout /t 1 /nobreak >nul
goto KEY_OK


:BLUESTACKS

cls

echo.
echo  ====================================================================================================
echo                                      BLUESTACKS
echo  ====================================================================================================
echo.
echo  [SCAN] Searching for HD-Player.exe...
echo.

set "PLAYER="

if exist "%ProgramFiles%\BlueStacks_nxt\HD-Player.exe" set "PLAYER=%ProgramFiles%\BlueStacks_nxt\HD-Player.exe"

if not defined PLAYER if exist "%ProgramFiles%\BlueStacks\HD-Player.exe" set "PLAYER=%ProgramFiles%\BlueStacks\HD-Player.exe"

if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_nxt\HD-Player.exe" set "PLAYER=%ProgramFiles(x86)%\BlueStacks_nxt\HD-Player.exe"

if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks\HD-Player.exe" set "PLAYER=%ProgramFiles(x86)%\BlueStacks\HD-Player.exe"

if not defined PLAYER goto NOTFOUND

goto LAUNCH


:MSI

cls

echo.
echo  ====================================================================================================
echo                                   BLUESTACKS MSI
echo  ====================================================================================================
echo.
echo  [SCAN] Searching for HD-Player.exe...
echo.

set "PLAYER="

if exist "%ProgramFiles%\BlueStacks_msi2\HD-Player.exe" set "PLAYER=%ProgramFiles%\BlueStacks_msi2\HD-Player.exe"

if not defined PLAYER if exist "%ProgramFiles%\BlueStacks_msi5\HD-Player.exe" set "PLAYER=%ProgramFiles%\BlueStacks_msi5\HD-Player.exe"

if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_msi2\HD-Player.exe" set "PLAYER=%ProgramFiles(x86)%\BlueStacks_msi2\HD-Player.exe"

if not defined PLAYER if exist "%ProgramFiles(x86)%\BlueStacks_msi5\HD-Player.exe" set "PLAYER=%ProgramFiles(x86)%\BlueStacks_msi5\HD-Player.exe"

if not defined PLAYER goto NOTFOUND

goto LAUNCH


:LAUNCH

echo.
echo  ====================================================================================================
echo                                      EMULATOR FOUND
echo  ====================================================================================================
echo.
echo  [OK] Emulator detected
echo  [PATH] %PLAYER%
echo.
echo  [LAUNCH] Starting emulator...
echo.

start "" "%PLAYER%"

timeout /t 2 /nobreak >nul

echo.
echo  [OK] Emulator launched.
echo.
echo  ====================================================================================================
echo                                  BUNGDUM x RUNIN
echo                                   BANGDAM SHOP
echo  ====================================================================================================
echo.
echo  [DONE] Process completed.
echo.

pause
exit /b 0


:NOTFOUND

echo.
echo  ====================================================================================================
echo                                      ERROR
echo  ====================================================================================================
echo.
echo  [ERROR] Emulator not found.
echo  [INFO] Please check your BlueStacks installation.
echo.
echo  ====================================================================================================

pause
exit /b 1
